import 'package:admin_balaji_temple_ahmedabad/components/award_box.dart';
import 'package:admin_balaji_temple_ahmedabad/constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

final _firestore = Firestore.instance;

class AwardsAndAppreciationPage extends StatefulWidget {
  @override
  _AwardsAndAppreciationPageState createState() =>
      _AwardsAndAppreciationPageState();
}

class _AwardsAndAppreciationPageState extends State<AwardsAndAppreciationPage> {
  var top = 0.0;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: backgroundColor,
      ),
      child: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            expandedHeight: MediaQuery.of(context).size.height / 5,
            floating: false,
            pinned: true,
            backgroundColor: Color(0xffa62627),
            flexibleSpace: LayoutBuilder(
              builder: (BuildContext context, BoxConstraints constraints) {
                top = constraints.biggest.height;
                return FlexibleSpaceBar(
                  background: Image.asset(
                    'assets/images/sunrays.jpg',
                    fit: BoxFit.cover,
                  ),
                  title: top > 80
                      ? Container(
                          width: MediaQuery.of(context).size.width / 2,
                          child: Image.asset(
                            'assets/images/logo/logo.png',
                            fit: BoxFit.cover,
                          ),
                        )
                      : Text('Balaji Temple,Ahmedabad'),
                  centerTitle: true,
                );
              },
            ),
          ),
          StreamBuilder(
            stream: _firestore.collection('awards').snapshots(),
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return SliverFillRemaining(
                  child: Center(
                    child: CircularProgressIndicator(
                      backgroundColor: mainColor,
                    ),
                  ),
                );
              }
              final awardsDocuments = snapshot.data.documents;
              List<AwardBox> awards = [];
              for (var document in awardsDocuments) {
                final awardTitle = document.data['title'];
                final awardImageUrl = document.data['image_url'];
                awards.add(
                  AwardBox(
                    awardTitle: awardTitle,
                    awardImageUrl: awardImageUrl,
                  ),
                );
              }
              return SliverGrid(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                ),
                delegate: SliverChildListDelegate(awards),
              );
            },
          ),
        ],
      ),
    );
  }
}
