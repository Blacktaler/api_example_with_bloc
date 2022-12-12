part of 'main_bloc.dart';

@immutable
abstract class MainState {

  List pages = [
    HomeView(),
    SavedDatasView()
  ];

}

class MainInitial extends MainState {}

class LoadMain extends MainState{
  int activeIndex;
  int counter;

  LoadMain(this.activeIndex,this.counter);
}