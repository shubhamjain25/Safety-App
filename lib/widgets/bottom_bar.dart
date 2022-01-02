import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:safety_app/constants.dart';

class BottomNavBar extends StatefulWidget {

  final int indexNumber;

  BottomNavBar({this.indexNumber});

  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _selectedTab=1;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(15.0),
          topLeft: Radius.circular(15.0),
        ),
        boxShadow: [
          BoxShadow(
            blurRadius: 30.0,
            spreadRadius: 1.0,
            color: Colors.black.withOpacity(0.1),
          )
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          GestureDetector(
            onTap: (){
              print("Show User Profile");
              setState(() {
                _selectedTab=0;
              });
            },
            child: BottomTabBtn(
              imagePath: 'assets/images/tab_user.png',
              isSelected: _selectedTab==0?true:false,
            ),
          ),
          GestureDetector(
            onTap: (){
              print("Show SOS Stuff");
              setState(() {
                _selectedTab=1;
              });
            },
            child: BottomTabBtn(
              imagePath: 'assets/images/tab_siren.png',
              isSelected: _selectedTab==1?true:false,
            ),
          ),
          GestureDetector(
            onTap: (){
              setState(() {
                _selectedTab=2;
              });
              FirebaseAuth.instance.signOut();
            },
            child: BottomTabBtn(
              imagePath: 'assets/images/tab_logout.png',
              isSelected: _selectedTab==2?true:false,
            ),
          ),
        ],
      ),
    );
  }
}

class BottomTabBtn extends StatelessWidget {

  final String imagePath;
  final bool isSelected;

  BottomTabBtn({this.imagePath, this.isSelected});

  @override
  Widget build(BuildContext context) {

    bool _isSelected = isSelected??false;
    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: 15.0,
          vertical: 20.0
      ),
      decoration: BoxDecoration(
          border: Border(
            top: BorderSide(
              width: 2.0,
              color: _isSelected ? Theme.of(context).accentColor : Colors.black,
            ),
          )
      ),
      child: Image(
        image: AssetImage(imagePath),
        height: 24.0,
        width: 24.0,
        color: _isSelected? Theme.of(context).accentColor : Colors.black,
      ),
    );
  }
}
