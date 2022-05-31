import 'package:dio/dio.dart';

import '../models/movie.dart';
import 'api.dart';

class ApiService {
  final Api api = Api();
  final Dio dio = Dio();

//pat /movie/popular
  //detail d'un film
  // Films populaire
  //getData('/movie/popular' /params
  Future<Response> getData(String path, {Map<String, dynamic>? params}) async {
    String url = api.baseUrl + path;
    //print(url);
    Map<String, dynamic> query = {'api_key': api.apiKey, 'language': 'fr-FR'};
    if (params != null) {
      query.addAll(params);
    }
    final response = await dio.get(url, queryParameters: query);
    if (response.statusCode == 200) {
      return response;
    } else {
      throw response;
    }
  }

  Future<List<Movie>> getPopularMovies({required int pageNumber}) async {
    Response response =
        await getData("movie/popular", params: {'page': pageNumber});
    if (response.statusCode == 200) {
      Map data = response.data;
      List<dynamic> results = data["results"];
      List<Movie> movies = [];
      for (dynamic json in results) {
        Movie movie = Movie.fromJson(json);
        movies.add(movie);
      }
      return movies;
    } else {
      throw response;
    }
  }
}
