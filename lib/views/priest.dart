import 'package:flutter/material.dart';
class Priest extends StatelessWidget {
  Widget infoText(String txt)
  {
    return Text(
      txt,
      style: TextStyle(
        fontSize: 20.0,
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Priest"),
        centerTitle: true,
        backgroundColor: Color(0xffa62627),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            color: Color(0xfff6d97d)
        ),

        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(

            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,

                children: <Widget>[
                  Text(
                    " The priests are graduated from TTD Vedapatasala from Tirumala.",
                    style: TextStyle(
                      color: Color(0xffa62627),
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  infoText('Sri D Hari Krishna (Main Priest)'),
                  infoText('Sri A.Vishnu Vardhan'),
                  infoText('Sri K Venkatesh'),
                  infoText('Sri N Satyanarayanacharyulu'),
                  infoText('Sri N Murali Mohana Krishna'),

                ],
              )

            ],
          ),
        ),
      ),

    );
  }
}
