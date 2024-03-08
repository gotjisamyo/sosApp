import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/componant/component_detail_report_header/component_detail_report_header_widget.dart';
import '/flutter_flow/flutter_flow_google_map.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'report_detail_widget.dart' show ReportDetailWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ReportDetailModel extends FlutterFlowModel<ReportDetailWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for componentDetailReportHeader component.
  late ComponentDetailReportHeaderModel componentDetailReportHeaderModel;
  // State field(s) for GoogleMap widget.
  LatLng? googleMapsCenter;
  final googleMapsController = Completer<GoogleMapController>();

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    componentDetailReportHeaderModel =
        createModel(context, () => ComponentDetailReportHeaderModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    componentDetailReportHeaderModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
