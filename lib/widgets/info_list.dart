import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:safety_app/models/info.dart';

class InfoList extends StatefulWidget {
  @override
  _InfoListState createState() => _InfoListState();
}

class _InfoListState extends State<InfoList> {
  @override
  Widget build(BuildContext context) {

    final infos = Provider.of<List<Info>>(context);
    // print(infos.docs);
    infos.forEach((document) {
      print(document.name);
      print(document.bGroup);
      print(document.age);
    });

    return Container();
  }
}
