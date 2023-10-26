import 'package:mvvm_provider_restapi_pref_solid_domainlayer/data/network/app_url.dart';
import 'package:mvvm_provider_restapi_pref_solid_domainlayer/data/network/base_api_services.dart';
import 'package:mvvm_provider_restapi_pref_solid_domainlayer/data/network/network_api_services.dart';
import 'package:mvvm_provider_restapi_pref_solid_domainlayer/model/color_name_list_model.dart';
import 'package:mvvm_provider_restapi_pref_solid_domainlayer/model/movie_model.dart';

class HomeRepository {
  final BaseApiServices _baseApiServices = NetworkApiServices();

  Future<MovieModel> getMovieList() async {
    try {
      dynamic response =
          _baseApiServices.getGetApiResponse(AppUrl.movieListEndPont);
      return MovieModel.fromJson(response);
    } catch (e) {
      rethrow;
    }
  }

  Future<dynamic> getColorNameList() async {
    try {
      dynamic response =
          _baseApiServices.getGetApiResponse(AppUrl.colorNameListEndPont);
      return ColorNameListModel.fromJson(response);
    } catch (e) {
      rethrow;
    }
  }
}
