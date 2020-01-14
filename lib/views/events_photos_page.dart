import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

import '../constants.dart';

class EventPhotosGrid extends StatefulWidget {
  EventPhotosGrid(
      {@required this.eventPhotosUrlList, @required this.eventName});
  final List eventPhotosUrlList;
  final String eventName;

  @override
  _EventPhotosGridState createState() => _EventPhotosGridState();
}

class _EventPhotosGridState extends State<EventPhotosGrid> {
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
              crossAxisCount: 3,
            ),
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return Container(
                  margin: EdgeInsets.symmetric(
                    horizontal: 5,
                    vertical: 2.5,
                  ),
                  width: MediaQuery.of(context).size.width * 0.4,
                  height: MediaQuery.of(context).size.height * 10,
                  child: GestureDetector(
                    onTap: () {
                      Alert(
                        context: context,
                        title: widget.eventName.toString(),
                        content: Container(
                          child: Image.network(
                            widget.eventPhotosUrlList[index].toString(),
                            height: 300,
                            width: 300,
                            fit: BoxFit.fill,
                            loadingBuilder: (context, child, progress) {
                              return progress == null
                                  ? child
                                  : LinearProgressIndicator(
                                      backgroundColor: mainColor,
                                    );
                            },
                          ),
                        ),
                        buttons: [],
                        closeFunction: () {},
                      ).show();
                    },
                    child: Image.network(
                      widget.eventPhotosUrlList[index].toString(),
                      fit: BoxFit.fill,
                      loadingBuilder: (context, child, progress) {
                        return progress == null
                            ? child
                            : LinearProgressIndicator(
                                backgroundColor: mainColor,
                              );
                      },
                    ),
                  ),
                );
              },
              childCount: widget.eventPhotosUrlList.length,
            ),
          ),
        ],
      ),
    );
  }
}
