import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
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

  void makeEmergencyCall() async{
    var call = CallingService();
    await call.callNumber(100);
  }

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      padding: EdgeInsets.only(bottom: 30.0),
      physics: BouncingScrollPhysics(),
      crossAxisCount: 2,
      childAspectRatio: .95,
      crossAxisSpacing: 20,
      mainAxisSpacing: 20,
      children: <Widget>[
        CategoryCard(
          title: "Live Location",
          svgSrc: "assets/icons/location.svg",
          press: (){
            getLocation();
          },
        ),
        CategoryCard(
          title: "Add Guardian",
          svgSrc: "assets/icons/guardian.svg",
          press: () {},
        ),
        CategoryCard(
          title: "Emergency",
          svgSrc: "assets/icons/emergency.svg",
          press: () {
            makeEmergencyCall();
          },
        ),
        CategoryCard(
          title: "Medical",
          svgSrc: "assets/icons/medical.svg",
          press: () {},
        ),
        CategoryCard(
          title: "Live Location",
          svgSrc: "assets/icons/location.svg",
          press: () {

          },
        ),
        CategoryCard(
          title: "Add Guardian",
          svgSrc: "assets/icons/guardian.svg",
          press: () {

          },
        ),
      ],
    );
  }
}