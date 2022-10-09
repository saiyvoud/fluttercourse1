import 'dart:convert';

ProductModel productModelFromJson(String str) =>
    ProductModel.fromJson(json.decode(str));

String productModelToJson(ProductModel data) => json.encode(data.toJson());

class ProductModel {
  String name;
  String description;
  String price;
  String image;
  ProductModel({
    required this.name,
    required this.description,
    required this.price,
    required this.image,
  });
  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
        name: json["name"],
        description: json["description"],
        price: json["price"],
        image: json["image"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "description": description,
        "price": price,
        "image": image
      };
}
