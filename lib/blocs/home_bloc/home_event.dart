part of 'home_bloc.dart';

@immutable
abstract class HomeEvent {}

class SetInitialHome extends HomeEvent{}

class AddtoDB extends HomeEvent{
  DBProduct product;
  AddtoDB(this.product);
}
// class GetApi extends HomeEvent{
  
// }