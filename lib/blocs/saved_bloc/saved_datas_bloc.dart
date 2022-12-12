import 'package:api_example/data/db/product_database.dart';
import 'package:api_example/data/models/home_product_model.dart';
import 'package:api_example/data/models/product_model.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'saved_datas_event.dart';
part 'saved_datas_state.dart';

class SavedDatasBloc extends Bloc<SavedDatasEvent, SavedDatasState> {
  SavedDatasBloc() : super(SavedDatasInitial()) {
    on<InitialSaveData>((event, emit)async {
      final db = ProductDatabase.instance;
      final datas = await db.readAllProducts();
      emit(LoadData(datas));
    });

    on<SaveData>((event, emit)async {
      final db = ProductDatabase.instance;
      final datas = await db.readAllProducts();
      emit(LoadData(datas));
    });

  }
}
