import '/componant/headercompos1/headercompos1_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'auth1_profile_widget.dart' show Auth1ProfileWidget;
import 'package:flutter/material.dart';

class Auth1ProfileModel extends FlutterFlowModel<Auth1ProfileWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for headercompos1 component.
  late Headercompos1Model headercompos1Model;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    headercompos1Model = createModel(context, () => Headercompos1Model());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    headercompos1Model.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
