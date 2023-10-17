import 'package:flutter/material.dart';
import 'package:mvvm_provider_restapi_pref_solid_domainlayer/utils/routes/routes.dart';
import 'package:mvvm_provider_restapi_pref_solid_domainlayer/utils/routes/routes_names.dart';
import 'package:mvvm_provider_restapi_pref_solid_domainlayer/view/login_screen.dart';
import 'package:mvvm_provider_restapi_pref_solid_domainlayer/view/splash_screen.dart';
import 'package:mvvm_provider_restapi_pref_solid_domainlayer/view_model/auth_view_model.dart';
import 'package:mvvm_provider_restapi_pref_solid_domainlayer/view_model/user_view_model.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [
      ChangeNotifierProvider(create: (_)=> AuthViewModel()),
      ChangeNotifierProvider(create: (_)=> UserViewModel()),
    ],child: MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SplashScreen(),
      initialRoute: RoutesName.splash,
      onGenerateRoute: Routes.generateRoute,
    ),);
  }
}
