import 'package:admin_balaji_temple_ahmedabad/components/long_texts.dart';
import 'package:admin_balaji_temple_ahmedabad/constants.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class DharmakarthasWordsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: mainColor,
        title: Text('Dharmakartha\'s Words'),
        centerTitle: true,
      ),
      body: ListView(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(15),
            child: Row(
              children: <Widget>[
                Image.asset(
                  'assets/images/dharmakartha.png',
                  height: MediaQuery.of(context).size.height / 4,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'K.Subbarayudu,',
                        style: TextStyle(
                          fontSize: MediaQuery.of(context).size.height / 28,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'Dharmakarta',
                        style: TextStyle(
                          color: mainColor,
                          fontSize: MediaQuery.of(context).size.height / 32,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Container(
                        child: Text(
                          'Sri Balaji Temple Trust',
                          style: TextStyle(
                            color: mainColor,
                            fontSize: MediaQuery.of(context).size.height / 40,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15),
            child: dharmakarthaswords,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                FlatButton(
                  onPressed: () {
                    launch('https://balajitemple.org/dharmakarthas-words/');
                  },
                  child: Text(
                    'Read more..',
                    style: TextStyle(
                      color: Colors.blue,
                      fontSize: 20,
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
