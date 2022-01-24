import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:provider/provider.dart';
import 'package:safety_app/screens/edit_profile_page.dart';
import 'package:safety_app/screens/fake_call.dart';
import 'package:safety_app/screens/helpline_page.dart';
import 'package:safety_app/screens/location_page.dart';
import 'package:safety_app/screens/location_change_page.dart';
import 'package:safety_app/screens/modify_profile_page.dart';
import 'package:safety_app/screens/video_screen.dart';
import 'package:safety_app/services/application_bloc.dart';
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
          title: "Show Location",
          svgSrc: "assets/images/distance.png",
          press: () {
            Navigator.push(context, MaterialPageRoute(builder:(context)=>LocationChangeListener()));
          },
        ),
        CategoryCard(
          title: "Share Location",
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
          title: "Call Ambulance",
          svgSrc: "assets/images/ambulance.png",
          press: () {
            makeEmergencyCall("102");
          },
        ),
        CategoryCard(
          title: "Edit Profile",
          svgSrc: "assets/images/edit.png",
          press: () {
            Navigator.push(context, MaterialPageRoute(builder:(context)=>ModifyProfile()));
          },
        ),
        CategoryCard(
          title: "Fake Call",
          svgSrc: "assets/images/telephone-call.png",
          press: () {
            Navigator.push(context, MaterialPageRoute(builder:(context)=>FakeCall()));
          },
        ),
      ],
    );
  }
}

//Furthermore features like fake-call, a timer before SOS gets sends out can be implemented.