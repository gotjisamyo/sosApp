import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/componant/header_home_officer/header_home_officer_widget.dart';
import '/flutter_flow/flutter_flow_autocomplete_options_list.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'home_officer_widget.dart' show HomeOfficerWidget;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class HomeOfficerModel extends FlutterFlowModel<HomeOfficerWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for headerHomeOfficer component.
  late HeaderHomeOfficerModel headerHomeOfficerModel;
  // State field(s) for findplace widget.
  final findplaceKey = GlobalKey();
  FocusNode? findplaceFocusNode;
  TextEditingController? findplaceController;
  String? findplaceSelectedOption;
  String? Function(BuildContext, String?)? findplaceControllerValidator;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    headerHomeOfficerModel =
        createModel(context, () => HeaderHomeOfficerModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    headerHomeOfficerModel.dispose();
    findplaceFocusNode?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
