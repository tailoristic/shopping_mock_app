import 'package:flutter/material.dart';
import 'package:shopping_cart/src/core/models/product_model.dart';
import 'package:shopping_cart/src/core/services/product_service.dart';
import 'cart_provider.dart';

class ProductProvider extends ChangeNotifier implements CartInterface {
  Future<void> getProducts() async {
    try {
      final List<Product> productList =
          await ProductService().getProducts('assets/product.json');
      this.productList = productList;
      notifyListeners();
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  List<Product> productList = <Product>[];
  List<Product> get cartList {
    return productList.where((element) => element.cart == true).toList();
  }

  @override
  int get cartLength => cartList.length;

  @override
  void addToCart({required int index}) {
    productList.elementAt(index).cart = true;
    notifyListeners();
  }

  @override
  void removeFromCart({required int index, required bool isCartPage}) {
    // This needs to be refactored.
    if (isCartPage) {
      cartList[index].cart = false;
    } else {
      productList[index].cart = false;
    }
    notifyListeners();
  }

  @override
  int cartTotal() {
    int total = cartList.fold(
        0, (int previousValue, element) => previousValue + element.price);
    return total;
  }

  @override
  void clearCart() {
    for (final element in productList) {
      element.cart = false;
    }
    notifyListeners();
  }
}
