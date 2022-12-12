
import 'package:api_example/blocs/main_bloc/main_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainView extends StatelessWidget {
  const MainView({super.key});

  @override
  Widget build(BuildContext context) {
    final mainBloc = context.read<MainBloc>();
    return BlocBuilder<MainBloc, MainState>(builder: ((context, state) {
      if (state is LoadMain) {
        return Scaffold(
          appBar: AppBar(title: Text(state.counter.toString()),),
          floatingActionButton: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
            FloatingActionButton(onPressed: (){
              mainBloc.add(IncrementEvent());
             
            },child: Icon(Icons.add),),
            FloatingActionButton(onPressed: (){
              mainBloc.add(DecrementEvent());
            },child: Icon(Icons.remove),),

          ],),
          body: state.pages[state.activeIndex],
          bottomNavigationBar: BottomNavigationBar(
            onTap: (value){
              mainBloc.add(SetActivePage(value));
            },
            currentIndex: state.activeIndex,
            items: [
            BottomNavigationBarItem(icon: Icon(Icons.home),label: ''),
            BottomNavigationBarItem(icon: Icon(Icons.newspaper),label: ''),
          ]),
        );
      }else {
        return Center(
        child: CircularProgressIndicator(),
      );
      }
    }));
  }
}
