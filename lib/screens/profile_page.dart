import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:safety_app/constants.dart';
import 'package:safety_app/models/info.dart';
import 'package:safety_app/models/user.dart';
import 'package:safety_app/services/database.dart';
import 'package:provider/provider.dart';
import 'package:safety_app/widgets/custom_button.dart';
import 'package:safety_app/widgets/info_list.dart';
import 'package:safety_app/widgets/text_field.dart';

class ProfilePage extends StatefulWidget {
  final bool editable;

  ProfilePage({this.editable});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final _formKey = GlobalKey<FormState>();
  String _name;
  String _age;
  String _bGroup;
  String _number;
  bool showLoadingCircle = false;

  Future<StreamBuilder<UserData>> getData() async {
    return StreamBuilder<UserData>();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<UserData>(
      stream:
          DatabaseService(uid: FirebaseAuth.instance.currentUser.uid).userData,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          UserData _userData = snapshot.data;
          print("UserData equals ${_userData.name}");
          print("UserData equals ${_userData.bGroup}");
          print("UserData equals ${_userData.age}");
          print("UserData equals ${_userData.number}");

          return GridView.count(
            physics: BouncingScrollPhysics(),
            crossAxisCount: 1,
            childAspectRatio: 5,
            // mainAxisSpacing: 10,
            children: <Widget>[
              TextFieldContainer(
                canEdit: widget.editable,
                textValue: _userData.name,
                onChanged: (value) {
                  _name = value;
                },
                iconValue: Icon(
                  Icons.account_circle,
                  color: kPrimaryColor,
                ),
              ),
              TextFieldContainer(
                canEdit: widget.editable,
                textValue: _userData.age,
                onChanged: (value) {
                  _age = value;
                },
                iconValue: Icon(
                  Icons.accessibility,
                  color: kPrimaryColor,
                ),
              ),
              TextFieldContainer(
                canEdit: widget.editable,
                textValue: _userData.bGroup,
                onChanged: (value) {
                  _bGroup = value;
                },
                iconValue: Icon(
                  Icons.healing,
                  color: kPrimaryColor,
                ),
              ),
              TextFieldContainer(
                canEdit: widget.editable,
                textValue: _userData.number,
                onChanged: (value) {
                  _number = value;
                },
                iconValue: Icon(
                  Icons.assignment_ind_rounded,
                  color: kPrimaryColor,
                ),
              ),
              if (widget.editable)
                CustomBtn(

                  btnText: 'Update Account Details',
                  isVisible: showLoadingCircle,
                  marginValue: EdgeInsets.symmetric(vertical: 10),
                  paddingValue: EdgeInsets.symmetric(horizontal: 20, vertical: 0),
                  btnPressed: () async {
                    setState(() {
                      showLoadingCircle = true;
                    });


                    // print("Updated UserData equals ${_name}");
                    // print("Updated UserData equals ${_bGroup}");
                    // print("Updated UserData equals ${_age}");
                    // print("Updated UserData equals ${_number}");

                    await DatabaseService(
                            uid: FirebaseAuth.instance.currentUser.uid)
                        .updateUserData(
                      _name ?? _userData.name,
                      _bGroup ?? _userData.age,
                      _age ?? _userData.bGroup,
                      _number ?? _userData.number,
                    );

                    setState(() {
                      showLoadingCircle = false;
                    });

                    Navigator.pop(context);
                  },
                  isColor: false,
                )
            ],
          );
        } else {
          return Container(
            height: 200,
            width: 200,
            child: Center(
              child: CircularProgressIndicator(
                color: kPrimaryColor,
                backgroundColor: kBlueLightColor,
              ),
            ),
          );
        }
      },
    );
  }
}
