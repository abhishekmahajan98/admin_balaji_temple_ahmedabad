import 'dart:io';

import 'package:admin_balaji_temple_ahmedabad/components/carousel_list_tile.dart';
import 'package:admin_balaji_temple_ahmedabad/constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:uuid/uuid.dart';

final _firestore = Firestore.instance;

class HomeCarouselEditPage extends StatefulWidget {
  @override
  _HomeCarouselEditPageState createState() => _HomeCarouselEditPageState();
}

class _HomeCarouselEditPageState extends State<HomeCarouselEditPage> {
  String _path;
  String _extension;
  FileType _pickType = FileType.IMAGE;
  bool showSpinner = false;
  var uuid = Uuid();
  void openFileExplorer() async {
    try {
      _path = null;
      _path = await FilePicker.getFilePath(
          type: _pickType, fileExtension: _extension);

      uploadToFirebase();
    } catch (e) {
      print("Unsupported operation" + e.toString());
    }
    if (!mounted) return;
  }

  uploadToFirebase() {
    String fileName = _path.split('/').last;
    String filePath = _path;
    upload("home_carousel_images/" + fileName, filePath);
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
        _firestore.collection('home carousel').document().setData({
          'image_url': url.toString(),
          'id': uuid.v1().split('-')[0],
          'upload_date': DateTime.now(),
        });
        Alert(
            context: context,
            title: 'File Upload Successful',
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
            ]).show();
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
            ]).show();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: showSpinner,
      child: Scaffold(
        backgroundColor: backgroundColor,
        appBar: AppBar(
          title: Text('Edit Carousel images'),
          centerTitle: true,
          backgroundColor: mainColor,
        ),
        body: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: <Widget>[
              Flexible(
                child: ListView(
                  children: <Widget>[
                    InkWell(
                      onTap: () {
                        openFileExplorer();
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: mainColor,
                          ),
                        ),
                        child: ListTile(
                          title: Icon(
                            Icons.add_circle,
                            color: mainColor,
                          ),
                        ),
                      ),
                    ),
                    StreamBuilder(
                      stream:
                          _firestore.collection('home carousel').snapshots(),
                      builder: (context, snapshot) {
                        if (!snapshot.hasData) {
                          return Center(
                            child: CircularProgressIndicator(),
                          );
                        }
                        final imageDocuments = snapshot.data.documents;
                        List<CarouselListTile> carouselImages = [];
                        for (var document in imageDocuments) {
                          final imageUrl = document.data['image_url'];
                          final imageId = document.data['id'];
                          final timestamp = document.data['upload_date'];
                          final DateTime imageUploadDate = timestamp.toDate();
                          carouselImages.add(
                            CarouselListTile(
                              imageId: imageId,
                              imageUrl: imageUrl,
                              imageUploadDate: imageUploadDate,
                              delFn: () async {
                                setState(() {
                                  showSpinner = true;
                                });
                                QuerySnapshot querySnapshot = await _firestore
                                    .collection('home carousel')
                                    .where('id', isEqualTo: imageId)
                                    .getDocuments();
                                for (var doc in querySnapshot.documents) {
                                  final url = doc.data['image_url'];
                                  doc.reference.delete();
                                  StorageReference imgref =
                                      await FirebaseStorage.instance
                                          .getReferenceFromUrl(url);
                                  imgref.delete();
                                }
                                setState(() {
                                  showSpinner = false;
                                });
                              },
                            ),
                          );
                        }
                        return Column(
                          children: carouselImages,
                        );
                      },
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
