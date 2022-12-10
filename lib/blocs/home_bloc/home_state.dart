part of 'home_bloc.dart';

@immutable
abstract class HomeState {}

class HomeInitial extends HomeState {}

class LoadHome extends HomeState{
  ProductsModel products;
  
  LoadHome(this.products);
}