import 'package:safety_app/constants.dart';
import 'package:flutter/material.dart';

class CustomBtn extends StatelessWidget {
  final bool isColor;
  final Function btnPressed;
  final String btnText;
  final bool isVisible;
  final EdgeInsetsGeometry paddingValue;
  final EdgeInsetsGeometry marginValue;

  CustomBtn({this.isColor, this.btnPressed, this.btnText, this.isVisible,this.paddingValue,this.marginValue});

  @override
  Widget build(BuildContext context) {
    bool _isColor = isColor ?? false;
    bool _isVisible = isVisible ?? false;
    //If variable isVisible equals null then _isVisible becomes false

    return GestureDetector(
      onTap: btnPressed,
      child: Container(
        width: double.infinity,
        padding: paddingValue,
        margin: marginValue,
        height: 60.0,
        decoration: BoxDecoration(
          border: Border.all(
            width: 1.5,
            color: _isColor ? kPrimaryColor : Colors.white,
          ),
          color: _isColor ? Colors.white : kPrimaryColor,
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: Stack(
          children: <Widget>[
            Visibility(
              visible: _isVisible ? false : true,
              child: Center(
                child: Text(
                  btnText,
                  style: TextStyle(
                      fontSize: 22.0,
                      color: _isColor ? kPrimaryColor : Colors.white,
                      fontWeight: FontWeight.w500),
                ),
              ),
            ),
            Visibility(
              visible: _isVisible ? true : false,
              child: Container(
                child: Center(
                  child: CircularProgressIndicator(
                    color: kPrimaryColor,
                    backgroundColor: kBlueLightColor,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomTextField extends StatelessWidget {
  final bool isObscureText;
  final String hintMessage;
  final Function(String) onChanged;
  final Function(String) onSubmit;
  final FocusNode focusNode;

  CustomTextField(
      {@required this.isObscureText,
        this.hintMessage,
        this.onChanged,
        this.onSubmit,
        this.focusNode});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 5.0),
      child: TextField(
        onChanged: onChanged,
        onSubmitted: onSubmit,
        focusNode: focusNode,
        obscureText: isObscureText,
        keyboardType: TextInputType.emailAddress,
        decoration: kTextFieldDecoration.copyWith(
          hintText: hintMessage,
          hintStyle: TextStyle(
            fontSize: 20.0,
          ),
        ),
      ),
    );
  }
}
