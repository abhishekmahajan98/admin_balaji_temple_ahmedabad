import 'package:admin_balaji_temple_ahmedabad/constants.dart';
import 'package:flutter/material.dart';

class TrusteesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        title: Text('Trustees and Priests'),
        centerTitle: true,
        backgroundColor: mainColor,
      ),
      body: ListView(
        //mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          SizedBox(
            height: 30,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'Trustees',
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
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      '1. Sri K.Subbarayudu (Dharmakartha)',
                      style: kParaTextStyle,
                    ),
                    Text(
                      '2. Sri M.Punna Rao',
                      style: kParaTextStyle,
                    ),
                    Text(
                      '3. Sri N.Bose Babu',
                      style: kParaTextStyle,
                    ),
                    Text(
                      '4. Sri V.S.Gopala Krishna',
                      style: kParaTextStyle,
                    ),
                    Text(
                      '5. Sri P.V.P.C.Prasad',
                      style: kParaTextStyle,
                    ),
                    Text(
                      '6. Sri P.Venkata Ramana',
                      style: kParaTextStyle,
                    ),
                    Text(
                      '7. Smt. Binita Shah',
                      style: kParaTextStyle,
                    ),
                    Text(
                      '8. Sri Rajeev Bhandari',
                      style: kParaTextStyle,
                    ),
                    Text(
                      '9. Sri D.R.M.Samudraiah',
                      style: kParaTextStyle,
                    ),
                    Text(
                      '10. Sri G.Satyanarayana',
                      style: kParaTextStyle,
                    ),
                    Text(
                      '11. Sri B.Koti Reddy',
                      style: kParaTextStyle,
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'Priests',
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
              Padding(
                padding: const EdgeInsets.all(20),
                child: Container(
                  child: Text(
                    'All the priests are graduated from TTD Vedapatasala from Tirumala.',
                    style: kParaTextStyle,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      '1. Sri D Hari Krishna (Main Priest)',
                      style: kParaTextStyle,
                    ),
                    Text(
                      '2. Sri A.Vishnu Vardhan',
                      style: kParaTextStyle,
                    ),
                    Text(
                      '3. Sri K Venkatesh',
                      style: kParaTextStyle,
                    ),
                    Text(
                      '4. Sri N Satyanarayanacharyulu',
                      style: kParaTextStyle,
                    ),
                    Text(
                      '5. Sri N Murali Mohana Krishna',
                      style: kParaTextStyle,
                    )
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
