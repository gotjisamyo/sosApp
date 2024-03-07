import '/componant/header_home/header_home_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'home_widget.dart' show HomeWidget;
import 'package:flutter/material.dart';

class HomeModel extends FlutterFlowModel<HomeWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for headerHome component.
  late HeaderHomeModel headerHomeModel;
  // State field(s) for findplace widget.
  final findplaceKey = GlobalKey();
  FocusNode? findplaceFocusNode;
  TextEditingController? findplaceController;
  String? findplaceSelectedOption;
  String? Function(BuildContext, String?)? findplaceControllerValidator;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    headerHomeModel = createModel(context, () => HeaderHomeModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    headerHomeModel.dispose();
    findplaceFocusNode?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
