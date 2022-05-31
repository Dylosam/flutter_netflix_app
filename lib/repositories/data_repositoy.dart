import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import '../models/movie.dart';
import '../services/api_service.dart';

class DataRepository with ChangeNotifier{
  ApiService apiService = ApiService();

  //private
  final List<Movie> _popularMovieList = [];
  int _popularMovieIndex = 1;


  //getter
  List <Movie> get popularMovieList => _popularMovieList;
  Future <void> getPopularMovies() async {
    try {
      List<Movie> movies =
        await apiService.getPopularMovies(pageNumber: _popularMovieIndex);
         _popularMovieList.addAll(movies);
         _popularMovieIndex++;
    } on Response catch (response){
      print("Erreur ${response.statusCode}");
      rethrow;
    }
  }
}