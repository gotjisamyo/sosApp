import '/components/nav_bar_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'report_alert_widget.dart' show ReportAlertWidget;
import 'package:flutter/material.dart';

class ReportAlertModel extends FlutterFlowModel<ReportAlertWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for navBar component.
  late NavBarModel navBarModel;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    navBarModel = createModel(context, () => NavBarModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    navBarModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
