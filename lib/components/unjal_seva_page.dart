import 'package:admin_balaji_temple_ahmedabad/models/unjal_seva_map.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sticky_header/flutter_sticky_header.dart';

class UnjalSevaPage extends StatefulWidget {
  @override
  _UnjalSevaPageState createState() => _UnjalSevaPageState();
}

class _UnjalSevaPageState extends State<UnjalSevaPage> {
  var top = 0.0;
  SliverStickyHeader stickyListWidget(String month) {
    return SliverStickyHeader(
      header: Container(
        height: MediaQuery.of(context).size.height / 12,
        decoration: BoxDecoration(
          color: Color(0xffa62627),
        ),
        padding: EdgeInsets.symmetric(horizontal: 16.0),
        child: Center(
          child: Text(
            month,
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
            ),
          ),
        ),
      ),
      sliver: SliverList(
        delegate: SliverChildBuilderDelegate(
          (context, i) => Container(
            decoration: BoxDecoration(color: Color(0xfff6d97d)),
            child: Column(
              children: <Widget>[
                ListTile(
                  leading: Container(
                    width: MediaQuery.of(context).size.width * 0.33,
                    child: Text(unjalSevaMap[month][i]['date']),
                  ),
                  title: Container(
                    width: MediaQuery.of(context).size.width * 0.66,
                    child: Text(unjalSevaMap[month][i]['name']),
                  ),
                ),
                Divider(),
              ],
            ),
          ),
          childCount: unjalSevaMap[month].length,
        ),
      ),
    );
  }

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
        stickyListWidget('JANUARY 2020'),
      ],
    );
  }
}
