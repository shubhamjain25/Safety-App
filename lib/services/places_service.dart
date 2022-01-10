import 'package:flutter/material.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:safety_app/models/place.dart';
import 'dart:convert' as convert;

class PlacesService{

  final key="AIzaSyCVK2PSpyIqZFNke3zd9ozUPWNu7hM1TfQ";

  Future<List<Place>> getPlaces(double lat, double long) async {
    var url='https://maps.googleapis.com/maps/api/place/textsearch/json?types=police&location=$lat,$long&key=$key';
    var response = await http.get(Uri.parse(url));
    var json = convert.jsonDecode(response.body);
    var jsonResults = json['result'] as List;
    return jsonResults.map((place) => Place.fromJson(place)).toList();
  }

}