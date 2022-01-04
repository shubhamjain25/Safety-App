import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';

class CallingService{

  callNumber(int phNo) async{
    bool res = await FlutterPhoneDirectCaller.callNumber(phNo.toString());
    print("Res value equals $res");
  }

}