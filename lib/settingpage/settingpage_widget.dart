import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/permissions_util.dart';
import 'package:flutter/material.dart';
import 'settingpage_model.dart';
export 'settingpage_model.dart';

class SettingpageWidget extends StatefulWidget {
  const SettingpageWidget({super.key});

  @override
  State<SettingpageWidget> createState() => _SettingpageWidgetState();
}

class _SettingpageWidgetState extends State<SettingpageWidget> {
  late SettingpageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SettingpageModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        leading: FlutterFlowIconButton(
          borderColor: Colors.transparent,
          borderRadius: 30.0,
          buttonSize: 46.0,
          icon: const Icon(
            Icons.arrow_back_rounded,
            color: Color(0xFF14181B),
            size: 25.0,
          ),
          onPressed: () async {
            context.pop();
          },
        ),
        title: Text(
          'ตั้งค่า',
          style: FlutterFlowTheme.of(context).headlineSmall.override(
                fontFamily: 'Outfit',
                color: const Color(0xFF14181B),
                fontSize: 24.0,
                fontWeight: FontWeight.w500,
              ),
        ),
        actions: const [],
        centerTitle: false,
        elevation: 0.0,
      ),
      body: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 0.0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(
                  child: Text(
                    'เลือกการแจ้งเตือนที่คุณต้องการรับด้านล่าง แล้วเราจะอัปเดตการตั้งค่า',
                    style: FlutterFlowTheme.of(context).labelMedium.override(
                          fontFamily: 'Plus Jakarta Sans',
                          color: const Color(0xFF57636C),
                          fontSize: 14.0,
                          fontWeight: FontWeight.normal,
                        ),
                  ),
                ),
              ],
            ),
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(22.0, 0.0, 0.0, 0.0),
                child: Text(
                  'ระดับเสียง',
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Inter',
                        fontSize: 16.0,
                      ),
                ),
              ),
              Align(
                alignment: const AlignmentDirectional(0.0, 0.0),
                child: SliderTheme(
                  data: const SliderThemeData(
                    showValueIndicator: ShowValueIndicator.always,
                  ),
                  child: SizedBox(
                    width: 290.0,
                    child: Slider(
                      activeColor: FlutterFlowTheme.of(context).primary,
                      inactiveColor: FlutterFlowTheme.of(context).alternate,
                      min: 0.0,
                      max: 100.0,
                      value: _model.sliderValue ??= 20.0,
                      label: _model.sliderValue.toString(),
                      onChanged: (newValue) {
                        newValue = double.parse(newValue.toStringAsFixed(2));
                        setState(() => _model.sliderValue = newValue);
                      },
                    ),
                  ),
                ),
              ),
            ],
          ),
          Align(
            alignment: const AlignmentDirectional(-1.0, 0.0),
            child: Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 0.0, 0.0),
              child: Text(
                'เพิ่มหรือลดระดับเสียง',
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                      fontFamily: 'Inter',
                      color: const Color(0xFF8B97A2),
                    ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 0.0),
            child: SwitchListTile.adaptive(
              value: _model.switchNotiValue ??= true,
              onChanged: (newValue) async {
                setState(() => _model.switchNotiValue = newValue);
                if (newValue) {
                  await requestPermission(notificationsPermission);
                }
              },
              title: Text(
                'เปิดการเเจ้งเตือน',
                style: FlutterFlowTheme.of(context).bodyLarge.override(
                      fontFamily: 'Plus Jakarta Sans',
                      color: const Color(0xFF14181B),
                      fontSize: 16.0,
                      fontWeight: FontWeight.normal,
                      lineHeight: 2.0,
                    ),
              ),
              subtitle: Text(
                'ปิดการใช้งานหากไม่ต้องการรับการเเจ้งเตือน',
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                      fontFamily: 'Plus Jakarta Sans',
                      color: const Color(0xFF8B97A2),
                      fontSize: 14.0,
                      fontWeight: FontWeight.normal,
                    ),
              ),
              tileColor: Colors.white,
              activeColor: const Color(0xFF4B39EF),
              activeTrackColor: const Color(0x4C4B39EF),
              dense: false,
              controlAffinity: ListTileControlAffinity.trailing,
              contentPadding:
                  const EdgeInsetsDirectional.fromSTEB(24.0, 12.0, 24.0, 12.0),
            ),
          ),
          SwitchListTile.adaptive(
            value: _model.switchCallValue ??= true,
            onChanged: (newValue) async {
              setState(() => _model.switchCallValue = newValue);
              if (newValue) {
                await requestPermission(contactsPermission);
              }
            },
            title: Text(
              'การโทร',
              style: FlutterFlowTheme.of(context).bodyLarge.override(
                    fontFamily: 'Plus Jakarta Sans',
                    color: const Color(0xFF14181B),
                    fontSize: 16.0,
                    fontWeight: FontWeight.normal,
                    lineHeight: 2.0,
                  ),
            ),
            subtitle: Text(
              'ปิดการใช้งานหากไม่ต้องการรับสายโทรเข้า',
              style: FlutterFlowTheme.of(context).bodyMedium.override(
                    fontFamily: 'Plus Jakarta Sans',
                    color: const Color(0xFF8B97A2),
                    fontSize: 14.0,
                    fontWeight: FontWeight.normal,
                  ),
            ),
            tileColor: Colors.white,
            activeColor: const Color(0xFF4B39EF),
            activeTrackColor: const Color(0x4C4B39EF),
            dense: false,
            controlAffinity: ListTileControlAffinity.trailing,
            contentPadding:
                const EdgeInsetsDirectional.fromSTEB(24.0, 12.0, 24.0, 12.0),
          ),
          SwitchListTile.adaptive(
            value: _model.switchLocationValue ??= true,
            onChanged: (newValue) async {
              setState(() => _model.switchLocationValue = newValue);
              if (newValue) {
                await requestPermission(locationPermission);
              }
            },
            title: Text(
              'การเเชร์ตำเเหน่ง',
              style: FlutterFlowTheme.of(context).bodyLarge.override(
                    fontFamily: 'Plus Jakarta Sans',
                    color: const Color(0xFF14181B),
                    fontSize: 16.0,
                    fontWeight: FontWeight.normal,
                    lineHeight: 2.0,
                  ),
            ),
            subtitle: Text(
              'อนุญาตให้เข้าถึงการเเชร์ตำเเหน่ง',
              style: FlutterFlowTheme.of(context).bodyMedium.override(
                    fontFamily: 'Plus Jakarta Sans',
                    color: const Color(0xFF8B97A2),
                    fontSize: 14.0,
                    fontWeight: FontWeight.normal,
                  ),
            ),
            tileColor: Colors.white,
            activeColor: const Color(0xFF4B39EF),
            activeTrackColor: const Color(0x4C4B39EF),
            dense: false,
            controlAffinity: ListTileControlAffinity.trailing,
            contentPadding:
                const EdgeInsetsDirectional.fromSTEB(24.0, 12.0, 24.0, 12.0),
          ),
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(0.0, 24.0, 0.0, 0.0),
            child: FFButtonWidget(
              onPressed: () async {
                context.pushNamed('changHome');

                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                      'บันทึกการตั้งค่าเรียบร้อยแล้ว',
                      style: TextStyle(
                        color: FlutterFlowTheme.of(context).primaryText,
                      ),
                    ),
                    duration: const Duration(milliseconds: 4000),
                    backgroundColor: FlutterFlowTheme.of(context).secondary,
                  ),
                );
              },
              text: 'บันทึก',
              options: FFButtonOptions(
                width: 190.0,
                height: 50.0,
                padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                iconPadding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                color: const Color(0xFF981616),
                textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                      fontFamily: 'Plus Jakarta Sans',
                      color: Colors.white,
                      fontSize: 16.0,
                      fontWeight: FontWeight.w500,
                    ),
                elevation: 3.0,
                borderSide: const BorderSide(
                  color: Colors.transparent,
                  width: 1.0,
                ),
                borderRadius: BorderRadius.circular(30.0),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
