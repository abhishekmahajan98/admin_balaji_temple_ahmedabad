import 'package:admin_balaji_temple_ahmedabad/views/events_photos_page.dart';
import 'package:flutter/material.dart';

import '../constants.dart';

class EventsGrid extends StatefulWidget {
  EventsGrid({@required this.eventsList});
  final List eventsList;

  @override
  _EventsGridState createState() => _EventsGridState();
}

class _EventsGridState extends State<EventsGrid> {
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
          SliverGrid(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
            ),
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: RaisedButton(
                    color: mainColor,
                    child: Text(
                      widget.eventsList[index]['title'].toString(),
                      style: kTitleTextStyle,
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (BuildContext context) => EventPhotosGrid(
                            eventName: widget.eventsList[index]['title'],
                            eventPhotosUrlList: widget.eventsList[index]
                                ['images_url'],
                          ),
                        ),
                      );
                    },
                  ),
                );
              },
              childCount: widget.eventsList.length,
            ),
          ),
        ],
      ),
    );
  }
}
