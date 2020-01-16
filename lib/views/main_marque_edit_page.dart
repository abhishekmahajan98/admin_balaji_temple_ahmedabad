import 'package:admin_balaji_temple_ahmedabad/constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

final _firestore = Firestore.instance;

class MarqueEditPage extends StatefulWidget {
  @override
  _MarqueEditPageState createState() => _MarqueEditPageState();
}

class _MarqueEditPageState extends State<MarqueEditPage> {
  String new_text = '';
  var batch = _firestore.batch();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: backgroundColor,
        appBar: AppBar(
          title: Text('Edit Marque Text'),
          centerTitle: true,
          backgroundColor: mainColor,
        ),
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextFormField(
                onChanged: (value) {
                  setState(() {
                    new_text = value;
                  });
                },
                decoration: InputDecoration(
                  hintText: 'Enter the new text.',
                  hintStyle: TextStyle(
                    color: mainColor,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 30),
                child: RaisedButton(
                  color: mainColor,
                  onPressed: () {
                    if (new_text != null && new_text != '') {
                      batch.updateData(
                        _firestore
                            .collection('updates')
                            .document('marque text'),
                        {
                          'text': new_text,
                        },
                      );
                      batch.commit();
                      Navigator.pop(context);
                    }
                  },
                  child: Text(
                    'Update text',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
