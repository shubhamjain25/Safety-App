import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:safety_app/constants.dart';
import 'package:safety_app/models/info.dart';
import 'package:safety_app/models/user.dart';
import 'package:safety_app/services/database.dart';
import 'package:provider/provider.dart';
import 'package:safety_app/widgets/info_list.dart';
import 'package:safety_app/widgets/text_field.dart';


class ProfilePage extends StatelessWidget {

  Future<StreamBuilder<UserData>> getData() async{
    return StreamBuilder<UserData>();
  }

  @override
  Widget build(BuildContext context) {

    return StreamBuilder<UserData>(

      stream: DatabaseService(uid: FirebaseAuth.instance.currentUser.uid).userData,
      builder: (context, snapshot){
        if(snapshot.hasData){
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
                canEdit: false,
                textValue: _userData.name,
                iconValue: Icon(
                  Icons.account_circle,
                  color: kPrimaryColor,
                ),
              ),
              TextFieldContainer(
                canEdit: false,
                textValue: _userData.age,
                iconValue: Icon(
                  Icons.accessibility,
                  color: kPrimaryColor,
                ),
              ),
              TextFieldContainer(
                canEdit: false,
                textValue: _userData.bGroup,
                iconValue: Icon(
                  Icons.healing,
                  color: kPrimaryColor,
                ),
              ),
              TextFieldContainer(
                canEdit: false,
                textValue: _userData.number,
                iconValue: Icon(
                  Icons.assignment_ind_rounded,
                  color: kPrimaryColor,
                ),
              ),
            ],
          );
        }
        else{
          return Container(
            height: 200,
            width: 200,
            child: Center(
              child: CircularProgressIndicator(
                backgroundColor: kBlueLightColor,
              ),
            ),
          );
        }
      },
    );
  }
}
