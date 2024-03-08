import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import '/custom_code/widgets/index.dart' as custom_widgets;
import 'package:flutter/material.dart';
import 'googlemap_model.dart';
export 'googlemap_model.dart';

class GooglemapWidget extends StatefulWidget {
  const GooglemapWidget({
    super.key,
    required this.endLocation,
  });

  final LatLng? endLocation;

  @override
  State<GooglemapWidget> createState() => _GooglemapWidgetState();
}

class _GooglemapWidgetState extends State<GooglemapWidget> {
  late GooglemapModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  LatLng? currentUserLocationValue;

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => GooglemapModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<ApiCallResponse>(
      future: GeolocationApiCall.call(),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            body: Center(
              child: SizedBox(
                width: 50.0,
                height: 50.0,
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(
                    FlutterFlowTheme.of(context).primary,
                  ),
                ),
              ),
            ),
          );
        }
        final googlemapGeolocationApiResponse = snapshot.data!;
        return GestureDetector(
          onTap: () => _model.unfocusNode.canRequestFocus
              ? FocusScope.of(context).requestFocus(_model.unfocusNode)
              : FocusScope.of(context).unfocus(),
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            floatingActionButton: Align(
              alignment: const AlignmentDirectional(1.0, 1.0),
              child: Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 120.0),
                child: FloatingActionButton(
                  onPressed: () async {
                    _model.apiResultspl = await GeolocationApiCall.call();
                    if ((_model.apiResultspl?.succeeded ?? true)) {
                      _model.latlngString = await actions.jsonTostring(
                        GeolocationApiCall.mylatlng(
                          (_model.apiResultspl?.jsonBody ?? ''),
                        ),
                      );
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            'อัพเดทตำเเหน่งเรียบร้อย',
                            style: TextStyle(
                              color: FlutterFlowTheme.of(context).primaryText,
                            ),
                          ),
                          duration: const Duration(milliseconds: 4000),
                          backgroundColor: FlutterFlowTheme.of(context).success,
                        ),
                      );
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            'เรียกตำเเหน่งไม่สำเร็จ',
                            style: TextStyle(
                              color: FlutterFlowTheme.of(context).primaryText,
                            ),
                          ),
                          duration: const Duration(milliseconds: 4000),
                          backgroundColor:
                              FlutterFlowTheme.of(context).secondary,
                        ),
                      );
                    }

                    setState(() {});
                  },
                  backgroundColor: FlutterFlowTheme.of(context).tertiary,
                  elevation: 8.0,
                  child: Icon(
                    Icons.my_location,
                    color: FlutterFlowTheme.of(context).info,
                    size: 24.0,
                  ),
                ),
              ),
            ),
            body: Container(
              width: double.infinity,
              height: double.infinity,
              decoration: const BoxDecoration(
                color: Color(0x004B39EF),
              ),
              child: Card(
                clipBehavior: Clip.antiAliasWithSaveLayer,
                color: const Color(0x004B39EF),
                elevation: 4.0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Stack(
                  children: [
                    const SizedBox(
                      width: double.infinity,
                      height: double.infinity,
                      child: custom_widgets.MySosMap(
                        width: double.infinity,
                        height: double.infinity,
                      ),
                    ),
                    Align(
                      alignment: const AlignmentDirectional(0.89, -0.95),
                      child: InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          context.safePop();
                        },
                        child: Icon(
                          Icons.close_sharp,
                          color: FlutterFlowTheme.of(context).primaryText,
                          size: 36.0,
                        ),
                      ),
                    ),
                    Align(
                      alignment: const AlignmentDirectional(0.0, 1.0),
                      child: Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            16.0, 0.0, 16.0, 16.0),
                        child: FFButtonWidget(
                          onPressed: () async {
                            currentUserLocationValue =
                                await getCurrentUserLocation(
                                    defaultLocation: const LatLng(0.0, 0.0));
                            _model.apiResultq44 = await DirectionAPICall.call(
                              origin: currentUserLocationValue?.toString(),
                              destination: widget.endLocation?.toString(),
                            );
                            if ((_model.apiResultq44?.succeeded ?? true)) {
                              await showDialog(
                                context: context,
                                builder: (alertDialogContext) {
                                  return AlertDialog(
                                    content: Text(
                                        (_model.apiResultq44?.jsonBody ?? '')
                                            .toString()),
                                    actions: [
                                      TextButton(
                                        onPressed: () =>
                                            Navigator.pop(alertDialogContext),
                                        child: const Text('Ok'),
                                      ),
                                    ],
                                  );
                                },
                              );
                            } else {
                              await showDialog(
                                context: context,
                                builder: (alertDialogContext) {
                                  return AlertDialog(
                                    content: Text(
                                        (_model.apiResultq44?.statusCode ?? 200)
                                            .toString()),
                                    actions: [
                                      TextButton(
                                        onPressed: () =>
                                            Navigator.pop(alertDialogContext),
                                        child: const Text('Ok'),
                                      ),
                                    ],
                                  );
                                },
                              );
                            }

                            setState(() {});
                          },
                          text: 'เส้นทาง',
                          options: FFButtonOptions(
                            width: 150.0,
                            height: 40.0,
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                24.0, 0.0, 24.0, 0.0),
                            iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            color: FlutterFlowTheme.of(context).success,
                            textStyle: FlutterFlowTheme.of(context)
                                .titleSmall
                                .override(
                                  fontFamily: 'Inter',
                                  color: Colors.white,
                                ),
                            elevation: 3.0,
                            borderSide: const BorderSide(
                              color: Colors.transparent,
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
