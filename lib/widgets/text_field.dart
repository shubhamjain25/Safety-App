import 'package:flutter/material.dart';
import 'package:safety_app/constants.dart';
import 'package:safety_app/services/calling_service.dart';

class TextFieldContainer extends StatelessWidget {
  final String textValue;
  final String hintValue;
  final bool canEdit;
  final Icon iconValue;
  final Function(String) onChanged;
  final String phNo;

  void makeEmergencyCall(String phNo) async {
    var call = CallingService();
    await call.callNumber(phNo);
  }

  void _btnPressed() {
    print("search button clicked");
  }

  TextFieldContainer(
      {this.textValue,
      this.hintValue,
      this.iconValue,
      this.canEdit,
      this.onChanged,
      this.phNo});

  @override
  Widget build(BuildContext context) {
    bool _canEdit = canEdit ?? false;
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 0),
      width: size.width * 0.8,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: TextField(
        textAlignVertical: TextAlignVertical.center,
        onChanged: onChanged,
        enabled: _canEdit,
        obscureText: false,
        cursorColor: kPrimaryColor,
        decoration: InputDecoration(
          labelText: textValue,
          labelStyle:
              TextStyle(color: Colors.black, fontWeight: FontWeight.w500,),
          hintText: hintValue,
          prefixIcon: IconButton(
            icon: iconValue,
            onPressed: ()=> {
              print("Yes")
            },
            padding: EdgeInsets.all(0),
            alignment: Alignment.centerLeft,
          ),
          // suffixIcon: Icon(
          //   Icons.visibility,
          //   color: kPrimaryColor,
          // ),
          border: InputBorder.none,
        ),
      ),
    );
  }
}
