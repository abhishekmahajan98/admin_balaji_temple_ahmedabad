import 'package:admin_balaji_temple_ahmedabad/constants.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:marquee/marquee.dart';

import '../constants.dart';

final _firestore = Firestore.instance;

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  var top = 0.0;
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
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
        SliverList(
          delegate: SliverChildListDelegate([
            Container(
                decoration: BoxDecoration(
                  color: backgroundColor,
                ),
                child: Column(
                  children: <Widget>[
                    Container(
                        height: MediaQuery.of(context).size.height / 12,
                        width: MediaQuery.of(context).size.width,
                        color: Color(0xffa62627),
                        alignment: Alignment.center,
                        child: StreamBuilder(
                          stream: _firestore
                              .collection('updates')
                              .document('marque text')
                              .snapshots(),
                          builder: (context, snapshot) {
                            if (!snapshot.hasData) {
                              return Marquee(
                                text:
                                    'This is the official application for Sri Balaji Temple, Ahmedabad',
                                style: kTitleTextStyle,
                                scrollAxis: Axis.horizontal,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                blankSpace: 20.0,
                                velocity: 75.0,
                                //pauseAfterRound: Duration(seconds: 1),
                                startPadding: 20.0,
                                //accelerationDuration: Duration(seconds: 1),
                                //accelerationCurve: Curves.linear,
                                //decelerationDuration:Duration(milliseconds: 100),
                                //decelerationCurve: Curves.easeOut,
                              );
                            }
                            final marque_text = snapshot.data['text'];
                            return Marquee(
                              text: marque_text,
                              style: kTitleTextStyle,
                              scrollAxis: Axis.horizontal,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              blankSpace: 20.0,
                              velocity: 75.0,
                              //pauseAfterRound: Duration(seconds: 1),
                              startPadding: 20.0,
                              //accelerationDuration: Duration(seconds: 1),
                              //accelerationCurve: Curves.linear,
                              //decelerationDuration:Duration(milliseconds: 100),
                              //decelerationCurve: Curves.easeOut,
                            );
                          },
                        )),
                    SizedBox(
                      height: 5,
                    ),
                    StreamBuilder(
                      stream:
                          _firestore.collection('home carousel').snapshots(),
                      builder: (context, snapshot) {
                        if (!snapshot.hasData) {
                          return CarouselSlider(
                            height: 200,
                            enlargeCenterPage: true,
                            enableInfiniteScroll: true,
                            autoPlay: true,
                            autoPlayInterval: Duration(seconds: 1),
                            items: <Widget>[
                              Center(
                                child: CircularProgressIndicator(
                                  backgroundColor: mainColor,
                                ),
                              )
                            ],
                          );
                        }
                        final images = snapshot.data.documents;
                        List<Widget> imageList = [];
                        for (var image in images) {
                          imageList.add(
                            Image.network(
                              image.data['image_url'],
                              fit: BoxFit.cover,
                              loadingBuilder: (context, child, progress) {
                                return progress == null
                                    ? child
                                    : LinearProgressIndicator(
                                        backgroundColor: mainColor,
                                      );
                              },
                            ),
                          );
                        }
                        return CarouselSlider(
                          height: 200,
                          enlargeCenterPage: true,
                          enableInfiniteScroll: true,
                          autoPlay: true,
                          autoPlayInterval: Duration(seconds: 3),
                          items: imageList,
                        );
                      },
                    ),
                    StreamBuilder(
                      stream: _firestore
                          .collection('updates')
                          .document('upcoming event')
                          .snapshots(),
                      builder: (context, snapshot) {
                        if (!snapshot.hasData) {
                          return Card(
                            child: Column(
                              children: <Widget>[
                                Material(
                                  color: mainColor,
                                  child: ListTile(
                                    title: Center(
                                      child: CircularProgressIndicator(
                                        backgroundColor: backgroundColor,
                                      ),
                                    ),
                                  ),
                                ),
                                Container(
                                  child: Center(
                                    child: CircularProgressIndicator(
                                      backgroundColor: backgroundColor,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          );
                        }
                        final eventName = snapshot.data['event name'];
                        final eventImageUrl = snapshot.data['image_url'];
                        return Card(
                          child: Column(
                            children: <Widget>[
                              Material(
                                color: Color(0xffa62627),
                                child: ListTile(
                                  title: Center(
                                    child: Text(
                                      eventName,
                                      style: TextStyle(
                                        fontSize: 20,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                child: Image.network(
                                  eventImageUrl,
                                  fit: BoxFit.cover,
                                  loadingBuilder: (context, child, progress) {
                                    return progress == null
                                        ? child
                                        : LinearProgressIndicator(
                                            backgroundColor: mainColor,
                                          );
                                  },
                                ),
                              )
                            ],
                          ),
                        );
                      },
                    ),
                  ],
                ))
          ]),
        ),
      ],
    );
  }
}
/*
SliverList(
      delegate: SliverChildListDelegate([
        Container(
          height: MediaQuery.of(context).size.height / 10,
          width: MediaQuery.of(context).size.width,
          color: Color(0xffa62627),
          alignment: Alignment.center,
          child: Marquee(
            text: 'Some sample text that takes some space.',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.white,
              fontSize: 30.0,
            ),

            scrollAxis: Axis.horizontal,
            crossAxisAlignment: CrossAxisAlignment.start,
            blankSpace: 20.0,
            velocity: 100.0,
            pauseAfterRound: Duration(seconds: 1),
            startPadding: 10.0,
            accelerationDuration: Duration(seconds: 1),
            accelerationCurve: Curves.linear,
            decelerationDuration: Duration(milliseconds: 500),
            decelerationCurve: Curves.easeOut,
          ),
        ),
        SizedBox(
          height: 5,
        ),
        CarouselSlider.builder(
          enlargeCenterPage: true,
          enableInfiniteScroll: true,
          autoPlay: true,
          autoPlayInterval: Duration(seconds: 3),
          itemCount: homeCarouselImages.length,
          itemBuilder: (BuildContext context, int itemIndex) => Container(
            height: 200,
            child: Image.asset(
              homeCarouselImages[itemIndex],
              fit: BoxFit.cover,
            ),
          ),
        ),
        Card(
          child: Column(
            children: <Widget>[
              Material(
                color: Color(0xffa62627),
                child: ListTile(
                  title: Center(
                    child: Text(
                      'Next Main Event',
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                ),
              ),
              Container(
                child: Image.asset('assets/images/balaji4.jpg'),
              )
            ],
          ),
        ),
      ]),
    );*/
