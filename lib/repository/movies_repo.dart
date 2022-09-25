import 'dart:convert';

import 'package:movie_rating_app/model/movies_model.dart';
import 'package:movie_rating_app/service/service.dart';
import 'package:http/http.dart' as http;

class MoviesRepo {
  final MoviesService moviesService = MoviesService();
  Future getMoviesRepo() async {
    try {
      http.Response response = await moviesService.getMoviesservice();
      print(response);
      MoviesModel moviesModel = MoviesModel.fromJson(json.decode(response.body));
      print(moviesModel);
      return moviesModel;

    } catch (e) {
      print(e.toString());
    }
  }
}
