import 'package:admin_balaji_temple_ahmedabad/views/events_grid_page.dart';
import 'package:admin_balaji_temple_ahmedabad/constants.dart';
import 'package:flutter/material.dart';

import '../constants.dart';

class YearBox extends StatelessWidget {
  YearBox({@required this.year, @required this.eventsList});
  final int year;
  final List eventsList;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: RaisedButton(
        color: mainColor,
        child: Text(
          year.toString(),
          style: kTitleTextStyle,
        ),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (BuildContext context) => EventsGrid(
                eventsList: eventsList,
              ),
            ),
          );
        },
      ),
    );
  }
}
