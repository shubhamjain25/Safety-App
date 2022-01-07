import 'package:flutter/material.dart';
import 'package:safety_app/constants.dart';
import 'package:safety_app/services/calling_service.dart';

class HelplineContainer extends StatelessWidget {

  final String textValue;
  final String phNo;

  HelplineContainer({
    this.textValue,
    this.phNo,
  });

  void makeEmergencyCall(String phNo) async{
    var call = CallingService();
    await call.callNumber(phNo);
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: (){
        makeEmergencyCall(phNo);
      },
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 10),
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 0),
        width: size.width * 0.8,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
        ),
        child: TextField(
          enabled: false,
          textAlignVertical: TextAlignVertical.center,
          decoration: InputDecoration(
            labelText: textValue,
            labelStyle: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w500,
            ),
            prefixIcon: IconButton(
              icon: Icon(
                Icons.phone_in_talk_rounded,
                color: kPrimaryColor,
              ),
              padding: EdgeInsets.all(0),
              alignment: Alignment.centerLeft,
            ),
            border: InputBorder.none,
          ),
        ),
      ),
    );
  }
}
