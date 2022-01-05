
import 'package:flutter/material.dart';
import 'package:safety_app/constants.dart';

class TextFieldContainer extends StatelessWidget {

  final String textValue;
  final String hintValue;
  final bool canEdit;
  final Icon iconValue;
  final Function(String) onChanged;

  TextFieldContainer({this.textValue, this.hintValue, this.iconValue,this.canEdit,this.onChanged});

  @override
  Widget build(BuildContext context) {
    bool _canEdit = canEdit??true;
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      width: size.width * 0.8,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: TextField(
        onChanged: onChanged,
        enabled: _canEdit,
        // readOnly: true,
        obscureText: false,
        cursorColor: kPrimaryColor,
        decoration: InputDecoration(
          labelText: textValue,
          labelStyle: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w500
          ),
          hintText: hintValue,
          icon: iconValue,
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
