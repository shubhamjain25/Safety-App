import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:safety_app/screens/helpline_page.dart';
import 'package:safety_app/screens/video_screen.dart';
import 'package:safety_app/services/calling_service.dart';
import 'package:safety_app/services/geolocator_service.dart';
import 'package:safety_app/widgets/category_card.dart';
import 'package:share/share.dart';

class FeaturesPage extends StatelessWidget {

  var locationMessage = "";
  void getLocation() async{
    Position position = await GeoLocatorService().determinePosition();
    final String locationMessage="My Longitude: ${position.latitude}, Latitude: ${position.longitude}";
    final String text="Please Help Me! "+locationMessage;
    final String subject = "SOS";
    Share.share(text, subject:subject);
    print(locationMessage);
  }

  void makeEmergencyCall(String phNo) async{
    var call = CallingService();
    await call.callNumber(phNo);
  }

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      padding: EdgeInsets.only(bottom: 30.0),
      physics: BouncingScrollPhysics(),
      crossAxisCount: 2,
      childAspectRatio: 1.05,
      crossAxisSpacing: 25,
      mainAxisSpacing: 20,
      children: <Widget>[
        CategoryCard(
          title: "Call 100",
          svgSrc: "assets/images/police.png",
          press: () {
            makeEmergencyCall("100");
          },
        ),
        CategoryCard(
          title: "Police Station",
          svgSrc: "assets/images/distance.png",
          press: () {},
        ),
        CategoryCard(
          title: "Live Location",
          svgSrc: "assets/images/location.png",
          press: (){
            getLocation();
          },
        ),
        CategoryCard(
          title: "Helpline Numbers",
          svgSrc: "assets/images/helpline.png",
          press: () {
            Navigator.push(context, MaterialPageRoute(builder:(context)=>HelplinePage()));
          },
        ),
        CategoryCard(
          title: "Self Defense",
          svgSrc: "assets/images/discrimination.png",
          press: () {
            Navigator.push(context, MaterialPageRoute(builder:(context)=>YoutubePlayerDemoApp()));
          },
        ),
        CategoryCard(
          title: "Edit Profile",
          svgSrc: "assets/images/resume.png",
          press: () {

          },
        ),
      ],
    );
  }
}