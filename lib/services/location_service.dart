// import 'dart:async';
// import 'package:location/location.dart';
// import 'package:safety_app/datamodels/user_location.dart';
//
// class LocationService{
//
//   UserLocation _currentLocation;
//   var location = Location();
//
//   // //Continuous Location Update
//   // StreamController<UserLocation> _locationController = StreamController<UserLocation>.broadcast();
//   //
//   // LocationService(){
//   //   location.requestPermission().then((granted){
//   //     if(){
//   //
//   //     }
//   //   });
//   // }
//   // Stream<UserLocation> get locationStream => _locationController.stream;
//
//   Future<UserLocation> getLocation() async{
//     try{
//       var userLocation = await location.getLocation();
//       _currentLocation = UserLocation(
//         latitude: userLocation.latitude,
//         longitude: userLocation.longitude,
//       );
//     }
//     catch(e){
//       print("Unable to get the location");
//     }
//     return _currentLocation;
//   }
// }
