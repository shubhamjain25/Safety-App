import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';
import 'package:safety_app/constants.dart';
import 'package:safety_app/services/application_bloc.dart';

class LocationPage extends StatefulWidget {
  @override
  _LocationPageState createState() => _LocationPageState();
}

class _LocationPageState extends State<LocationPage> {
  @override
  Widget build(BuildContext context) {
    final applicationBloc = Provider.of<ApplicationBloc>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Maps Sample'),
        backgroundColor: Colors.green[400],
      ),
      body: (applicationBloc.currentLocation != null)
          ? GoogleMap(
              mapType: MapType.normal,
              myLocationEnabled: true,
              initialCameraPosition: CameraPosition(
                target: LatLng(applicationBloc.currentLocation.latitude,
                    applicationBloc.currentLocation.longitude),
                zoom: 14.0,
              ),
            )
          : Center(
              child: CircularProgressIndicator(
              color: kPrimaryColor,
              backgroundColor: kBlueLightColor,
            )),
    );
  }
}
