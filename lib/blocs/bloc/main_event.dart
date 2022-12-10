part of 'main_bloc.dart';

@immutable
abstract class MainEvent {}

class SetInitialEvent extends MainEvent{}

class SetActivePage extends MainEvent{
  int activeIndex;
  SetActivePage(this.activeIndex);
}