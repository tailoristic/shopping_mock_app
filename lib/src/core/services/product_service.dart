import 'package:flutter/services.dart';
import 'package:shopping_cart/src/core/models/product_model.dart';

abstract class ProductInterface {
  Future<List<Product>> getProducts(String assetPath);
}

class ProductService extends ProductInterface {
  // This is the method fetch the products from the assets folder.
  // We can use any other source of data here.
  @override
  Future<List<Product>> getProducts(String assetPath) async {
    try {
      return await rootBundle
          .loadString(assetPath)
          .then((jsonStr) => decodeProductFromJson(jsonStr));
    } catch (e) {
      rethrow;
    }
  }
}
