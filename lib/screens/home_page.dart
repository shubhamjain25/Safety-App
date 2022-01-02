import 'package:geolocator/geolocator.dart';
import 'package:safety_app/services/geolocator_service.dart';
import 'package:safety_app/widgets/bottom_bar.dart';
import 'package:safety_app/widgets/circular_curve.dart';
import 'package:safety_app/widgets/category_card.dart';
import 'package:flutter/material.dart';
import 'package:safety_app/constants.dart';
import 'package:share/share.dart';


class HomePage extends StatelessWidget {

  var locationMessage = "";

  // Future<Position> _determinePosition() async {
  //   bool serviceEnabled;
  //   LocationPermission permission;
  //
  //   // Test if location services are enabled.
  //   serviceEnabled = await Geolocator.isLocationServiceEnabled();
  //   if (!serviceEnabled) {
  //     await Geolocator.openLocationSettings();
  //     return Future.error('Location services are disabled.');
  //   }
  //
  //   permission = await Geolocator.checkPermission();
  //   if (permission == LocationPermission.denied) {
  //     permission = await Geolocator.requestPermission();
  //     if (permission == LocationPermission.denied) {
  //       // Permissions are denied
  //       return Future.error('Location permissions are denied');
  //     }
  //   }
  //
  //   if (permission == LocationPermission.deniedForever) {
  //     // Permissions are denied forever, handle appropriately.
  //     return Future.error(
  //         'Location permissions are permanently denied, we cannot request permissions.');
  //   }
  //
  //   return await Geolocator.getCurrentPosition();
  // }

  // void sharePosition(String locationInformation){
  //   final String text="Please Help Me! "+locationInformation;
  //   final String subject = "SOS";
  //   Share.share(text, subject:subject);
  // }

  void getLocation() async{
    Position position = await GeoLocatorService().determinePosition();
    final String locationMessage="My Longitude: ${position.latitude}, Latitude: ${position.longitude}";
    final String text="Please Help Me! "+locationMessage;
    final String subject = "SOS";
    Share.share(text, subject:subject);
    print(locationMessage);
  }



  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context)
        .size; //this gonna give us total height and with of our device
    return Scaffold(
      backgroundColor: Colors.grey[200],
      bottomNavigationBar: BottomNavBar(),
      body: Stack(
        children: <Widget>[
          Container(
            // Here the height of the container is 45% of our total height
            height: 200,
            // width: double.infinity,
            // width: size.width*1,
            child: ClipPath(
              clipper: ClipperCurve(),
              child: Container(
                color: kBlueLightColor,
              ),
            ),
            // decoration: BoxDecoration(
            //   color: kBlueLightColor,
            //   image: DecorationImage(
            //     alignment: Alignment.centerLeft,
            //     image: AssetImage(""),
            //   ),
            // ),
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Align(
                    alignment: Alignment.topRight,
                    child: Container(
                      alignment: Alignment.center,
                      height: 52,
                      width: 52,
                    ),
                  ),
                  Text(
                    "Women Safety App",
                    style: Theme.of(context)
                        .textTheme
                        .headline4
                        .copyWith(fontWeight: FontWeight.w900),
                  ),
                  // SearchBar(),
                  SizedBox(
                    height: 30,
                  ),
                  Expanded(
                    child: GridView.count(
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
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) {
                                return;
                              }),
                            );
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
                          press: () {},
                        ),
                        CategoryCard(
                          title: "Add Guardian",
                          svgSrc: "assets/icons/guardian.svg",
                          press: () {},
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
