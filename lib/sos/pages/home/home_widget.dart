import '/backend/api_requests/api_calls.dart';
import '/componant/header_home/header_home_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_autocomplete_options_list.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'home_model.dart';
export 'home_model.dart';

class HomeWidget extends StatefulWidget {
  const HomeWidget({super.key});

  @override
  State<HomeWidget> createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> with TickerProviderStateMixin {
  late HomeModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  LatLng? currentUserLocationValue;
  bool findplaceFocusListenerRegistered = false;

  final animationsMap = {
    'columnOnPageLoadAnimation1': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        ScaleEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: Offset(1.0, 1.0),
          end: Offset(1.0, 1.0),
        ),
      ],
    ),
    'containerOnPageLoadAnimation1': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: 0.0,
          end: 1.0,
        ),
      ],
    ),
    'columnOnPageLoadAnimation2': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        ScaleEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: Offset(1.0, 1.0),
          end: Offset(1.0, 1.0),
        ),
      ],
    ),
    'containerOnPageLoadAnimation2': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: 0.0,
          end: 1.0,
        ),
      ],
    ),
    'columnOnPageLoadAnimation3': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        ScaleEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: Offset(1.0, 1.0),
          end: Offset(1.0, 1.0),
        ),
      ],
    ),
    'containerOnPageLoadAnimation3': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: 0.0,
          end: 1.0,
        ),
      ],
    ),
    'columnOnPageLoadAnimation4': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        ScaleEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: Offset(1.0, 1.0),
          end: Offset(1.0, 1.0),
        ),
      ],
    ),
    'containerOnPageLoadAnimation4': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: 0.0,
          end: 1.0,
        ),
      ],
    ),
    'containerOnPageLoadAnimation5': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: 0.0,
          end: 1.0,
        ),
      ],
    ),
  };

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HomeModel());

    _model.findplaceController ??= TextEditingController();

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
      future: GooglePlaceApiCall.call(
        query: _model.findplaceSelectedOption,
      ),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
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
        final homeGooglePlaceApiResponse = snapshot.data!;
        return GestureDetector(
          onTap: () => _model.unfocusNode.canRequestFocus
              ? FocusScope.of(context).requestFocus(_model.unfocusNode)
              : FocusScope.of(context).unfocus(),
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
            body: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  wrapWithModel(
                    model: _model.headerHomeModel,
                    updateCallback: () => setState(() {}),
                    child: HeaderHomeWidget(),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 25.0, 0.0, 0.0),
                    child: Container(
                      width: double.infinity,
                      height: 10.0,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(16.0, 8.0, 16.0, 8.0),
                    child: Autocomplete<String>(
                      initialValue: TextEditingValue(),
                      optionsBuilder: (textEditingValue) {
                        if (textEditingValue.text == '') {
                          return const Iterable<String>.empty();
                        }
                        return GooglePlaceApiCall.placeName(
                          homeGooglePlaceApiResponse.jsonBody,
                        )!
                            .where((option) {
                          final lowercaseOption = option.toLowerCase();
                          return lowercaseOption
                              .contains(textEditingValue.text.toLowerCase());
                        });
                      },
                      optionsViewBuilder: (context, onSelected, options) {
                        return AutocompleteOptionsList(
                          textFieldKey: _model.findplaceKey,
                          textController: _model.findplaceController!,
                          options: options.toList(),
                          onSelected: onSelected,
                          textStyle: FlutterFlowTheme.of(context).bodyMedium,
                          textHighlightStyle: TextStyle(),
                          elevation: 4.0,
                          optionBackgroundColor:
                              FlutterFlowTheme.of(context).primaryBackground,
                          optionHighlightColor:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          maxHeight: 200.0,
                        );
                      },
                      onSelected: (String selection) {
                        setState(
                            () => _model.findplaceSelectedOption = selection);
                        FocusScope.of(context).unfocus();
                      },
                      fieldViewBuilder: (
                        context,
                        textEditingController,
                        focusNode,
                        onEditingComplete,
                      ) {
                        _model.findplaceFocusNode = focusNode;
                        if (!findplaceFocusListenerRegistered) {
                          findplaceFocusListenerRegistered = true;
                          _model.findplaceFocusNode!
                              .addListener(() => setState(() {}));
                        }
                        _model.findplaceController = textEditingController;
                        return TextFormField(
                          key: _model.findplaceKey,
                          controller: textEditingController,
                          focusNode: focusNode,
                          onEditingComplete: onEditingComplete,
                          autofocus: true,
                          obscureText: false,
                          decoration: InputDecoration(
                            labelText: 'ค้นหาสถานที่..',
                            labelStyle: FlutterFlowTheme.of(context)
                                .labelMedium
                                .override(
                                  fontFamily: 'Plus Jakarta Sans',
                                  color: Color(0xFF606A85),
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.w500,
                                ),
                            hintStyle: FlutterFlowTheme.of(context)
                                .labelMedium
                                .override(
                                  fontFamily: 'Plus Jakarta Sans',
                                  color: Color(0xFF606A85),
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.w500,
                                ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0xFFE5E7EB),
                                width: 2.0,
                              ),
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0xFF981616),
                                width: 2.0,
                              ),
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0xFFFF5963),
                                width: 2.0,
                              ),
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                            focusedErrorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0xFFFF5963),
                                width: 2.0,
                              ),
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                            contentPadding: EdgeInsetsDirectional.fromSTEB(
                                20.0, 0.0, 0.0, 0.0),
                            suffixIcon: Icon(
                              Icons.search_rounded,
                              color: Color(0xFF606A85),
                            ),
                          ),
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Plus Jakarta Sans',
                                    color: FlutterFlowTheme.of(context)
                                        .primaryBackground,
                                    fontSize: 14.0,
                                    fontWeight: FontWeight.w500,
                                  ),
                          textAlign: TextAlign.start,
                          cursorColor: Color(0xFF6F61EF),
                          validator: _model.findplaceControllerValidator
                              .asValidator(context),
                        );
                      },
                    ),
                  ),
                  FlipCard(
                    fill: Fill.fillBack,
                    direction: FlipDirection.HORIZONTAL,
                    speed: 400,
                    front: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              16.0, 16.0, 16.0, 16.0),
                          child: Container(
                            width: 402.0,
                            height: 155.0,
                            decoration: BoxDecoration(
                              color: Color(0x00EE8B60),
                              image: DecorationImage(
                                fit: BoxFit.fill,
                                alignment: AlignmentDirectional(0.0, 0.0),
                                image: Image.asset(
                                  'assets/images/Group_34.png',
                                ).image,
                              ),
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(12.0),
                                bottomRight: Radius.circular(12.0),
                                topLeft: Radius.circular(12.0),
                                topRight: Radius.circular(12.0),
                              ),
                              shape: BoxShape.rectangle,
                            ),
                            alignment: AlignmentDirectional(0.0, 0.0),
                          ),
                        ),
                      ],
                    ),
                    back: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(
                          16.0, 16.0, 16.0, 16.0),
                      child: Container(
                        width: 402.0,
                        height: 164.0,
                        decoration: BoxDecoration(
                          color: Color(0x00EE8B60),
                          image: DecorationImage(
                            fit: BoxFit.fitWidth,
                            alignment: AlignmentDirectional(0.0, 0.0),
                            image: Image.asset(
                              'assets/images/Group_35.png',
                            ).image,
                          ),
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(12.0),
                            bottomRight: Radius.circular(12.0),
                            topLeft: Radius.circular(12.0),
                            topRight: Radius.circular(12.0),
                          ),
                        ),
                        alignment: AlignmentDirectional(0.0, 0.0),
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(16.0, 10.0, 0.0, 5.0),
                    child: Text(
                      'แจ้งเหตุทั่วไป',
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Inter',
                            fontSize: 24.0,
                          ),
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(10.0, 16.0, 0.0, 16.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Container(
                          width: 90.0,
                          height: 100.0,
                          decoration: BoxDecoration(
                            color: Color(0x004B39EF),
                          ),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                5.0, 0.0, 5.0, 0.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Align(
                                  alignment: AlignmentDirectional(0.0, 0.0),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        1.0, 1.0, 1.0, 1.0),
                                    child: InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        currentUserLocationValue =
                                            await getCurrentUserLocation(
                                                defaultLocation:
                                                    LatLng(0.0, 0.0));

                                        context.pushNamed(
                                          'PoliceForm',
                                          queryParameters: {
                                            'geolocationPolice': serializeParam(
                                              currentUserLocationValue,
                                              ParamType.LatLng,
                                            ),
                                          }.withoutNulls,
                                        );
                                      },
                                      child: Container(
                                        width: 75.0,
                                        height: 75.0,
                                        decoration: BoxDecoration(
                                          color: Color(0x004B39EF),
                                          image: DecorationImage(
                                            fit: BoxFit.fill,
                                            alignment:
                                                AlignmentDirectional(0.0, 0.0),
                                            image: Image.asset(
                                              Theme.of(context).brightness ==
                                                      Brightness.dark
                                                  ? 'assets/images/__1_-removebg-preview.png'
                                                  : 'assets/images/__1_-removebg-preview.png',
                                            ).image,
                                          ),
                                        ),
                                        alignment:
                                            AlignmentDirectional(0.0, 0.0),
                                        child: Align(
                                          alignment:
                                              AlignmentDirectional(0.0, 0.0),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    16.0, 16.0, 16.0, 16.0),
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                              child: Image.asset(
                                                'assets/images/police_white_male_people_avatar_icon_141447_1.png',
                                                width: 50.0,
                                                height: 50.0,
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ).animateOnPageLoad(animationsMap[
                                        'containerOnPageLoadAnimation1']!),
                                  ),
                                ),
                                Align(
                                  alignment: AlignmentDirectional(0.0, 1.0),
                                  child: Text(
                                    'สถานีตำรวจ',
                                    style:
                                        FlutterFlowTheme.of(context).bodyMedium,
                                  ),
                                ),
                              ],
                            ).animateOnPageLoad(
                                animationsMap['columnOnPageLoadAnimation1']!),
                          ),
                        ),
                        Container(
                          width: 90.0,
                          height: 100.0,
                          decoration: BoxDecoration(
                            color: Color(0x004B39EF),
                          ),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                5.0, 0.0, 5.0, 0.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Align(
                                  alignment: AlignmentDirectional(0.0, 0.0),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        1.0, 1.0, 1.0, 1.0),
                                    child: InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        currentUserLocationValue =
                                            await getCurrentUserLocation(
                                                defaultLocation:
                                                    LatLng(0.0, 0.0));

                                        context.pushNamed(
                                          'HospitalForm',
                                          queryParameters: {
                                            'geolocaltionHospital':
                                                serializeParam(
                                              currentUserLocationValue,
                                              ParamType.LatLng,
                                            ),
                                          }.withoutNulls,
                                        );
                                      },
                                      child: Container(
                                        width: 75.0,
                                        height: 75.0,
                                        decoration: BoxDecoration(
                                          color: Color(0x004B39EF),
                                          image: DecorationImage(
                                            fit: BoxFit.fill,
                                            alignment:
                                                AlignmentDirectional(0.0, 0.0),
                                            image: Image.asset(
                                              Theme.of(context).brightness ==
                                                      Brightness.dark
                                                  ? 'assets/images/__1_-removebg-preview.png'
                                                  : 'assets/images/__1_-removebg-preview.png',
                                            ).image,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(0.0),
                                        ),
                                        alignment:
                                            AlignmentDirectional(0.0, 0.0),
                                        child: Align(
                                          alignment:
                                              AlignmentDirectional(0.0, 0.0),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    16.0, 16.0, 16.0, 16.0),
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                              child: Image.asset(
                                                'assets/images/hospital_health_clinic_urban_buildings_medical_icon_134527_1.png',
                                                width: 50.0,
                                                height: 50.0,
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ).animateOnPageLoad(animationsMap[
                                        'containerOnPageLoadAnimation2']!),
                                  ),
                                ),
                                Align(
                                  alignment: AlignmentDirectional(0.0, 1.0),
                                  child: Text(
                                    'โรงพยาบาล',
                                    style:
                                        FlutterFlowTheme.of(context).bodyMedium,
                                  ),
                                ),
                              ],
                            ).animateOnPageLoad(
                                animationsMap['columnOnPageLoadAnimation2']!),
                          ),
                        ),
                        Container(
                          width: 90.0,
                          height: 100.0,
                          decoration: BoxDecoration(
                            color: Color(0x004B39EF),
                          ),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                5.0, 0.0, 5.0, 0.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Align(
                                  alignment: AlignmentDirectional(0.0, 0.0),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        1.0, 1.0, 1.0, 1.0),
                                    child: InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        currentUserLocationValue =
                                            await getCurrentUserLocation(
                                                defaultLocation:
                                                    LatLng(0.0, 0.0));

                                        context.pushNamed(
                                          'FireStationForm',
                                          queryParameters: {
                                            'geolocationFire': serializeParam(
                                              currentUserLocationValue,
                                              ParamType.LatLng,
                                            ),
                                          }.withoutNulls,
                                        );
                                      },
                                      child: Container(
                                        width: 75.0,
                                        height: 75.0,
                                        decoration: BoxDecoration(
                                          color: Color(0x004B39EF),
                                          image: DecorationImage(
                                            fit: BoxFit.fill,
                                            alignment:
                                                AlignmentDirectional(0.0, 0.0),
                                            image: Image.asset(
                                              Theme.of(context).brightness ==
                                                      Brightness.dark
                                                  ? 'assets/images/__1_-removebg-preview.png'
                                                  : 'assets/images/__1_-removebg-preview.png',
                                            ).image,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(0.0),
                                        ),
                                        alignment:
                                            AlignmentDirectional(0.0, 0.0),
                                        child: Align(
                                          alignment:
                                              AlignmentDirectional(0.0, 0.0),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    16.0, 16.0, 16.0, 16.0),
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                              child: Image.asset(
                                                'assets/images/Pngtreefire_extinguisher_fire_safety_hand_7014664.png',
                                                width: 50.0,
                                                height: 50.0,
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ).animateOnPageLoad(animationsMap[
                                        'containerOnPageLoadAnimation3']!),
                                  ),
                                ),
                                Align(
                                  alignment: AlignmentDirectional(0.0, 1.0),
                                  child: Text(
                                    'สถานีดับเพลิง',
                                    style:
                                        FlutterFlowTheme.of(context).bodyMedium,
                                  ),
                                ),
                              ],
                            ).animateOnPageLoad(
                                animationsMap['columnOnPageLoadAnimation3']!),
                          ),
                        ),
                        Container(
                          width: 100.0,
                          height: 100.0,
                          decoration: BoxDecoration(
                            color: Color(0x004B39EF),
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Align(
                                alignment: AlignmentDirectional(0.0, 0.0),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      1.0, 1.0, 1.0, 1.0),
                                  child: InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      currentUserLocationValue =
                                          await getCurrentUserLocation(
                                              defaultLocation:
                                                  LatLng(0.0, 0.0));

                                      context.pushNamed(
                                        'RescueForm',
                                        queryParameters: {
                                          'geolocationRes': serializeParam(
                                            currentUserLocationValue,
                                            ParamType.LatLng,
                                          ),
                                        }.withoutNulls,
                                      );
                                    },
                                    child: Container(
                                      width: 75.0,
                                      height: 75.0,
                                      decoration: BoxDecoration(
                                        color: Color(0x004B39EF),
                                        image: DecorationImage(
                                          fit: BoxFit.fill,
                                          alignment:
                                              AlignmentDirectional(0.0, 0.0),
                                          image: Image.asset(
                                            Theme.of(context).brightness ==
                                                    Brightness.dark
                                                ? 'assets/images/__1_-removebg-preview.png'
                                                : 'assets/images/__1_-removebg-preview.png',
                                          ).image,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(0.0),
                                      ),
                                      alignment: AlignmentDirectional(0.0, 0.0),
                                      child: Align(
                                        alignment:
                                            AlignmentDirectional(0.0, 0.0),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  16.0, 16.0, 16.0, 16.0),
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                            child: Image.asset(
                                              'assets/images/ambulance.png',
                                              width: 50.0,
                                              height: 50.0,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ).animateOnPageLoad(animationsMap[
                                      'containerOnPageLoadAnimation4']!),
                                ),
                              ),
                              Align(
                                alignment: AlignmentDirectional(0.0, 1.0),
                                child: Text(
                                  'กู้ภัยสว่างกตัญญู',
                                  style:
                                      FlutterFlowTheme.of(context).bodyMedium,
                                ),
                              ),
                            ],
                          ).animateOnPageLoad(
                              animationsMap['columnOnPageLoadAnimation4']!),
                        ),
                      ],
                    ),
                  ),
                  Divider(
                    thickness: 1.0,
                    color: Color(0xFFE5E7EB),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(16.0, 10.0, 0.0, 0.0),
                    child: Text(
                      'บริการอื่นๆ',
                      style: FlutterFlowTheme.of(context).labelMedium.override(
                            fontFamily: 'Plus Jakarta Sans',
                            color: Color(0xFF606A85),
                            fontSize: 24.0,
                            fontWeight: FontWeight.w500,
                          ),
                    ),
                  ),
                  Align(
                    alignment: AlignmentDirectional(0.0, 0.0),
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 0.0, 0.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            width: 90.0,
                            height: 100.0,
                            decoration: BoxDecoration(
                              color: Color(0x004B39EF),
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Align(
                                  alignment: AlignmentDirectional(0.0, 0.0),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        1.0, 1.0, 1.0, 1.0),
                                    child: InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        currentUserLocationValue =
                                            await getCurrentUserLocation(
                                                defaultLocation:
                                                    LatLng(0.0, 0.0));

                                        context.pushNamed(
                                          'CarRepairForm',
                                          queryParameters: {
                                            'geolocationCarrepai':
                                                serializeParam(
                                              currentUserLocationValue,
                                              ParamType.LatLng,
                                            ),
                                          }.withoutNulls,
                                        );
                                      },
                                      child: Container(
                                        width: 75.0,
                                        height: 75.0,
                                        decoration: BoxDecoration(
                                          color: Color(0x004B39EF),
                                          image: DecorationImage(
                                            fit: BoxFit.fill,
                                            alignment:
                                                AlignmentDirectional(0.0, 0.0),
                                            image: Image.asset(
                                              'assets/images/__1_-removebg-preview.png',
                                            ).image,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(0.0),
                                        ),
                                        alignment:
                                            AlignmentDirectional(0.0, 0.0),
                                        child: Align(
                                          alignment:
                                              AlignmentDirectional(0.0, 0.0),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    16.0, 16.0, 16.0, 16.0),
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                              child: Image.asset(
                                                'assets/images/146manmechanic2_100581_1.png',
                                                width: 50.0,
                                                height: 50.0,
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ).animateOnPageLoad(animationsMap[
                                        'containerOnPageLoadAnimation5']!),
                                  ),
                                ),
                                Align(
                                  alignment: AlignmentDirectional(0.0, 1.0),
                                  child: Text(
                                    'ช่างซ่อมรถ',
                                    style:
                                        FlutterFlowTheme.of(context).bodyMedium,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
