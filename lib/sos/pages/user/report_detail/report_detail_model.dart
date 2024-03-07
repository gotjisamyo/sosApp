import '/componant/component_detail_report_header/component_detail_report_header_widget.dart';
import '/flutter_flow/flutter_flow_google_map.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'report_detail_widget.dart' show ReportDetailWidget;
import 'package:flutter/material.dart';

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
