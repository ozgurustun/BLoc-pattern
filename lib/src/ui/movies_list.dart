import 'package:blocPattern/src/models/item_model.dart';
import 'package:flutter/material.dart';
import '../blocs/movies_bloc.dart';

class MovieList extends StatefulWidget {

  /*
  Never make any network or db call inside the build method and always make sure you dispose or close the open streams.
  */

  @override
  _MovieListState createState() => _MovieListState();
}

class _MovieListState extends State<MovieList> {

  @override
  void initState(){
    super.initState();
    bloc.fetchAllMovies();
  }

  @override
  void dispose() {
    bloc.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Popular Movies'),
      ),
      body: StreamBuilder(
        stream: bloc.allMovies,
        builder: (context, AsyncSnapshot<ItemModel> snapshot) {
          if (snapshot.hasData) {
            return buildList(snapshot);
          } else if (snapshot.hasError) {
            return Text(snapshot.error.toString());
          }
          return Center(child: CircularProgressIndicator(),);
        },
      ),
    );
  }

  Widget buildList(AsyncSnapshot<ItemModel> snapshot) {
    return GridView.builder(
        itemCount: snapshot.data.results.length,
        gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2), itemBuilder: (BuildContext context, int index) {
      return Image.network('https://image.tmdb.org/t/p/w185${snapshot.data
          .results[index].poster_path}',
        fit: BoxFit.cover,);
    });
  }
}
