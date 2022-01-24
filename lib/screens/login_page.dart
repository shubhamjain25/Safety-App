import 'package:safety_app/screens/secondary_landing_page.dart';
import 'package:safety_app/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import '../constants.dart';
import 'package:safety_app/widgets/verify_credentials.dart';
import 'package:safety_app/screens/registration_page.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  bool showLoadingCircle = false;
  String emailValue = '';
  String passwordValue = '';
  FocusNode _passwordNode;

  void formSubmission() async{

    setState(() {
      showLoadingCircle = true;
    });
    await VerifyCredentials(
      registeredEmail: emailValue,
      registeredPassword: passwordValue,
      passContext: context,
    ).fillForm('SignIn');
    setState(() {
      showLoadingCircle = false;
    });
  }

  @override
  void initState() {
    _passwordNode = FocusNode();
    super.initState();
  }

  @override
  void dispose() {
    _passwordNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: double.infinity,
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  padding: EdgeInsets.only(top: 20.0, bottom: 10.0),
                  child: Text(
                    'Welcome User! Login Now',
                    textAlign: TextAlign.center,
                    style: kHeadingStyle,
                  ),
                ),
                Column(children: <Widget>[
                  CustomTextField(
                    onChanged: (value) {
                      emailValue = value;
                    },
                    isObscureText: false,
                    hintMessage: 'Enter your email id',
                    onSubmit: (value) {
                      _passwordNode.requestFocus();
                    },
                  ),
                  CustomTextField(
                    onChanged: (value) {
                      passwordValue = value;
                    },
                    isObscureText: true,
                    hintMessage: 'Enter your password',
                    focusNode: _passwordNode,
                    onSubmit: (value) {
                      print('Email equals $emailValue');
                      print('Password equals $passwordValue');
                    },
                  ),
                  CustomBtn(
                    btnText: 'Login',
                    btnPressed: () {
                      formSubmission();
                      print('Login button tapped');
                    },
                    isVisible: showLoadingCircle,
                    isColor: false,
                    marginValue: EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
                  )
                ]),
                CustomBtn(
                  btnText: 'Create New Account',
                  marginValue: EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
                  btnPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder:(context)=>SecondaryLandingPage()));
                  },
                  isColor: true,
                ),
              ]),
        ),
      ),
    );
  }
}

