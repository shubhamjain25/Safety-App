import 'package:flutter/material.dart';
import 'package:safety_app/screens/profile_page.dart';
import 'package:safety_app/widgets/custom_button.dart';
import 'package:safety_app/widgets/text_field.dart';
import 'package:safety_app/widgets/verify_credentials.dart';

import '../constants.dart';



class ModifyProfile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          color: kBlueLightColor,
          width: double.infinity,
          padding: const EdgeInsets.all(20.0),
          child: ProfilePage(
            editable: true,
          ),
        ),
      ),
    );
  }
}
