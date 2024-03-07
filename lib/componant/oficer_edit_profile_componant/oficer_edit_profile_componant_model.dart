import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'oficer_edit_profile_componant_widget.dart'
    show OficerEditProfileComponantWidget;
import 'package:flutter/material.dart';

class OficerEditProfileComponantModel
    extends FlutterFlowModel<OficerEditProfileComponantWidget> {
  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl = '';

  // State field(s) for yourName widget.
  FocusNode? yourNameFocusNode;
  TextEditingController? yourNameController;
  String? Function(BuildContext, String?)? yourNameControllerValidator;
  // State field(s) for email widget.
  FocusNode? emailFocusNode;
  TextEditingController? emailController;
  String? Function(BuildContext, String?)? emailControllerValidator;
  // State field(s) for id_card widget.
  FocusNode? idCardFocusNode;
  TextEditingController? idCardController;
  String? Function(BuildContext, String?)? idCardControllerValidator;
  // State field(s) for phone widget.
  FocusNode? phoneFocusNode;
  TextEditingController? phoneController;
  String? Function(BuildContext, String?)? phoneControllerValidator;
  // State field(s) for password widget.
  FocusNode? passwordFocusNode;
  TextEditingController? passwordController;
  String? Function(BuildContext, String?)? passwordControllerValidator;
  // State field(s) for govDrop widget.
  String? govDropValue;
  FormFieldController<String>? govDropValueController;
  // State field(s) for Government widget.
  FocusNode? governmentFocusNode;
  TextEditingController? governmentController;
  String? Function(BuildContext, String?)? governmentControllerValidator;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    yourNameFocusNode?.dispose();
    yourNameController?.dispose();

    emailFocusNode?.dispose();
    emailController?.dispose();

    idCardFocusNode?.dispose();
    idCardController?.dispose();

    phoneFocusNode?.dispose();
    phoneController?.dispose();

    passwordFocusNode?.dispose();
    passwordController?.dispose();

    governmentFocusNode?.dispose();
    governmentController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
