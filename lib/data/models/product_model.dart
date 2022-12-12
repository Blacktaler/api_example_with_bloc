import 'dart:convert';

class DBProduct {
    DBProduct({
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

    factory DBProduct.fromJson(Map<String, dynamic> json) => DBProduct(
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
        images: jsonDecode(json["images"]) as List<String>,
    );
    toJson()=>{
      "id": id,
      "title": title,
      "description": description,
      "price" : price,
      "discountPercentage": discountPercentage,
      "rating":rating,
      "stock":stock,
      "brand":brand,
      "category":category,
      "thumbnail":thumbnail,
      "images":jsonEncode(images).toString()
    };
}