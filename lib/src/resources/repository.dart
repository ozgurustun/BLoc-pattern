import 'package:blocPattern/src/models/item_model.dart';
import 'package:blocPattern/src/resources/movie_api_provider.dart';

class Repository{
  final moviesApiProvider = MovieApiProvider();

  Future<ItemModel> fetchAllMovies() => moviesApiProvider.fetchMovieList();
}