part of 'saved_datas_bloc.dart';

@immutable
abstract class SavedDatasEvent {}
class InitialSaveData extends SavedDatasEvent{}

class SaveData extends SavedDatasEvent{
  DBProduct product;
  SaveData(this.product);
}