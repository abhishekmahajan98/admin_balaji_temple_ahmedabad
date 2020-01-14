import 'package:admin_balaji_temple_ahmedabad/components/long_texts.dart';
import 'package:admin_balaji_temple_ahmedabad/constants.dart';
import 'package:flutter/material.dart';

import '../constants.dart';

class FacilitiesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: mainColor,
        title: Text('Facilities at Temple'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
        child: ListView(
          children: <Widget>[
            facilities_long_text1,
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Accommodations Rooms',
                  style: kBlackTitleTextStyle,
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50),
              child: Divider(
                thickness: 3,
                color: Colors.black,
              ),
            ),
            Text(
              'Both AC and Non AC Rooms Available',
              style: kParaTextStyle,
              textAlign: TextAlign.justify,
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  width: MediaQuery.of(context).size.width * 0.8,
                  child: Text(
                    'Marriage/Function Hall',
                    textAlign: TextAlign.center,
                    style: kBlackTitleTextStyle,
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50),
              child: Divider(
                thickness: 3,
                color: Colors.black,
              ),
            ),
            Text(
              'Marriage /Function Halls are available in Temple Complex.',
              style: kParaTextStyle,
              textAlign: TextAlign.justify,
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Vakula Devi Canteen',
                  style: kBlackTitleTextStyle,
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50),
              child: Divider(
                thickness: 3,
                color: Colors.black,
              ),
            ),
            facilities_long_text2,
          ],
        ),
      ),
    );
  }
}
