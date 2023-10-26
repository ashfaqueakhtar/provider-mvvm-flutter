import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mvvm_provider_restapi_pref_solid_domainlayer/utils/routes/routes_names.dart';
import 'package:mvvm_provider_restapi_pref_solid_domainlayer/view/home_screen.dart';
import 'package:mvvm_provider_restapi_pref_solid_domainlayer/view/login_screen.dart';
import 'package:mvvm_provider_restapi_pref_solid_domainlayer/view/signup_screen.dart';
import 'package:mvvm_provider_restapi_pref_solid_domainlayer/view/splash_screen.dart';
import 'package:go_router/go_router.dart';

class Routes {
  static GoRouter router = GoRouter(
    routes: <RouteBase>[
      GoRoute(
        name: RoutesName.splash,
        path: '/',
        builder: (BuildContext context, GoRouterState state) {
          return const SplashScreen();
        },
      ),
      GoRoute(
        name: RoutesName.login,
        path: "/${RoutesName.login}",
        builder: (BuildContext context, GoRouterState state) {
          return const LoginScreen();
        },
      ),
      GoRoute(
        name: RoutesName.home,
        path: "/${RoutesName.home}",
        builder: (BuildContext context, GoRouterState state) {
          return const HomeScreen();
        },
      ),
      GoRoute(
        name: RoutesName.signUp,
        path: "/${RoutesName.signUp}",
        builder: (BuildContext context, GoRouterState state) {
          return const SignUpScreen();
        },
      ),
    ],
  );
}
