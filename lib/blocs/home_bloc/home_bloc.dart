import 'package:api_example/data/models/home_product_model.dart';
import 'package:api_example/data/services/api_manager.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    on<SetInitialHome>((event, emit)async {
      final products = await ApiManager.getProducts();
      emit(LoadHome(products));
    });
  }
}
