part of 'home_page_bloc.dart';

@immutable
abstract class HomePageState {}

class HomePageInitial extends HomePageState {
 
}

class HomePageLoaded extends HomePageState{
  final  MoviesModel moviesModel;

  HomePageLoaded(this.moviesModel);
}