import 'package:api_example/blocs/bloc/main_bloc.dart';
import 'package:api_example/blocs/home_bloc/home_bloc.dart';
import 'package:api_example/views/main_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main(List<String> args) {
  runApp(MultiBlocProvider(providers: [
    BlocProvider(create: (_)=>MainBloc()..add(SetInitialEvent())),
    BlocProvider(create: (_)=>HomeBloc()..add(SetInitialHome())),
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MainView(),
    );
  }
}