import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:safety_app/constants.dart';
import 'package:safety_app/models/info.dart';
import 'package:safety_app/models/user.dart';
import 'package:safety_app/services/calling_service.dart';
import 'package:safety_app/services/database.dart';
import 'package:provider/provider.dart';
import 'package:safety_app/widgets/info_list.dart';
import 'package:safety_app/widgets/number_text_field.dart';
import 'package:safety_app/widgets/text_field.dart';

class HelplinePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.all(20.0),
          color: kBlueLightColor,
          child: Container(
            child: Column(
              children: [
                Container(
                  alignment: Alignment.topLeft,
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: Text(
                    "Helpline Numbers",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                        color: kTextColor),
                  ),
                ),
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(18.0),
                      border: Border.all(color: kPrimaryColor, width: 2.0),
                    ),
                    padding: EdgeInsets.all(10.0),
                    margin: EdgeInsets.all(10.0),
                    child: SingleChildScrollView(
                        physics: BouncingScrollPhysics(),
                        child: Column(
                          children: <Widget>[
                            HelplineContainer(
                              textValue: "Women Helpline: 1091",
                              phNo: "1091",
                            ),
                            HelplineContainer(
                              textValue: "Domestic Abuse Helpline : 181",
                              phNo: "181",
                            ),
                            HelplineContainer(
                              textValue: "Missing Persons : 1094",
                              phNo: "1094",
                            ),
                            HelplineContainer(
                              textValue: "Student/Child Helpline : 1098",
                              phNo: "1098",
                            ),
                            HelplineContainer(
                              textValue: "NCW : (+91)7827170170",
                              phNo: "917827170170",
                            ),
                            HelplineContainer(
                              textValue: "NHRC : (+91)9810298900",
                              phNo: "917827170170",
                            ),
                            HelplineContainer(
                              textValue: "Legal Aid : 011-22527259",
                              phNo: "01122527259",
                            ),
                            HelplineContainer(
                              textValue: "Sneha NGO : (+91)9833052684",
                              phNo: "919833052684",
                            ),
                            HelplineContainer(
                              textValue: "Jagori NGO : 011-26692700",
                              phNo: "01126692700",
                            ),
                            HelplineContainer(
                              textValue: "Saarthak NGO : 011-26853846",
                              phNo: "01126853846",
                            ),
                          ],
                        )),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
