import 'package:flutter/cupertino.dart';
import 'package:geolocator/geolocator.dart';
import 'package:safety_app/services/geolocator_service.dart';

class ApplicationBloc with ChangeNotifier{
  final geoLocatorService = GeoLocatorService();

  Position currentLocation;

  ApplicationBloc(){
    setCurrentLocation();
  }

  setCurrentLocation() async{
    currentLocation = await geoLocatorService.determinePosition();
    notifyListeners();
  }


}