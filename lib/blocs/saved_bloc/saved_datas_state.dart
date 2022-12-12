part of 'saved_datas_bloc.dart';

@immutable
abstract class SavedDatasState {}

class SavedDatasInitial extends SavedDatasState {}

class LoadData extends SavedDatasState{
  List<Product> products;
  LoadData(this.products);
}