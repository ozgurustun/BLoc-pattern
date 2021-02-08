import 'package:blocPattern/src/models/item_model.dart';
import 'package:blocPattern/src/resources/repository.dart';
import 'package:rxdart/rxdart.dart';

class MoviesBloc{
  final _repository = Repository();

  //add data which is gotten from server in the form of ItemModel object and pass it to the UI Screen as a stream
  final _moviesFetcher = PublishSubject<ItemModel>();

  /*
  Observable acts as a container for an item or collection of items,
  but items in the Observable are not stored in memory
   */

  Observable<ItemModel> get allMovies => _moviesFetcher.stream;

  fetchAllMovies() async{
    ItemModel itemModel = await _repository.fetchAllMovies();
    _moviesFetcher.sink.add(itemModel);
  }

  dispose(){
    _moviesFetcher.close();
  }

}

final bloc = MoviesBloc();