import 'package:geolocator/geolocator.dart';
import 'package:safety_app/screens/edit_profile_page.dart';
import 'package:safety_app/screens/features_page.dart';
import 'package:safety_app/screens/profile_page.dart';
import 'package:safety_app/services/calling_service.dart';
import 'package:safety_app/services/geolocator_service.dart';
import 'package:safety_app/widgets/bottom_bar.dart';
import 'package:safety_app/widgets/circular_curve.dart';
import 'package:safety_app/widgets/category_card.dart';
import 'package:flutter/material.dart';
import 'package:safety_app/constants.dart';
import 'package:share/share.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';


class HomePage extends StatefulWidget {

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  PageController _pageIndex=PageController();
  int _pageNumber=0;

  @override
  void initState() {
    _pageIndex = PageController();
    super.initState();
  }

  @override
  void dispose() {
    _pageIndex.dispose();
    super.dispose();
  }



  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context)
        .size; //this gonna give us total height and with of our device
    return Scaffold(
      backgroundColor: Colors.grey[200],
      // bottomNavigationBar: bottomBar,
      body: Stack(
        children: <Widget>[
          Container(
            child: ClipPath(
              clipper: OvalBottomBorderClipper(),
              child: Container(
                height: 200,
                width: double.infinity,
                color: kBlueLightColor,
              ),
            ),
          ),
          SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Align(
                    alignment: Alignment.topRight,
                    child: Container(
                      alignment: Alignment.center,
                      height: 52,
                      width: 52,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    "Women Safety App",
                    style: Theme.of(context)
                        .textTheme
                        .headline4
                        .copyWith(fontWeight: FontWeight.w900),
                  ),
                ),
                // SearchBar(),
                SizedBox(
                  height: 30,
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),

                    child: PageView(
                      physics: BouncingScrollPhysics(),
                      controller: _pageIndex,
                      onPageChanged: (num){
                        setState(() {
                          _pageNumber=num;
                        });
                      },
                      children: <Widget>[
                        ProfilePage(),
                        FeaturesPage(),
                      ],
                    ),
                  ),
                ),
                BottomNavBar(
                  btnPressed:(num){
                    _pageIndex.animateToPage(num, duration: Duration(milliseconds:600), curve:Curves.easeOutCubic );
                  } ,
                  indexNumber: _pageNumber,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }


}


