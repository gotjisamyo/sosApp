import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'googlemap_widget.dart' show GooglemapWidget;
import 'package:flutter/material.dart';

class GooglemapModel extends FlutterFlowModel<GooglemapWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Backend Call - API (directionAPI)] action in Button widget.
  ApiCallResponse? apiResultq44;
  // Stores action output result for [Backend Call - API (GeolocationApi)] action in FloatingActionButton widget.
  ApiCallResponse? apiResultspl;
  // Stores action output result for [Custom Action - jsonTostring] action in FloatingActionButton widget.
  String? latlngString;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
