import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'chang_home_widget.dart' show ChangHomeWidget;
import 'package:flutter/material.dart';

class ChangHomeModel extends FlutterFlowModel<ChangHomeWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Firestore Query - Query a collection] action in changHome widget.
  UsersRecord? user;

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
