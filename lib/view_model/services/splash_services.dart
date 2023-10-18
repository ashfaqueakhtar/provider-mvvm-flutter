import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:mvvm_provider_restapi_pref_solid_domainlayer/model/user_model.dart';
import 'package:mvvm_provider_restapi_pref_solid_domainlayer/utils/routes/routes_names.dart';
import 'package:mvvm_provider_restapi_pref_solid_domainlayer/view_model/user_view_model.dart';
import 'package:go_router/go_router.dart';

class SplashServices {
  Future<UserModel> getUserData() => UserViewModel().getUser();

  void checkAuthentication(BuildContext context) async {
    getUserData().then((value) async {
      await Future.delayed(const Duration(seconds: 1));
      if (value.token == "") {
        if (context.mounted) {
          GoRouter.of(context).pushReplacementNamed(RoutesName.login);
        }
      } else {
        if (context.mounted) {
          GoRouter.of(context).pushReplacementNamed(RoutesName.home);
        }
      }
    }).onError((error, stackTrace) {
      if (kDebugMode) {
        print(error.toString());
      }
    });
  }
}
