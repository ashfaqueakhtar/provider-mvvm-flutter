import 'package:flutter/cupertino.dart';
import 'package:mvvm_provider_restapi_pref_solid_domainlayer/model/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserViewModel with ChangeNotifier {
  Future<bool> saveUser(UserModel model) async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setString("token", model.token ?? "");
    notifyListeners();
    return true;
  }

  Future<UserModel> getUser() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    final String token = pref.getString("token") ?? "";
    return UserModel(token: token);
  }

  Future<bool> removeUser() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    pref.remove("token");
    return true;
  }
}
