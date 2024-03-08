import '/componant/oficer_edit_profile_componant/oficer_edit_profile_componant_widget.dart';
import '/componant/red_head_back/red_head_back_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'auth1_edit_profile_model.dart';
export 'auth1_edit_profile_model.dart';

class Auth1EditProfileWidget extends StatefulWidget {
  const Auth1EditProfileWidget({super.key});

  @override
  State<Auth1EditProfileWidget> createState() => _Auth1EditProfileWidgetState();
}

class _Auth1EditProfileWidgetState extends State<Auth1EditProfileWidget> {
  late Auth1EditProfileModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => Auth1EditProfileModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {});

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
        body: Stack(
          children: [
            Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Align(
                  alignment: const AlignmentDirectional(0.0, -1.0),
                  child: Container(
                    width: double.infinity,
                    constraints: const BoxConstraints(
                      maxWidth: 770.0,
                    ),
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                    ),
                    child: Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 24.0, 0.0, 24.0),
                      child: wrapWithModel(
                        model: _model.oficerEditProfileComponantModel,
                        updateCallback: () => setState(() {}),
                        child: OficerEditProfileComponantWidget(
                          title: 'แก้ไขโปรไฟล์',
                          confirmButtonText: 'บันทึก',
                          navigateAction: () async {},
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            wrapWithModel(
              model: _model.redHeadBackModel,
              updateCallback: () => setState(() {}),
              child: const RedHeadBackWidget(),
            ),
          ],
        ),
      ),
    );
  }
}
