import 'package:api_example/blocs/home_bloc/home_bloc.dart';
import 'package:api_example/blocs/saved_bloc/saved_datas_bloc.dart';
import 'package:api_example/data/db/product_database.dart';
import 'package:api_example/data/models/home_product_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sqflite/sqlite_api.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final homeBloc = context.read<HomeBloc>();
    final savedBloc = context.read<SavedDatasBloc>();
    return BlocBuilder<HomeBloc, HomeState>(builder: ((context, state) {
      if (state is LoadHome) {
        return Scaffold(
            appBar: AppBar(
              title: Text("Home View"),
            ),
            body: ListView.builder(
              itemCount: state.products.products!.length,
              itemBuilder: ((context, index) {
                final product = state.products.products![index];
                return ListTile(
                  onTap: () async {
                    homeBloc.add(AddtoDB(product));
                    
                    savedBloc.add(SaveData(product));
                  },
                  leading: Text(product.id.toString()),
                  title: Text(product.title!),
                );
              }),
            ));
      } else {
        return Center(
          child: CircularProgressIndicator(),
        );
      }
    }));
  }
}
