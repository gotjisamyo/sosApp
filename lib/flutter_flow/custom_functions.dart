import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '/auth/firebase_auth/auth_util.dart';

String? myLocationToString(LatLng? mylocation) {
  // returm mylocation as string
  if (mylocation == null) {
    return null;
  }

  return '${mylocation.latitude},${mylocation.longitude}';
}

List<LatLng>? listDoublrtLatlng(
  List<double>? latitude,
  List<double>? longitude,
) {
  if (latitude == null ||
      longitude == null ||
      latitude.length != longitude.length) {
    return null;
  }
  final List<LatLng> result = [];
  for (int i = 0; i < latitude.length; i++) {
    if (latitude[i] != null && longitude[i] != null) {
      result.add(LatLng(latitude[i]!, longitude[i]!));
    }
  }
  return result;
}

String? debleToString(double? mylatlng) {
  // return mylatlng as string
  if (mylatlng == null) {
    return null;
  }

  return mylatlng.toString();
}

String? mydubleToString(double? mylatlngDuble) {
  // return mylatlngDuble as string
// return mylatlngDuble as string
  if (mylatlngDuble == null) {
    return null;
  }

  return mylatlngDuble.toString();
}

LatLng? stringToLatlng(String? latlngString) {
  // Check if latlngString is null
  if (latlngString == null) {
    return null;
  }

  // Remove unnecessary characters
  latlngString = latlngString.replaceAll('{', '');
  latlngString = latlngString.replaceAll('}', '');
  latlngString = latlngString.replaceAll('lat:', '');
  latlngString = latlngString.replaceAll('lng:', '');

  // Split the latlngString by ',' and remove any leading/trailing spaces
  final List<String> latlngList = latlngString.split(',');
  final latitudeString = latlngList[0].trim();
  final longitudeString = latlngList[1].trim();

  // Parse latitude and longitude from strings
  final double latitude = double.tryParse(latitudeString) ?? 0.0;
  final double longitude = double.tryParse(longitudeString) ?? 0.0;

  return LatLng(latitude, longitude);
}

String? goToGoogleMapUrl(LatLng? latlng) {
  // get LatLng GoTo GoogleMap Url
  String baseUrl = "https://www.google.com/maps/search/?api=1&query=";
  String lat = latlng!.latitude.toString();
  String lng = latlng.longitude.toString();
  String url = baseUrl + lat + "," + lng;
  return url;
}

String? getNameStationid(String? stationId) {
  if (stationId == 'AB74D') {
    return 'สถานีตำรวจ';
  } else if (stationId == 'AF57A') {
    return 'โรงพยาบาล';
  } else if (stationId == 'AK36B') {
    return 'สถานีดับเพลิง';
  } else if (stationId == 'AE56C') {
    return 'กู้ภัยสว่างกตัญญู';
  } else if (stationId == 'GK731') {
    return 'อู่ซ่อมรถ';
  } else {
    return 'รหัสสถานนีไม่ตรง';
  }
  return null;
}

String? placeToString(String? findPlace) {
  // retrun findPlace as string
// Starter code
  if (findPlace == null) {
    return null;
  }

  // Add your code here
  return findPlace.toString();
}

String? changStatus(bool? status) {
  if (status == false) {
    return "ได้ยอมรับการเเจ้งเหตุเเล้ว";
  } else if (status == true) {
    return "ยังไม่รับการเเจ้ง";
  }
  return null;
}

String? acceptButtonText(bool? reportStatus) {
  if (reportStatus == true) {
    return "รับเเจ้งเรื่องเเล้ว";
  } else {
    return "รับเเจ้งเรื่อง";
  }
}

Color? changAcceptButton(bool? status) {
  if (status == true) {
    return Color(0xFFEC9C4B);
  } else if (status == false) {
    return Color(0xFF6BBD78);
  } else {
    return null;
  }
}
