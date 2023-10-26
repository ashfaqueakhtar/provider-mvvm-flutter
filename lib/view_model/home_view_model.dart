import 'package:flutter/material.dart';
import 'package:mvvm_provider_restapi_pref_solid_domainlayer/data/response/api_response.dart';
import 'package:mvvm_provider_restapi_pref_solid_domainlayer/model/color_name_list_model.dart';
import 'package:mvvm_provider_restapi_pref_solid_domainlayer/repository/home_repository.dart';

class HomeViewModel with ChangeNotifier {
  final _homeRepo = HomeRepository();

  ApiResponse<ColorNameListModel> colorNameList = ApiResponse.loading();

  setColorNameList(ApiResponse<ColorNameListModel> response) {
    print("HOMEVM: ${response.status}");
    print("HOMEVM: ${response.data}");
    colorNameList = response;
    notifyListeners();
  }

  Future<void> fetchNameList() async {
    setColorNameList(ApiResponse.loading());
    _homeRepo.getColorNameList().then((value) {
      setColorNameList(ApiResponse.completed(value));
    }).onError((error, stackTrace) {
      setColorNameList(ApiResponse.error(error.toString()));
    });
  }


}
