import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:movie_with_language/api/api_settings.dart';
import 'package:movie_with_language/models/movie_details_model.dart';
import 'package:movie_with_language/provider/00_language_provider.dart';
import 'package:provider/provider.dart';
import '../generated/l10n.dart';
import '../models/movie_model.dart';

class MovieApiController {
  static Future<List<MovieModel>> getTopRatedMovie(BuildContext context) async {
    LanguageProvider provider = Provider.of(context);
    Uri uri =
        Uri.parse("${ApiSettings.movieTopRated}&language=${provider.language}");

    var response = await http.get(uri);

    if (response.statusCode == 200) {
      var json = jsonDecode(response.body);

      var movieList = json['results'] as List;

      return movieList.map((e) => MovieModel.fromJson(e)).toList();
    }

    return [];
  }

  static Future<List<MovieModel>> getNowPlayingMovie(
      BuildContext context) async {
    LanguageProvider provider = Provider.of(context);
    Uri uri = Uri.parse(
        "${ApiSettings.movieNowPlaying}&language=${provider.language}");
    var response = await http.get(uri);

    if (response.statusCode == 200) {
      var json = jsonDecode(response.body);

      var movieList = json['results'] as List;
      return movieList.map((e) => MovieModel.fromJson(e)).toList();
    }
    return [];
  }

  static Future<List<MovieModel>> getPopularMovie(BuildContext context) async {
    LanguageProvider provider = Provider.of(context);
    Uri uri =
        Uri.parse("${ApiSettings.moviePopular}&language=${provider.language}");
    var response = await http.get(uri);

    if (response.statusCode == 200) {
      var json = jsonDecode(response.body);

      var movieList = json['results'] as List;

      return movieList.map((e) => MovieModel.fromJson(e)).toList();
    } else {
      return [];
    }
  }

  static Future<MovieDetailsModel> getMovieDetails(BuildContext context,
      {required int id}) async {
    LanguageProvider provider = Provider.of(context, listen: false);
    Uri uri = Uri.parse(
        "${ApiSettings.getMovieDetails(id)}&language=${provider.language}");
    var response = await http.get(uri);

    if (response.statusCode == 200) {
      var json = jsonDecode(response.body);
      return MovieDetailsModel.fromJson(json);
    } else {
      return MovieDetailsModel.fromJson({});
    }
  }
}
