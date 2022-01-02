// import 'package:geolocator/geolocator.dart';
import 'package:safety_app/widgets/bottom_bar.dart';
import 'package:safety_app/widgets/circular_curve.dart';
import 'package:safety_app/widgets/category_card.dart';
import 'package:safety_app/services/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:safety_app/constants.dart';
import 'package:safety_app/datamodels/user_location.dart';
import 'dart:async';

class HomePage extends StatelessWidget {

  var locationMessage = "";

  // void getLocation() async{
  //   var position = await Geolocator.getCurrentPosition(
  //     desiredAccuracy: LocationAccuracy.high,
  //   );
  //   var lastPosition = await Geolocator.getLastKnownPosition();
  //   print(lastPosition);
  //   locationMessage="My last location is ${position.latitude}, ${position.longitude}";
  //   print(locationMessage);
  // }

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
