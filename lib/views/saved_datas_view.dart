import 'package:api_example/blocs/saved_bloc/saved_datas_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SavedDatasView extends StatelessWidget {
  const SavedDatasView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SavedDatasBloc,SavedDatasState>(builder: ((context, state) {
      if(state is LoadData){
        return Scaffold(
          body: ListView.builder(
            itemCount: state.products.length,
            itemBuilder: (context,index){
            return ListTile(
              leading: Text(state.products[index].id.toString()),
              title: Text(state.products[index].title!),
            );
          }),
        );
      }else{
        return Center(child: CircularProgressIndicator(),);
      }
    }));
  }
}