import 'dart:ui';

import 'package:movie_with_language/generated/l10n.dart';

class ApiSettings {
  static const String _baseUrl = "https://api.themoviedb.org/3/";
  static const String _apiKey = "e61a4072c8db5a633d6eee74039a141a";
  static const String movieTopRated =
      "${_baseUrl}movie/now_playing?api_key=$_apiKey&language=";

  static const String moviePopular =
      "${_baseUrl}movie/top_rated?api_key=$_apiKey";

  static const String movieNowPlaying =
      "${_baseUrl}movie/now_playing?api_key=$_apiKey";

  static String getMovieDetails(int id){
    return "$_baseUrl/movie/$id?api_key=$_apiKey";
  }

// https://api.themoviedb.org/3//movie/top_rated?api_key=e61a4072c8db5a633d6eee74039a141a
}
