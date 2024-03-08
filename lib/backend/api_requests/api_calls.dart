import 'dart:convert';

import '/flutter_flow/flutter_flow_util.dart';
import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

class GeolocationApiCall {
  static Future<ApiCallResponse> call({
    String? latlngVar = '0',
  }) async {
    const ffApiRequestBody = '''
{
  "radioType": "gsm",
  "carrier": "Vodafone",
  "considerIp": "true"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'GeolocationApi',
      apiUrl:
          'https://www.googleapis.com/geolocation/v1/geolocate?key=AIzaSyCXlC6-RPgP-N9H2PG5bjUkZtYh0ZGtM_Q',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  static dynamic mylatlng(dynamic response) => getJsonField(
        response,
        r'''$.location''',
      );
  static double? mylat(dynamic response) => castToType<double>(getJsonField(
        response,
        r'''$.location.lat''',
      ));
  static double? mylng(dynamic response) => castToType<double>(getJsonField(
        response,
        r'''$.location.lng''',
      ));
}

class GooglePlaceApiCall {
  static Future<ApiCallResponse> call({
    String? query = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'GooglePlaceApi',
      apiUrl: 'https://maps.googleapis.com/maps/api/place/textsearch/json',
      callType: ApiCallType.GET,
      headers: {},
      params: {
        'query': query,
        'key': "AIzaSyDA0MPxjig7-rlQ5_h2xuVjGoGOsUJBaRE",
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  static List? placeLocation(dynamic response) => getJsonField(
        response,
        r'''$.results[:].geometry.location''',
        true,
      ) as List?;
  static List<double>? placeLocationLat(dynamic response) => (getJsonField(
        response,
        r'''$.results[:].geometry.location.lat''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<double>(x))
          .withoutNulls
          .toList();
  static List<double>? placeLocationLng(dynamic response) => (getJsonField(
        response,
        r'''$.results[:].geometry.location.lng''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<double>(x))
          .withoutNulls
          .toList();
  static List<String>? placeIcon(dynamic response) => (getJsonField(
        response,
        r'''$.results[:].icon''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? placeMarkurl(dynamic response) => (getJsonField(
        response,
        r'''$.results[:].icon_mask_base_uri''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? placeName(dynamic response) => (getJsonField(
        response,
        r'''$.results[:].name''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
}

class NearbyAPICall {
  static Future<ApiCallResponse> call({
    String? latlng = '12.6298109,102.0346859',
    String? keyword = 'สถานีตำรวจภูธร',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'nearbyAPI',
      apiUrl: 'https://maps.googleapis.com/maps/api/place/nearbysearch/json',
      callType: ApiCallType.GET,
      headers: {},
      params: {
        'key': "AIzaSyDA0MPxjig7-rlQ5_h2xuVjGoGOsUJBaRE",
        'radius': "1500",
        'type': "สถานีตำรวจภูธร",
        'location': "12.6298109,102.0346859",
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  static List? locationAll(dynamic response) => getJsonField(
        response,
        r'''$.results[:].geometry.location''',
        true,
      ) as List?;
  static List<double>? locationLat(dynamic response) => (getJsonField(
        response,
        r'''$.results[:].geometry.location.lat''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<double>(x))
          .withoutNulls
          .toList();
  static List<double>? locationLng(dynamic response) => (getJsonField(
        response,
        r'''$.results[:].geometry.location.lng''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<double>(x))
          .withoutNulls
          .toList();
  static List<String>? locationIcon(dynamic response) => (getJsonField(
        response,
        r'''$.results[:].icon''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? locationName(dynamic response) => (getJsonField(
        response,
        r'''$.results[:].name''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List? locationPhoto(dynamic response) => getJsonField(
        response,
        r'''$.results[:].photos''',
        true,
      ) as List?;
  static List<String>? locationID(dynamic response) => (getJsonField(
        response,
        r'''$.results[:].place_id''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
}

class PlaceApiCall {
  static Future<ApiCallResponse> call({
    String? query = 'จันทบุรี',
    String? key = 'AIzaSyDA0MPxjig7-rlQ5_h2xuVjGoGOsUJBaRE',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'PlaceApi',
      apiUrl: 'https://maps.googleapis.com/maps/api/place/textsearch/json',
      callType: ApiCallType.GET,
      headers: {},
      params: {
        'query': query,
        'key': "AIzaSyDA0MPxjig7-rlQ5_h2xuVjGoGOsUJBaRE",
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  static List? placeLocation(dynamic response) => getJsonField(
        response,
        r'''$.results[:].geometry.location''',
        true,
      ) as List?;
  static List<double>? placeLat(dynamic response) => (getJsonField(
        response,
        r'''$.results[:].geometry.location.lat''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<double>(x))
          .withoutNulls
          .toList();
  static List<double>? placeLng(dynamic response) => (getJsonField(
        response,
        r'''$.results[:].geometry.location.lng''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<double>(x))
          .withoutNulls
          .toList();
  static List<String>? placeName(dynamic response) => (getJsonField(
        response,
        r'''$.results[:].name''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List? placePhotos(dynamic response) => getJsonField(
        response,
        r'''$.results[:].photos''',
        true,
      ) as List?;
  static List<String>? placeId(dynamic response) => (getJsonField(
        response,
        r'''$.results[:].place_id''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? placceIcon(dynamic response) => (getJsonField(
        response,
        r'''$.results[:].icon''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? placeAddress(dynamic response) => (getJsonField(
        response,
        r'''$.results[:].formatted_address''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
}

class DirectionAPICall {
  static Future<ApiCallResponse> call({
    String? destination = '',
    String? origin = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'directionAPI',
      apiUrl: 'https://maps.googleapis.com/maps/api/directions/json',
      callType: ApiCallType.GET,
      headers: {},
      params: {
        'origin': origin,
        'destination': destination,
        'key': "AIzaSyC0v8nIr2Ece8HtQ--gJiY3k9H6L_noAkQ",
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class ApiPagingParams {
  int nextPageNumber = 0;
  int numItems = 0;
  dynamic lastResponse;

  ApiPagingParams({
    required this.nextPageNumber,
    required this.numItems,
    required this.lastResponse,
  });

  @override
  String toString() =>
      'PagingParams(nextPageNumber: $nextPageNumber, numItems: $numItems, lastResponse: $lastResponse,)';
}

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list);
  } catch (_) {
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar, [bool isList = false]) {
  jsonVar ??= (isList ? [] : {});
  try {
    return json.encode(jsonVar);
  } catch (_) {
    return isList ? '[]' : '{}';
  }
}
