import 'package:mvvm_provider_restapi_pref_solid_domainlayer/data/network/app_url.dart';
import 'package:mvvm_provider_restapi_pref_solid_domainlayer/data/network/base_api_services.dart';
import 'package:mvvm_provider_restapi_pref_solid_domainlayer/data/network/network_api_services.dart';

class AuthRepository {
  final BaseApiServices _baseApiServices = NetworkApiServices();

  Future<dynamic> postLoginApi(dynamic data) async {
    try {
      dynamic response =
          _baseApiServices.getPostApiResponse(AppUrl.loginEndPont, data);
      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<dynamic> postRegisterApi(dynamic data) async {
    try {
      dynamic response =
          _baseApiServices.getPostApiResponse(AppUrl.registerEndPont, data);
      return response;
    } catch (e) {
      rethrow;
    }
  }
}
