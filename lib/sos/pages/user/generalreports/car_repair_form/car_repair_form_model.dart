import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/flutter_flow/flutter_flow_google_map.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'car_repair_form_widget.dart' show CarRepairFormWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pointer_interceptor/pointer_interceptor.dart';
import 'package:provider/provider.dart';

class CarRepairFormModel extends FlutterFlowModel<CarRepairFormWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Backend Call - API (GeolocationApi)] action in CarRepairForm widget.
  ApiCallResponse? resultLatlngVar;
  // Stores action output result for [Custom Action - jsonTostring] action in CarRepairForm widget.
  String? toResult;
  // State field(s) for title widget.
  FocusNode? titleFocusNode;
  TextEditingController? titleController;
  String? Function(BuildContext, String?)? titleControllerValidator;
  // State field(s) for detail widget.
  FocusNode? detailFocusNode;
  TextEditingController? detailController;
  String? Function(BuildContext, String?)? detailControllerValidator;
  // State field(s) for GoogleMap widget.
  LatLng? googleMapsCenter;
  final googleMapsController = Completer<GoogleMapController>();
  // Stores action output result for [Backend Call - API (GeolocationApi)] action in Button widget.
  ApiCallResponse? apiResultkja;
  // Stores action output result for [Custom Action - jsonTostring] action in Button widget.
  String? buttonMylatlng;
  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl = '';

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
    titleFocusNode?.dispose();
    titleController?.dispose();

    detailFocusNode?.dispose();
    detailController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
