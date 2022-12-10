import 'package:api_example/views/home_view.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'main_event.dart';
part 'main_state.dart';

class MainBloc extends Bloc<MainEvent, MainState> {
  MainBloc() : super(MainInitial()) {
    on<SetActivePage>((event, emit) {
        emit(LoadMain(event.activeIndex));
    });

    on<SetInitialEvent>((event, emit)async {
      await Future.delayed(const Duration(seconds: 1));
      emit(LoadMain(0));
    });
  }
}
