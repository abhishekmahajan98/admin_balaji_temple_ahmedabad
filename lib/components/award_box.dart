import 'package:admin_balaji_temple_ahmedabad/constants.dart';
import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class AwardBox extends StatelessWidget {
  AwardBox({@required this.awardTitle, @required this.awardImageUrl});
  final String awardImageUrl;
  final String awardTitle;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: () {
          Alert(
            context: context,
            title: awardTitle,
            content: Container(
              child: Image.network(
                awardImageUrl,
                fit: BoxFit.cover,
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
          awardImageUrl,
          fit: BoxFit.cover,
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
  }
}
