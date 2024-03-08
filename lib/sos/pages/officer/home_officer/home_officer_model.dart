import '/componant/header_home_officer/header_home_officer_widget.dart';
import '/components/nav_bar_officer_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'home_officer_widget.dart' show HomeOfficerWidget;
import 'package:flutter/material.dart';

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
  // Model for navBarOfficer component.
  late NavBarOfficerModel navBarOfficerModel;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    headerHomeOfficerModel =
        createModel(context, () => HeaderHomeOfficerModel());
    navBarOfficerModel = createModel(context, () => NavBarOfficerModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    headerHomeOfficerModel.dispose();
    findplaceFocusNode?.dispose();

    navBarOfficerModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
