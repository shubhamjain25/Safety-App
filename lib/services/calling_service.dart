import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';

class CallingService{

  callNumber(String phNo) async{
    bool res = await FlutterPhoneDirectCaller.callNumber(phNo);
    print("Res value equals $res");
  }

}