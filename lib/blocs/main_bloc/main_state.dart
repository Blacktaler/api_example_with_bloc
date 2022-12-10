part of 'main_bloc.dart';

@immutable
abstract class MainState {
  List pages = [
    HomeView(),
    Center(child: Text("news page"))
  ];
}

class MainInitial extends MainState {}

class LoadMain extends MainState{
  int activeIndex;
  LoadMain(this.activeIndex);
}