import 'package:api_example/views/home_view.dart';
import 'package:api_example/views/saved_datas_view.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'main_event.dart';
part 'main_state.dart';

class MainBloc extends Bloc<MainEvent, MainState> {
  MainBloc() : super(MainInitial()) {
    on<SetActivePage>((event, emit) {
      emit(LoadMain(event.activeIndex, 0));
    });

    on<SetInitialEvent>((event, emit) async {
      await Future.delayed(const Duration(seconds: 1));
      
      emit(LoadMain(0, 0));
    });


    on<IncrementEvent>((event, emit) {
      if (state is LoadMain) {
        final state = this.state as LoadMain;
        emit(LoadMain(state.activeIndex, state.counter + 1));
      }
    });


    on<DecrementEvent>((event, emit) {
      if (state is LoadMain) {
        final state = this.state as LoadMain;
        emit(LoadMain(state.activeIndex, state.counter - 1));
      }
    });

  }
}
