import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:safety_app/screens/location_page.dart';
import 'package:safety_app/services/application_bloc.dart';

class LocationChangeListener extends StatefulWidget {
  @override
  _LocationChangeListenerState createState() => _LocationChangeListenerState();
}

class _LocationChangeListenerState extends State<LocationChangeListener> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ApplicationBloc(),
      child: LocationPage(),
    );
  }
}
