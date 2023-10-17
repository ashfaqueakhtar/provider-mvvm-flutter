import 'package:flutter/cupertino.dart';
import 'package:mvvm_provider_restapi_pref_solid_domainlayer/data/response/api_response.dart';
import 'package:mvvm_provider_restapi_pref_solid_domainlayer/model/Movie_model.dart';
import 'package:mvvm_provider_restapi_pref_solid_domainlayer/repository/home_repository.dart';

class HomeViewModel with ChangeNotifier {
  final _homeRepo = HomeRepository();

  ApiResponse<MovieModel> movieList = ApiResponse.loading();

  setMovieList(ApiResponse<MovieModel> response) {
    movieList = response;
    notifyListeners();
  }

  Future<void> fetchMovieList() async {
      setMovieList(ApiResponse.loading());
      _homeRepo.getMovieList().then((value) {
        setMovieList(ApiResponse.completed(value as MovieModel?));
    }).onError((error, stackTrace) {
      setMovieList(ApiResponse.error(error.toString()));
    });
  }
}
