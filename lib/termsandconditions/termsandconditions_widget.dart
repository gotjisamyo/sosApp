import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'termsandconditions_model.dart';
export 'termsandconditions_model.dart';

class TermsandconditionsWidget extends StatefulWidget {
  const TermsandconditionsWidget({super.key});

  @override
  State<TermsandconditionsWidget> createState() =>
      _TermsandconditionsWidgetState();
}

class _TermsandconditionsWidgetState extends State<TermsandconditionsWidget> {
  late TermsandconditionsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TermsandconditionsModel());

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
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: SafeArea(
          top: true,
          child: Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(16.0, 16.0, 16.0, 16.0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(0.0, 30.0, 0.0, 0.0),
                    child: Text(
                      'เงื่อนไข และ ข้อตกลง',
                      style:
                          FlutterFlowTheme.of(context).headlineMedium.override(
                                fontFamily: 'Sora',
                                color: FlutterFlowTheme.of(context).primaryText,
                                fontSize: 30.0,
                              ),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(16.0, 20.0, 16.0, 16.0),
                    child: Text(
                      'เมื่อประเมินเหตุการณ์ว่าเป็นเหตุการณ์ฉุกเฉิน วิกฤติ ก็จะส่งทีมไปช่วยเหลือในที่เกิดเหตุต่าง ๆ ในทันที และส่งต่อไปยังหน่วยงานอื่น ๆ อย่างเช่น อุบัติเหตุรถยยนต์ จะมีหน่วยงานประสานกันทั้งในส่วนของตำรวจและโรงพยาบาลที่อยู่ใกล้ที่สุด ให้ทันท่วงทีต่อการรักษาชีวิตผู้ประสบเหตุฉุกเฉิน เพราะหากส่งผู้ประสบเหตุถึงมือแพทย์ช้าก็จะทำให้เสี่ยงต่อ\nชีวิตโดยเมื่อเจ้าหน้าที่ส่งผู้ป่วยฉุกเฉินถึงโรงพยาบาลแล้วก็\nเป็นหน้าที่ของโรงพยาบาลนั้น ๆ ที่จะทำการรักษา\nจนพ้นวิกฤตแล้วจึงจะพิจารณาส่งต่อผู้ป่วยไปยังโรงพยาบาลที่ผู้ป่วยมีสิทธิหรือมีประวัติในการรักษา',
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Inter',
                            color: FlutterFlowTheme.of(context).secondaryText,
                          ),
                    ),
                  ),
                  Align(
                    alignment: const AlignmentDirectional(0.0, 0.0),
                    child: FFButtonWidget(
                      onPressed: () async {
                        context.safePop();
                      },
                      text: 'กลับ',
                      options: FFButtonOptions(
                        width: double.infinity,
                        height: 50.0,
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        iconPadding:
                            const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        color: const Color(0xFF981616),
                        textStyle:
                            FlutterFlowTheme.of(context).titleSmall.override(
                                  fontFamily: 'Inter',
                                  color: Colors.white,
                                ),
                        elevation: 2.0,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
