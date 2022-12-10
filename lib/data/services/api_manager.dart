import 'dart:convert';

import 'package:api_example/data/models/home_product_model.dart';
import 'package:http/http.dart'as http;

class ApiManager{
  static Future<ProductsModel> getProducts()async{
    Uri url = Uri.parse('https://dummyjson.com/products');

    final res = await http.get(url);
    final data = json.decode(res.body);
    return ProductsModel.fromJson(data);
  }
}