import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mvvm_provider_restapi_pref_solid_domainlayer/utils/routes/routes_names.dart';
import 'package:mvvm_provider_restapi_pref_solid_domainlayer/view/home_screen.dart';
import 'package:mvvm_provider_restapi_pref_solid_domainlayer/view/login_screen.dart';
import 'package:mvvm_provider_restapi_pref_solid_domainlayer/view/signup_screen.dart';
import 'package:mvvm_provider_restapi_pref_solid_domainlayer/view/splash_screen.dart';
import 'package:provider/provider.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutesName.home:
        return MaterialPageRoute(
            builder: (BuildContext builder) => const HomeScreen());
      case RoutesName.login:
        return MaterialPageRoute(
            builder: (BuildContext builder) => const LoginScreen());
      case RoutesName.signUp:
        return MaterialPageRoute(
            builder: (BuildContext builder) => const SignUpScreen());
      case RoutesName.splash:
        return MaterialPageRoute(
            builder: (BuildContext builder) => const SplashScreen());
      default:
        return MaterialPageRoute(builder: (_) =>
            const Scaffold(body: Center(child: Text("No Route Found"),),)
        );
    }
  }
}