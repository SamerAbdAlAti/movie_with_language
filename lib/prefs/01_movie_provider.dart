import 'package:flutter/cupertino.dart';
import 'package:movie_with_language/models/movie_details_model.dart';

class MovieProvider extends ChangeNotifier {
  MovieDetailsModel movieDetailsModel = MovieDetailsModel.fromJson({});

  Future<void> movieDetailsMethod(MovieDetailsModel movieDetails) async {
    movieDetailsModel = movieDetails;
    notifyListeners();
  }
}
