import '/componant/oficer_edit_profile_componant/oficer_edit_profile_componant_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'auth1_edit_profile_widget.dart' show Auth1EditProfileWidget;
import 'package:flutter/material.dart';

class Auth1EditProfileModel extends FlutterFlowModel<Auth1EditProfileWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for Oficer_editProfile_componant component.
  late OficerEditProfileComponantModel oficerEditProfileComponantModel;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    oficerEditProfileComponantModel =
        createModel(context, () => OficerEditProfileComponantModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    oficerEditProfileComponantModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
