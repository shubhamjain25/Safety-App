import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:safety_app/services/database.dart';

class VerifyCredentials{

  final String registeredEmail;
  final String registeredPassword;
  final BuildContext passContext;

  VerifyCredentials({@required this.registeredEmail, @required this.registeredPassword, this.passContext});

  Future<String> createNewUser() async {
    try {
      UserCredential _user = await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: registeredEmail, password: registeredPassword);

      //create a new document for the user with uid
      await DatabaseService(uid: _user.user.uid).updateUserData('O+', 'Shubham', 20);
      return null;
    }
    on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        return 'The password provided is too weak.';
      } else if (e.code == 'email-already-in-use') {
        return 'The account already exists for that email.';
      } else {
        return e.message;
      }
    }
    catch (e) {
      return e.toString();
    }
  }

  Future<String> signInUser() async{
    try {
      UserCredential _user = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: registeredEmail, password: registeredPassword);
      return null;
    }
    on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        return 'The password provided is too weak.';
      } else if (e.code == 'email-already-in-use') {
        return 'The account already exists for that email.';
      } else {
        return e.message;
      }
    }
    catch (e) {
      return e.toString();
    }
  }

  Future<void> _alertDialog(String errorMessage) async {
    return showDialog(
        barrierDismissible: false,
        context: passContext,
        builder: (context) {
          return AlertDialog(
            title: Text('Error'),
            content: Text(errorMessage),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('Close Dialog'),
              )
            ],
          );
        });
  }

  void fillForm(String action) async{
    String _feedback = action=='SignUp'?await createNewUser():await signInUser();

    if (_feedback != null) {
      _alertDialog(_feedback);
    }
    else {
      if(action=='SignUp'){Navigator.pop(passContext);}
      else {}
      // If signed in, it won't go back to login page but instead to Homepage
      //Because main.dart looks after the state, and directs to HomePage as signedIn.
    }
  }

}
