import '/components/nav_bar_officer_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'report_alert_accept_widget.dart' show ReportAlertAcceptWidget;
import 'package:flutter/material.dart';

class ReportAlertAcceptModel extends FlutterFlowModel<ReportAlertAcceptWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for navBarOfficer component.
  late NavBarOfficerModel navBarOfficerModel;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    navBarOfficerModel = createModel(context, () => NavBarOfficerModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    navBarOfficerModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
