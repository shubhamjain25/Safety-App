import 'package:flutter/material.dart';
import 'package:safety_app/constants.dart';
import 'package:safety_app/services/database.dart';
import 'package:provider/provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:safety_app/widgets/info_list.dart';

// class ProfilePage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return StreamProvider<QuerySnapshot>.value(
//       value: DatabaseService().infos,
//       child: Scaffold(
//         body: Container(
//           color: Colors.blue,
//           child: InfoList(),
//         ),
//       ),
//     );
//   }
// }

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView.count(
      padding: EdgeInsets.only(bottom: 30.0),
      physics: BouncingScrollPhysics(),
      crossAxisCount: 1,
      childAspectRatio: .95,
      crossAxisSpacing: 20,
      mainAxisSpacing: 20,
      children: <Widget>[
        TextFieldContainer()
      ],
    );
  }
}

class TextFieldContainer extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      width: size.width * 0.8,
      decoration: BoxDecoration(
        color: kPrimaryLightColor,
        borderRadius: BorderRadius.circular(29),
      ),
      child: TextField(
        obscureText: true,
        cursorColor: kPrimaryColor,
        decoration: InputDecoration(
          hintText: "Password",
          icon: Icon(
            Icons.lock,
            color: kPrimaryColor,
          ),
          suffixIcon: Icon(
            Icons.visibility,
            color: kPrimaryColor,
          ),
          border: InputBorder.none,
        ),
      ),
    );
  }
}
