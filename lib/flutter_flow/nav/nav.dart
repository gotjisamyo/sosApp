import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '/backend/backend.dart';

import '/auth/base_auth_user_provider.dart';

import '/index.dart';
import '/main.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';

export 'package:go_router/go_router.dart';
export 'serialization_util.dart';

const kTransitionInfoKey = '__transition_info__';

class AppStateNotifier extends ChangeNotifier {
  AppStateNotifier._();

  static AppStateNotifier? _instance;
  static AppStateNotifier get instance => _instance ??= AppStateNotifier._();

  BaseAuthUser? initialUser;
  BaseAuthUser? user;
  bool showSplashImage = true;
  String? _redirectLocation;

  /// Determines whether the app will refresh and build again when a sign
  /// in or sign out happens. This is useful when the app is launched or
  /// on an unexpected logout. However, this must be turned off when we
  /// intend to sign in/out and then navigate or perform any actions after.
  /// Otherwise, this will trigger a refresh and interrupt the action(s).
  bool notifyOnAuthChange = true;

  bool get loading => user == null || showSplashImage;
  bool get loggedIn => user?.loggedIn ?? false;
  bool get initiallyLoggedIn => initialUser?.loggedIn ?? false;
  bool get shouldRedirect => loggedIn && _redirectLocation != null;

  String getRedirectLocation() => _redirectLocation!;
  bool hasRedirect() => _redirectLocation != null;
  void setRedirectLocationIfUnset(String loc) => _redirectLocation ??= loc;
  void clearRedirectLocation() => _redirectLocation = null;

  /// Mark as not needing to notify on a sign in / out when we intend
  /// to perform subsequent actions (such as navigation) afterwards.
  void updateNotifyOnAuthChange(bool notify) => notifyOnAuthChange = notify;

  void update(BaseAuthUser newUser) {
    final shouldUpdate =
        user?.uid == null || newUser.uid == null || user?.uid != newUser.uid;
    initialUser ??= newUser;
    user = newUser;
    // Refresh the app on auth change unless explicitly marked otherwise.
    // No need to update unless the user has changed.
    if (notifyOnAuthChange && shouldUpdate) {
      notifyListeners();
    }
    // Once again mark the notifier as needing to update on auth change
    // (in order to catch sign in / out events).
    updateNotifyOnAuthChange(true);
  }

  void stopShowingSplashImage() {
    showSplashImage = false;
    notifyListeners();
  }
}

GoRouter createRouter(AppStateNotifier appStateNotifier) => GoRouter(
      initialLocation: '/',
      debugLogDiagnostics: true,
      refreshListenable: appStateNotifier,
      errorBuilder: (context, state) =>
          appStateNotifier.loggedIn ? const NavBarPage() : const OnboardingsWidget(),
      routes: [
        FFRoute(
          name: '_initialize',
          path: '/',
          builder: (context, _) =>
              appStateNotifier.loggedIn ? const NavBarPage() : const OnboardingsWidget(),
        ),
        FFRoute(
          name: 'Onboardings',
          path: '/onboardings',
          builder: (context, params) => const OnboardingsWidget(),
        ),
        FFRoute(
          name: 'SwichUser',
          path: '/swichUser',
          builder: (context, params) => SwichUserWidget(
            officerSwich: params.getParam('officerSwich', ParamType.bool),
          ),
        ),
        FFRoute(
          name: 'auth_2_ForgotPassword',
          path: '/auth2ForgotPassword',
          builder: (context, params) => const Auth2ForgotPasswordWidget(),
        ),
        FFRoute(
          name: 'auth_2_createProfile',
          path: '/auth2CreateProfile',
          builder: (context, params) => const Auth2CreateProfileWidget(),
        ),
        FFRoute(
          name: 'auth_2_Profile',
          path: '/auth2Profile',
          builder: (context, params) => const Auth2ProfileWidget(),
        ),
        FFRoute(
          name: 'auth_2_EditProfile',
          path: '/auth2EditProfile',
          builder: (context, params) => const Auth2EditProfileWidget(),
        ),
        FFRoute(
          name: 'Termsandconditions',
          path: '/termsandconditions',
          builder: (context, params) => const TermsandconditionsWidget(),
        ),
        FFRoute(
          name: 'home',
          path: '/home',
          builder: (context, params) => params.isEmpty
              ? const NavBarPage(initialPage: 'home')
              : const NavBarPage(
                  initialPage: 'home',
                  page: HomeWidget(),
                ),
        ),
        FFRoute(
          name: 'ReportAlert',
          path: '/reportAlert',
          builder: (context, params) => params.isEmpty
              ? const NavBarPage(initialPage: 'ReportAlert')
              : ReportAlertWidget(
                  noti: params.getParam('noti', ParamType.int),
                ),
        ),
        FFRoute(
          name: 'emergency',
          path: '/emergency',
          builder: (context, params) => params.isEmpty
              ? const NavBarPage(initialPage: 'emergency')
              : const EmergencyWidget(),
        ),
        FFRoute(
          name: 'settingpage',
          path: '/settingpage',
          builder: (context, params) => const SettingpageWidget(),
        ),
        FFRoute(
          name: 'auth_1_EditProfile',
          path: '/auth1EditProfile',
          builder: (context, params) => const Auth1EditProfileWidget(),
        ),
        FFRoute(
          name: 'auth_2_Create',
          path: '/auth2Create',
          builder: (context, params) => Auth2CreateWidget(
            creatOfficer: params.getParam('creatOfficer', ParamType.bool),
          ),
        ),
        FFRoute(
          name: 'auth_1_createProfile',
          path: '/auth1CreateProfile',
          builder: (context, params) => Auth1CreateProfileWidget(
            isOfficerProfile:
                params.getParam('isOfficerProfile', ParamType.bool),
          ),
        ),
        FFRoute(
          name: 'auth_1_Login',
          path: '/auth1Login',
          builder: (context, params) => Auth1LoginWidget(
            isOfficerLogin: params.getParam('isOfficerLogin', ParamType.bool),
          ),
        ),
        FFRoute(
          name: 'RescueForm',
          path: '/rescueForm',
          builder: (context, params) => RescueFormWidget(
            geolocationRes: params.getParam('geolocationRes', ParamType.LatLng),
          ),
        ),
        FFRoute(
          name: 'PoliceForm',
          path: '/policeForm',
          builder: (context, params) => PoliceFormWidget(
            geolocationPolice:
                params.getParam('geolocationPolice', ParamType.LatLng),
          ),
        ),
        FFRoute(
          name: 'HospitalForm',
          path: '/hospitalForm',
          builder: (context, params) => HospitalFormWidget(
            geolocaltionHospital:
                params.getParam('geolocaltionHospital', ParamType.LatLng),
          ),
        ),
        FFRoute(
          name: 'CarRepairForm',
          path: '/carRepairForm',
          builder: (context, params) => CarRepairFormWidget(
            geolocationCarrepai:
                params.getParam('geolocationCarrepai', ParamType.LatLng),
          ),
        ),
        FFRoute(
          name: 'FireStationForm',
          path: '/fireStationForm',
          builder: (context, params) => FireStationFormWidget(
            geolocationFire:
                params.getParam('geolocationFire', ParamType.LatLng),
          ),
        ),
        FFRoute(
          name: 'NotifyDetails',
          path: '/notifyDetails',
          asyncParams: {
            'report': getDoc(['users', 'Report_To_Station'],
                ReportToStationRecord.fromSnapshot),
          },
          builder: (context, params) => NotifyDetailsWidget(
            report: params.getParam('report', ParamType.Document),
          ),
        ),
        FFRoute(
          name: 'NotifyFormBell',
          path: '/notifyFormBell',
          builder: (context, params) => const NotifyFormBellWidget(),
        ),
        FFRoute(
          name: 'HomeOfficer',
          path: '/homeOfficer',
          builder: (context, params) => params.isEmpty
              ? const NavBarPage(initialPage: 'HomeOfficer')
              : const HomeOfficerWidget(),
        ),
        FFRoute(
          name: 'auth_1_Profile',
          path: '/auth1Profile',
          builder: (context, params) => const Auth1ProfileWidget(),
        ),
        FFRoute(
          name: 'changHome',
          path: '/changHome',
          builder: (context, params) => const ChangHomeWidget(),
        ),
        FFRoute(
          name: 'reportDetail',
          path: '/reportDetail',
          requireAuth: true,
          asyncParams: {
            'report': getDoc(['users', 'Report_To_Station'],
                ReportToStationRecord.fromSnapshot),
          },
          builder: (context, params) => ReportDetailWidget(
            report: params.getParam('report', ParamType.Document),
          ),
        )
      ].map((r) => r.toRoute(appStateNotifier)).toList(),
    );

extension NavParamExtensions on Map<String, String?> {
  Map<String, String> get withoutNulls => Map.fromEntries(
        entries
            .where((e) => e.value != null)
            .map((e) => MapEntry(e.key, e.value!)),
      );
}

extension NavigationExtensions on BuildContext {
  void goNamedAuth(
    String name,
    bool mounted, {
    Map<String, String> pathParameters = const <String, String>{},
    Map<String, String> queryParameters = const <String, String>{},
    Object? extra,
    bool ignoreRedirect = false,
  }) =>
      !mounted || GoRouter.of(this).shouldRedirect(ignoreRedirect)
          ? null
          : goNamed(
              name,
              pathParameters: pathParameters,
              queryParameters: queryParameters,
              extra: extra,
            );

  void pushNamedAuth(
    String name,
    bool mounted, {
    Map<String, String> pathParameters = const <String, String>{},
    Map<String, String> queryParameters = const <String, String>{},
    Object? extra,
    bool ignoreRedirect = false,
  }) =>
      !mounted || GoRouter.of(this).shouldRedirect(ignoreRedirect)
          ? null
          : pushNamed(
              name,
              pathParameters: pathParameters,
              queryParameters: queryParameters,
              extra: extra,
            );

  void safePop() {
    // If there is only one route on the stack, navigate to the initial
    // page instead of popping.
    if (canPop()) {
      pop();
    } else {
      go('/');
    }
  }
}

extension GoRouterExtensions on GoRouter {
  AppStateNotifier get appState => AppStateNotifier.instance;
  void prepareAuthEvent([bool ignoreRedirect = false]) =>
      appState.hasRedirect() && !ignoreRedirect
          ? null
          : appState.updateNotifyOnAuthChange(false);
  bool shouldRedirect(bool ignoreRedirect) =>
      !ignoreRedirect && appState.hasRedirect();
  void clearRedirectLocation() => appState.clearRedirectLocation();
  void setRedirectLocationIfUnset(String location) =>
      appState.updateNotifyOnAuthChange(false);
}

extension _GoRouterStateExtensions on GoRouterState {
  Map<String, dynamic> get extraMap =>
      extra != null ? extra as Map<String, dynamic> : {};
  Map<String, dynamic> get allParams => <String, dynamic>{}
    ..addAll(pathParameters)
    ..addAll(queryParameters)
    ..addAll(extraMap);
  TransitionInfo get transitionInfo => extraMap.containsKey(kTransitionInfoKey)
      ? extraMap[kTransitionInfoKey] as TransitionInfo
      : TransitionInfo.appDefault();
}

class FFParameters {
  FFParameters(this.state, [this.asyncParams = const {}]);

  final GoRouterState state;
  final Map<String, Future<dynamic> Function(String)> asyncParams;

  Map<String, dynamic> futureParamValues = {};

  // Parameters are empty if the params map is empty or if the only parameter
  // present is the special extra parameter reserved for the transition info.
  bool get isEmpty =>
      state.allParams.isEmpty ||
      (state.extraMap.length == 1 &&
          state.extraMap.containsKey(kTransitionInfoKey));
  bool isAsyncParam(MapEntry<String, dynamic> param) =>
      asyncParams.containsKey(param.key) && param.value is String;
  bool get hasFutures => state.allParams.entries.any(isAsyncParam);
  Future<bool> completeFutures() => Future.wait(
        state.allParams.entries.where(isAsyncParam).map(
          (param) async {
            final doc = await asyncParams[param.key]!(param.value)
                .onError((_, __) => null);
            if (doc != null) {
              futureParamValues[param.key] = doc;
              return true;
            }
            return false;
          },
        ),
      ).onError((_, __) => [false]).then((v) => v.every((e) => e));

  dynamic getParam<T>(
    String paramName,
    ParamType type, [
    bool isList = false,
    List<String>? collectionNamePath,
  ]) {
    if (futureParamValues.containsKey(paramName)) {
      return futureParamValues[paramName];
    }
    if (!state.allParams.containsKey(paramName)) {
      return null;
    }
    final param = state.allParams[paramName];
    // Got parameter from `extras`, so just directly return it.
    if (param is! String) {
      return param;
    }
    // Return serialized value.
    return deserializeParam<T>(param, type, isList,
        collectionNamePath: collectionNamePath);
  }
}

class FFRoute {
  const FFRoute({
    required this.name,
    required this.path,
    required this.builder,
    this.requireAuth = false,
    this.asyncParams = const {},
    this.routes = const [],
  });

  final String name;
  final String path;
  final bool requireAuth;
  final Map<String, Future<dynamic> Function(String)> asyncParams;
  final Widget Function(BuildContext, FFParameters) builder;
  final List<GoRoute> routes;

  GoRoute toRoute(AppStateNotifier appStateNotifier) => GoRoute(
        name: name,
        path: path,
        redirect: (context, state) {
          if (appStateNotifier.shouldRedirect) {
            final redirectLocation = appStateNotifier.getRedirectLocation();
            appStateNotifier.clearRedirectLocation();
            return redirectLocation;
          }

          if (requireAuth && !appStateNotifier.loggedIn) {
            appStateNotifier.setRedirectLocationIfUnset(state.location);
            return '/onboardings';
          }
          return null;
        },
        pageBuilder: (context, state) {
          fixStatusBarOniOS16AndBelow(context);
          final ffParams = FFParameters(state, asyncParams);
          final page = ffParams.hasFutures
              ? FutureBuilder(
                  future: ffParams.completeFutures(),
                  builder: (context, _) => builder(context, ffParams),
                )
              : builder(context, ffParams);
          final child = appStateNotifier.loading
              ? Center(
                  child: SizedBox(
                    width: 50.0,
                    height: 50.0,
                    child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(
                        FlutterFlowTheme.of(context).primary,
                      ),
                    ),
                  ),
                )
              : page;

          final transitionInfo = state.transitionInfo;
          return transitionInfo.hasTransition
              ? CustomTransitionPage(
                  key: state.pageKey,
                  child: child,
                  transitionDuration: transitionInfo.duration,
                  transitionsBuilder:
                      (context, animation, secondaryAnimation, child) =>
                          PageTransition(
                    type: transitionInfo.transitionType,
                    duration: transitionInfo.duration,
                    reverseDuration: transitionInfo.duration,
                    alignment: transitionInfo.alignment,
                    child: child,
                  ).buildTransitions(
                    context,
                    animation,
                    secondaryAnimation,
                    child,
                  ),
                )
              : MaterialPage(key: state.pageKey, child: child);
        },
        routes: routes,
      );
}

class TransitionInfo {
  const TransitionInfo({
    required this.hasTransition,
    this.transitionType = PageTransitionType.fade,
    this.duration = const Duration(milliseconds: 300),
    this.alignment,
  });

  final bool hasTransition;
  final PageTransitionType transitionType;
  final Duration duration;
  final Alignment? alignment;

  static TransitionInfo appDefault() => const TransitionInfo(hasTransition: false);
}

class RootPageContext {
  const RootPageContext(this.isRootPage, [this.errorRoute]);
  final bool isRootPage;
  final String? errorRoute;

  static bool isInactiveRootPage(BuildContext context) {
    final rootPageContext = context.read<RootPageContext?>();
    final isRootPage = rootPageContext?.isRootPage ?? false;
    final location = GoRouter.of(context).location;
    return isRootPage &&
        location != '/' &&
        location != rootPageContext?.errorRoute;
  }

  static Widget wrap(Widget child, {String? errorRoute}) => Provider.value(
        value: RootPageContext(true, errorRoute),
        child: child,
      );
}
