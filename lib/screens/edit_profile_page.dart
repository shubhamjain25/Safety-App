import 'package:flutter/material.dart';
import 'package:safety_app/widgets/custom_button.dart';
import 'package:safety_app/widgets/text_field.dart';
import 'package:safety_app/widgets/verify_credentials.dart';

import '../constants.dart';

class EditProfile extends StatefulWidget {
  final String emailValue;
  final String passwordValue;

  EditProfile({this.emailValue, this.passwordValue});

  @override
  _EditProfileState createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  bool showLoadingCircle = false;
  String _name="";
  String _age="";
  String _bGroup="";
  String _number="";

  void formSubmission() async {
    print(_name);
    print(_age);
    print(_bGroup);
    print(_number);
    setState(() {
      showLoadingCircle = true;
    });
    await VerifyCredentials(
      registeredEmail: widget.emailValue,
      registeredPassword: widget.passwordValue,
      passContext: context,
      name: _name,
      bGroup: _bGroup,
      age: _age,
      number: _number
    ).fillForm('SignUp');
    setState(() {
      showLoadingCircle = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.all(20.0),
          // margin: EdgeInsets.symmetric(20.0),
          height: 1200,
          color: kBlueLightColor,
          child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    alignment: Alignment.topLeft,
                    padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                    child: Text(
                      "Edit User Information",
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: kTextColor),
                    ),
                  ),
                  SizedBox(height: 10),
                  TextFieldContainer(
                    onChanged: (value) {
                      _name = value;
                    },
                    canEdit: true,
                    hintValue: "Name",
                    iconValue: Icon(
                      Icons.account_circle,
                      color: kPrimaryColor,
                    ),
                  ),
                  TextFieldContainer(
                    onChanged: (value) {
                      _age = value;
                    },
                    canEdit: true,
                    hintValue: "Age",
                    iconValue: Icon(
                      Icons.accessibility,
                      color: kPrimaryColor,
                    ),
                  ),
                  TextFieldContainer(
                    onChanged: (value) {
                      _bGroup = value;
                    },
                    canEdit: true,
                    hintValue: "Blood Group",
                    iconValue: Icon(
                      Icons.healing,
                      color: kPrimaryColor,
                    ),
                  ),
                  TextFieldContainer(
                    onChanged: (value) {
                      _number = value;
                    },
                    canEdit: true,
                    hintValue: "Guardian's Phone Number",
                    iconValue: Icon(
                      Icons.assignment_ind_rounded,
                      color: kPrimaryColor,
                    ),
                  ),
                  CustomBtn(
                    btnText: 'Submit Account Details',
                    btnPressed: () {
                      formSubmission();
                      // Navigator.push(context, MaterialPageRoute(builder:(context)=>EditProfile(emailValue: emailValue, passwordValue: passwordValue,)));
                      print('Register button tapped');
                    },
                    isVisible: showLoadingCircle,
                    isColor: false,
                    marginValue: EdgeInsets.symmetric(horizontal: 20.0, vertical: 25.0),
                  )
                ],
              )
          ),
        ),
      ),
    );
  }
// Widget build(BuildContext context) {
//   return Container(
//     color: Colors.blue,
//     child: Center(
//       child: CustomBtn(
//         btnText: 'Register Account',
//         btnPressed: () {
//           formSubmission();
//           // Navigator.push(context, MaterialPageRoute(builder:(context)=>EditProfile()));
//           print('Register button tapped');
//         },
//         isVisible: showLoadingCircle,
//         isColor: false,
//       )
//     ),
//   );
// }
}
