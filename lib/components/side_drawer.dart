import 'package:flutter/material.dart';

class SideDrawer extends StatelessWidget {
  Widget infoText(String txt) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Text(
          txt,
          style: TextStyle(
            color: Colors.white,
            fontSize: 20.0,
          ),
        ),
        Divider(
          height: 10,
          color: Colors.black,
        ),
      ],
    );
  }

  Widget drawerMember(String txt, Function func) {
    return InkWell(
      onTap: func,
      child: ListTile(
        title: infoText(txt),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        decoration: BoxDecoration(
          color: Color(0xffa62627),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            drawerMember('Trustees and Priests', () {
              Navigator.pushNamed(context, '/trustees');
            }),
            drawerMember('Awards and Appreciations', () {
              Navigator.pushNamed(context, '/awards_page');
            }),
            drawerMember('Facilites at Temple', () {
              Navigator.pushNamed(context, '/facilities_page');
            }),
            drawerMember('Festivals celebrated at The Temple', () {
              Navigator.pushNamed(context, '/');
            }),
            drawerMember('DHARMAKARTHAS WORDS', () {
              Navigator.pushNamed(context, '/dharmakarthas_words_page');
            }),
            drawerMember('SOCIAL SERVICE UNIT', () {
              Navigator.pushNamed(context, '/');
            }),
          ],
        ),
      ),
    );
  }
}
