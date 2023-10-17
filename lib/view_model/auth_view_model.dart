import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:mvvm_provider_restapi_pref_solid_domainlayer/model/user_model.dart';
import 'package:mvvm_provider_restapi_pref_solid_domainlayer/repository/auth_repository.dart';
import 'package:mvvm_provider_restapi_pref_solid_domainlayer/utils/routes/routes_names.dart';
import 'package:mvvm_provider_restapi_pref_solid_domainlayer/utils/utils.dart';
import 'package:mvvm_provider_restapi_pref_solid_domainlayer/view_model/user_view_model.dart';

class AuthViewModel with ChangeNotifier {
  final _authRepo = AuthRepository();

  bool _loading = false;
  bool _registerLoading = false;

  //Getter
  bool get loading => _loading;
  bool get registerLoading => _registerLoading;

  

  //Setter
  setLoading(bool value) {
    _loading = value;
    notifyListeners();
  }

  setRegisterLoading(bool value) {
    _registerLoading = value;
    notifyListeners();
  }

  Future<void> loginApi(dynamic data, BuildContext context) async {
    setLoading(true);
    _authRepo.postLoginApi(data).then((value) {
      setLoading(false);
      if (kDebugMode) print(value.toString());
      UserViewModel().saveUser(UserModel(token: value["token"]));
      Navigator.pushNamed(context, RoutesName.home);
    }).onError((error, stackTrace) {
      setLoading(false);
      Utils.flushErrorBarMessage(error.toString(), context);
      if (kDebugMode) print("ERROR " + error.toString());
    });
  }

  Future<void> registerApi(dynamic data, BuildContext context) async {
    setRegisterLoading(true);
    _authRepo.postRegisterApi(data).then((value) {
      setRegisterLoading(false);
      if (kDebugMode) print(value.toString());
      Navigator.pushNamed(context, RoutesName.home);
    }).onError((error, stackTrace) {
      setRegisterLoading(false);
      Utils.flushErrorBarMessage(error.toString(), context);
      if (kDebugMode) print("ERROR " + error.toString());
    });
  }
}
