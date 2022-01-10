import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:safety_app/constants.dart';
import 'package:safety_app/screens/home_page.dart';
import 'package:safety_app/screens/registration_page.dart';

class SecondaryLandingPage extends StatelessWidget {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _initialization,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Scaffold(
              body: Center(
                child: Text('Error: ${snapshot.error}', style: kCheckText),
              ),
            );
          }
          if (snapshot.connectionState == ConnectionState.done) {
            return StreamBuilder(
                stream: FirebaseAuth.instance.authStateChanges(),
                builder: (context, streamSnapshot) {
                  if (streamSnapshot.hasError) {
                    return Scaffold(
                      body: Center(
                        child: Text('Error: ${streamSnapshot.error}',
                            style: kCheckText),
                      ),
                    );
                  }
                  if (streamSnapshot.connectionState ==
                      ConnectionState.active) {
                    User _currentUser = streamSnapshot.data;
                    if (_currentUser == null) {
                      return RegistrationScreen();
                    } else {
                      return HomePage();
                    }
                  }
                  return Scaffold(
                    body: Center(
                      child: CircularProgressIndicator(
                        color: kPrimaryColor,
                        backgroundColor: kBlueLightColor,
                      ),
                    ),
                  );
                });
          }
          return Scaffold(
            body: Center(
              child: Text('Initializing App...', style: kCheckText),
            ),
          );
        });
  }
}
