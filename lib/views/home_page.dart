import 'package:admin_balaji_temple_ahmedabad/components/about_page.dart';
import 'package:admin_balaji_temple_ahmedabad/components/darshan_time_page.dart';
import 'package:admin_balaji_temple_ahmedabad/components/gallery.dart';
import 'package:admin_balaji_temple_ahmedabad/components/main_page.dart';
import 'package:admin_balaji_temple_ahmedabad/components/side_drawer.dart';
import 'package:admin_balaji_temple_ahmedabad/components/unjal_seva_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  final List<String> _pageTitles = [
    'Home',
    'About',
    'Darshan',
    'Gallery',
    'Unjal Seva'
  ];
  final List<Widget> _pages = [
    MainPage(),
    AboutPage(),
    DarshanTimePage(),
    GalleryPage(),
    UnjalSevaPage(),
  ];
  BottomNavigationBarItem _buildNavigationItem(
      int index, IconData iconData, String text) {
    return BottomNavigationBarItem(
      icon: Icon(iconData, color: Colors.white),
      activeIcon: Icon(
        iconData,
        color: Color(0xfff6d97d),
      ),
      title: Text(
        text,
        style: TextStyle(
          color: _selectedIndex == index ? Color(0xfff6d97d) : Colors.white,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        drawer: SideDrawer(),
        body: _pages[_selectedIndex],
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Color(0xffa62627),
          onTap: (index) {
            setState(() {
              _selectedIndex = index;
            });
          },
          currentIndex: _selectedIndex,
          type: BottomNavigationBarType.fixed,
          items: <BottomNavigationBarItem>[
            _buildNavigationItem(0, Icons.home, _pageTitles[0]),
            _buildNavigationItem(1, Icons.info, _pageTitles[1]),
            _buildNavigationItem(2, FontAwesomeIcons.eye, _pageTitles[2]),
            _buildNavigationItem(3, Icons.photo, _pageTitles[3]),
            _buildNavigationItem(
                4, FontAwesomeIcons.prayingHands, _pageTitles[4]),
          ],
        ),
      ),
    );
  }
}
