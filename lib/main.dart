import 'package:flutter/material.dart';
import 'package:mvvm_provider_restapi_pref_solid_domainlayer/utils/routes/routes.dart';
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
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<AuthViewModel>(create: (_) => AuthViewModel()),
        ChangeNotifierProvider<UserViewModel>(create: (_) => UserViewModel()),
      ],
      child: MaterialApp.router(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        routeInformationParser: Routes.router.routeInformationParser,
        routerDelegate: Routes.router.routerDelegate,
        routeInformationProvider: Routes.router.routeInformationProvider,
      ),
    );
  }
}
