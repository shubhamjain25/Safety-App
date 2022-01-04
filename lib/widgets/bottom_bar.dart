import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:safety_app/constants.dart';
import 'package:safety_app/screens/profile_page.dart';

class BottomNavBar extends StatefulWidget {

  final int indexNumber;
  final Function(int) btnPressed;

  BottomNavBar({this.indexNumber, this.btnPressed});

  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {

  int _selectedTab;

  @override
  Widget build(BuildContext context) {
    _selectedTab=widget.indexNumber??1;
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
          BottomTabBtn(
            imagePath: 'assets/images/tab_user.png',
            isSelected: _selectedTab==0?true:false,
            onSelection: (){
              widget.btnPressed(0);
            },
          ),
          BottomTabBtn(
            imagePath: 'assets/images/tab_siren.png',
            isSelected: _selectedTab==1?true:false,
            onSelection: (){
              widget.btnPressed(1);
            },
          ),
          BottomTabBtn(
            imagePath: 'assets/images/tab_logout.png',
            isSelected: _selectedTab==2?true:false,
            onSelection: (){
              widget.btnPressed(2);
            },
            isLogoutBtn: true,
          ),
        ],
      ),
    );
  }
}

class BottomTabBtn extends StatelessWidget {

  final String imagePath;
  final bool isSelected;
  final Function onSelection;
  final bool isLogoutBtn;

  BottomTabBtn({this.imagePath, this.isSelected, this.onSelection, this.isLogoutBtn});

  @override
  Widget build(BuildContext context) {

    bool _isSelected = isSelected??false;
    bool _isLogoutBtn= isLogoutBtn??false;

    return GestureDetector(
      onTap: _isLogoutBtn?(){
        FirebaseAuth.instance.signOut();
      }:onSelection,
      child: Container(
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
      ),
    );
  }
}
