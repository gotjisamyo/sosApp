// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:sos_app/flutter_flow/flutter_flow_google_map.dart';

class MySosMap extends StatefulWidget {
  const MySosMap({
    super.key,
    this.width,
    this.height,
  });

  final double? width;
  final double? height;

  @override
  State<MySosMap> createState() => _MySosMapState();
}

class _MySosMapState extends State<MySosMap> {
  final mapsWidgetController = GlobalKey<GM.GoogleMapsWidgetState>();
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
