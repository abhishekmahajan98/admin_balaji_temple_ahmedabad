import 'dart:io';
import 'package:admin_balaji_temple_ahmedabad/constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:uuid/uuid.dart';

final _firestore = Firestore.instance;

class NextEventPage extends StatefulWidget {
  @override
  _NextEventPageState createState() => _NextEventPageState();
}

class _NextEventPageState extends State<NextEventPage> {
  String new_title;
  String _path;
  String _extension;
  FileType _pickType = FileType.IMAGE;
  bool showSpinner = false;
  var uuid = Uuid();
  var batch = _firestore.batch();
  void openFileExplorer() async {
    try {
      _path = null;
      _path = await FilePicker.getFilePath(
          type: _pickType, fileExtension: _extension);
      if (_path != null) {
        uploadToFirebase();
      }
    } catch (e) {
      print("Unsupported operation" + e.toString());
    }
    if (!mounted) return;
  }

  uploadToFirebase() {
    String fileName = _path.split('/').last;
    String filePath = _path;
    upload("next_event_image/" + fileName, filePath);
  }

  upload(fileName, filePath) async {
    _extension = fileName.toString().split('.').last;
    StorageReference storageRef =
        FirebaseStorage.instance.ref().child(fileName);
    final StorageUploadTask uploadTask = storageRef.putFile(
      File(filePath),
      StorageMetadata(
        contentType: '$_pickType/$_extension',
      ),
    );
    setState(() {
      showSpinner = true;
    });
    StorageTaskSnapshot storageTaskSnapshot = await uploadTask.onComplete;
    setState(() {
      showSpinner = false;
    });
    if (uploadTask.isComplete) {
      if (uploadTask.isSuccessful) {
        final url = await storageRef.getDownloadURL();
        final doc = await _firestore
            .collection('updates')
            .document('upcoming event')
            .get();
        String lasturl = doc.data['image_url'];
        batch.updateData(
            _firestore.collection('updates').document('upcoming event'), {
          'image_url': url.toString(),
          'id': uuid.v1().split('-')[0],
        });
        batch.commit();
        StorageReference imgref =
            await FirebaseStorage.instance.getReferenceFromUrl(lasturl);
        imgref.delete();
        Alert(
          context: context,
          title: 'File Upload Successful',
          closeFunction: () {
            Navigator.pop(context);
          },
          buttons: [
            DialogButton(
              color: mainColor,
              onPressed: () {
                Navigator.pop(context);
                Navigator.pop(context);
              },
              child: Text(
                'Okay',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ).show();
      } else {
        Alert(
          context: context,
          type: AlertType.error,
          title: 'Error in uploading the image.',
          desc: 'Please check your internet connection or try later.',
          closeFunction: () {},
          buttons: [
            DialogButton(
              color: mainColor,
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text(
                'Okay',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ).show();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        title: Text('Edit Next event'),
        centerTitle: true,
        backgroundColor: mainColor,
      ),
      body: ModalProgressHUD(
        inAsyncCall: showSpinner,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text(
                'Upcoming Event',
                style: kParaTextStyle,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 30),
                child: StreamBuilder(
                  stream: _firestore
                      .collection('updates')
                      .document('upcoming event')
                      .snapshots(),
                  builder: (context, snapshot) {
                    if (!snapshot.hasData) {
                      return CircularProgressIndicator(
                        backgroundColor: mainColor,
                      );
                    }
                    return ListTile(
                      leading: Image.network(
                        snapshot.data['image_url'],
                        height: 100,
                        fit: BoxFit.contain,
                        loadingBuilder: (context, child, progress) {
                          return progress == null
                              ? child
                              : CircularProgressIndicator(
                                  backgroundColor: mainColor,
                                );
                        },
                      ),
                      title: Text(snapshot.data['event name'].toString()),
                    );
                  },
                ),
              ),
              Text(
                'Edit upcoming Event',
                style: kParaTextStyle,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  onChanged: (value) {
                    setState(() {
                      new_title = value;
                    });
                  },
                  maxLength: 20,
                  decoration: InputDecoration(
                    hintText: 'Enter the new event title.',
                    hintStyle: TextStyle(
                      color: mainColor,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: RaisedButton(
                  color: mainColor,
                  onPressed: () {
                    if (new_title != null && new_title != '') {
                      _firestore
                          .collection('updates')
                          .document('upcoming event')
                          .updateData({
                        'event name': new_title,
                      });
                      Alert(
                        context: context,
                        title: 'Event title updated!',
                        closeFunction: () {},
                        buttons: [
                          DialogButton(
                            color: mainColor,
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: Text(
                              'okay',
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ).show();
                    }
                  },
                  child: Text(
                    'Confirm event title',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: RaisedButton(
                  color: mainColor,
                  onPressed: () {
                    setState(() {
                      openFileExplorer();
                    });
                  },
                  child: Text(
                    'Select Image',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
