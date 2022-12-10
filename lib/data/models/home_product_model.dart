// To parse this JSON data, do
//
//     final productsModel = productsModelFromJson(jsonString);

import 'dart:convert';

ProductsModel productsModelFromJson(String str) => ProductsModel.fromJson(json.decode(str));


class ProductsModel {
    ProductsModel({
        this.products,
        this.total,
        this.skip,
        this.limit,
    });

    List<Product>? products;
    int? total;
    int? skip;
    int? limit;

    factory ProductsModel.fromJson(Map<String, dynamic> json) => ProductsModel(
        products: List<Product>.from(json["products"].map((x) => Product.fromJson(x))),
        total: json["total"],
        skip: json["skip"],
        limit: json["limit"],
    );

}

class Product {
    Product({
        this.id,
        this.title,
        this.description,
        this.price,
        this.discountPercentage,
        this.rating,
        this.stock,
        this.brand,
        this.category,
        this.thumbnail,
        this.images,
    });

    int? id;
    String? title;
    String? description;
    int? price;
    double? discountPercentage;
    double? rating;
    int? stock;
    String? brand;
    String? category;
    String? thumbnail;
    List<String>? images;

    factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json["id"],
        title: json["title"],
        description: json["description"],
        price: json["price"],
        discountPercentage: json["discountPercentage"].toDouble(),
        rating: json["rating"].toDouble(),
        stock: json["stock"],
        brand: json["brand"],
        category: json["category"],
        thumbnail: json["thumbnail"],
        images: List<String>.from(json["images"].map((x) => x)),
    );

}
