import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:movie_rating_app/model/movies_model.dart';
import 'package:movie_rating_app/repository/movies_repo.dart';

part 'home_page_event.dart';
part 'home_page_state.dart';

class HomePageBloc extends Bloc<HomePageEvent, HomePageState> {
final  MoviesRepo moviesRepo=MoviesRepo();
  HomePageBloc() : super(HomePageInitial()) {
    on<HomePageInitialEvent>((event, emit) async{
     MoviesModel moviesModel=await  moviesRepo.getMoviesRepo();
     emit(HomePageLoaded(moviesModel));
    });
  }
}
