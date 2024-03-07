import '/componant/headercompos2/headercompos2_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'auth2_profile_widget.dart' show Auth2ProfileWidget;
import 'package:flutter/material.dart';

class Auth2ProfileModel extends FlutterFlowModel<Auth2ProfileWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for headercompos2 component.
  late Headercompos2Model headercompos2Model;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    headercompos2Model = createModel(context, () => Headercompos2Model());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    headercompos2Model.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
