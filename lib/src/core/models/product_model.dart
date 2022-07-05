import 'dart:convert';

List<Product> decodeProductFromJson(String str) =>
    List<Product>.from(json.decode(str).map((x) => Product.fromJson(x)));

class Product {
  Product({
    required this.id,
    required this.name,
    required this.price,
    required this.image,
    required this.description,
    required this.stock,
    required this.cart,
  });

  String id;
  String name;
  int price;
  String image;
  String description;
  int stock;
  bool cart;

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json["id"],
        name: json["name"],
        price: json["price"],
        image: json["image"],
        description: json["description"],
        stock: json["stock"],
        cart: json["cart"],
      );
}
