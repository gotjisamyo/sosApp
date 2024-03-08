import '/backend/api_requests/api_calls.dart';
import '/componant/header_home/header_home_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_autocomplete_options_list.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'home_widget.dart' show HomeWidget;
import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

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
