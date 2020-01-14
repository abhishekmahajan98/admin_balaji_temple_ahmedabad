import 'package:admin_balaji_temple_ahmedabad/components/home_carousel_images.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import 'long_texts.dart';

class AboutPage extends StatefulWidget {
  @override
  _AboutPageState createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  var top = 0.0;
  List<Marker> allMarkersList = [
    Marker(
      markerId: MarkerId('Sri Balaji Temple Ahmedabad'),
      position: LatLng(23.1276, 72.5384),
      draggable: false,
      infoWindow: InfoWindow(title: 'Sri Balaji Temple, Ahmedabad'),
    ),
  ];

  _launchFacebookURL() async {
    const url = "https://www.facebook.com/balajitemple.org/";
    launch(url);
  }

  _launchYoutubeURL() async {
    const url = "https://www.youtube.com/watch?v=JqAf-F2iD0c";
    launch(url);
  }

  _launchWebsiteURL() async {
    const url = "https://balajitemple.org/";
    launch(url);
  }

  Widget infoRow(String key, String value) {
    return Row(
      children: <Widget>[
        Expanded(
          flex: 2,
          child: Text(
            key,
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
            ),
          ),
        ),
        Expanded(
          flex: 5,
          child: Text(
            value,
            style: TextStyle(
              color: Colors.white,
              fontSize: 15,
            ),
          ),
        )
      ],
    );
  }

  Widget infoText(String txt) {
    return Text(
      txt,
      style: TextStyle(
        color: Colors.white,
        fontSize: 15.0,
      ),
    );
  }

  Widget infoIcon(Icon icon, Function func) {
    return Row(
      children: <Widget>[
        GestureDetector(
          onTap: () {
            func();
          },
          child: icon,
        ),
        SizedBox(
          width: 20,
        ),
      ],
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
        SliverList(
          delegate: SliverChildListDelegate([
            Container(
              decoration: BoxDecoration(
                color: Color(0XFFf6d97d),
              ),
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: 5,
                  ),
                  CarouselSlider.builder(
                    enlargeCenterPage: true,
                    enableInfiniteScroll: true,
                    autoPlay: true,
                    autoPlayInterval: Duration(seconds: 3),
                    itemCount: aboutCarouselImages.length,
                    itemBuilder: (BuildContext context, int itemIndex) =>
                        Container(
                      height: 200,
                      child: Image.asset(
                        aboutCarouselImages[itemIndex],
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: aboutText,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      color: Color(0xffa62627),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Container(
                            height: 200,
                            width: 400,
                            child: GoogleMap(
                              mapType: MapType.normal,
                              compassEnabled: true,
                              myLocationButtonEnabled: true,
                              onMapCreated: (controller) {},
                              initialCameraPosition: CameraPosition(
                                target: LatLng(23.1276, 72.5384),
                                zoom: 15,
                              ),
                              markers: Set.from(allMarkersList),
                            ),
                          ),
                          Text(
                            'Follow Us:',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 30.0,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 20, right: 20),
                            child: Row(
                              children: <Widget>[
                                infoIcon(
                                    Icon(
                                      FontAwesomeIcons.facebook,
                                      color: Colors.white,
                                      size: 60,
                                    ),
                                    _launchFacebookURL),
                                infoIcon(
                                    Icon(
                                      FontAwesomeIcons.youtube,
                                      color: Colors.white,
                                      size: 60,
                                    ),
                                    _launchYoutubeURL),
                                infoIcon(
                                    Icon(
                                      FontAwesomeIcons.globe,
                                      color: Colors.white,
                                      size: 60,
                                    ),
                                    _launchWebsiteURL),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          Text(
                            'Contact Us:',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 30.0,
                            ),
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Expanded(
                                flex: 2,
                                child: Text(
                                  'Address: ',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20.0,
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 5,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    infoText('Opp. Nirma University,'),
                                    infoText(' S.G.Highway, Chharodi,'),
                                    infoText('Ahmedabad – 382 481,'),
                                    infoText('India,'),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          infoRow('Phone:', '+91-7405060867/865'),
                          SizedBox(
                            height: 20,
                          ),
                          infoRow('E-mail:', 'balajitemple.amd@gmail.com')
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ]),
        ),
      ],
    );
  }
}
