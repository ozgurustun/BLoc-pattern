import 'dart:convert';

import 'package:blocPattern/src/models/item_model.dart';
import 'package:http/http.dart';

class MovieApiProvider {
  Client client = Client();
  final _apiKey = '6019af9b3c6edfc39c43a2058b2d8acb';
  
  Future<ItemModel> fetchMovieList() async {
    print("Entered");
    final response = await client.get("http://api.themoviedb.org/3/movie/popular?api_key=$_apiKey");
    print(response.body.toString());
    if(response.statusCode == 200){
      return ItemModel.fromJson(jsonDecode(response.body));
    }else{
      throw Exception('Failed to load post');
    }
  }
}