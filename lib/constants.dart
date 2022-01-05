import 'package:flutter/material.dart';

const kCheckText = TextStyle(
  fontSize: 30.0,
  fontStyle: FontStyle.italic,
);

const kTextFieldDecoration = InputDecoration(
  fillColor: Color(0xFFF2F2F2),
  filled: true,
  hintText: 'Enter a value',
  contentPadding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(
      Radius.circular(10.0),
    ),
  ),
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(color:kPrimaryColor, width:1.0),
    borderRadius: BorderRadius.all(
      Radius.circular(10.0),
    ),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color:kPrimaryColor, width:2.0),
    borderRadius: BorderRadius.all(
      Radius.circular(10.0),
    ),
  ),
);

const kHeadingStyle = TextStyle(fontSize: 25.0, fontWeight: FontWeight.w500, color : kTextColor);

const kCartTextStyle= TextStyle(
  fontSize: 25.0,
  fontWeight: FontWeight.w600,
  color: Colors.white,
);


const kBackgroundColor = Color(0xFFF8F8F8);
const kActiveIconColor = Color(0xFFE68342);
const kTextColor = Color(0xFF222B45);
const kBlueLightColor = Color(0xFFC7B8F5);
const kBlueColor = Color(0xFF817DC0);
const kShadowColor = Color(0xFFE6E6E6);
const kPrimaryColor = Color(0xFF6F35A5);
const kPrimaryLightColor = Color(0xFFF1E6FF);
