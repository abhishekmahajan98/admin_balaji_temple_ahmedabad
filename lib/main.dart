import 'package:admin_balaji_temple_ahmedabad/views/awards_page.dart';
import 'package:admin_balaji_temple_ahmedabad/views/dharmakarthas_words_page.dart';
import 'package:admin_balaji_temple_ahmedabad/views/facilities_page.dart';
import 'package:admin_balaji_temple_ahmedabad/views/home_page.dart';
import 'package:admin_balaji_temple_ahmedabad/views/trusties_page.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Balaji Temple, Ahmedabad',
      routes: {
        '/': (context) => HomePage(),
        '/trustees': (context) => TrusteesPage(),
        '/dharmakarthas_words_page': (context) => DharmakarthasWordsPage(),
        '/facilities_page': (context) => FacilitiesPage(),
        '/awards_page': (context) => AwardsAndAppreciationPage(),
      },
    );
  }
}
