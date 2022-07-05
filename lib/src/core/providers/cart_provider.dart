abstract class CartInterface {
  int? get cartLength;
  int cartTotal();
  void addToCart({required int index});
  void removeFromCart({required int index, required bool isCartPage});
  void clearCart();
}

/// Initally thought of creating a CartProvider class, but decided to use the
/// ProductProvider to maintain the state of Cart and Product.

// class CartProvider extends ChangeNotifier implements CartInterface {
//   final List<Product> _cartList = <Product>[];

//   @override
//   int get cartLength => _cartList.length;

//   @override
//   void addToCart({required int index}) {
//     // _cartList.add(product);
//     // _cartList.forEach(((element) {
//     //   element.cart = true;
//     // }));
//     // notifyListeners();
//   }

//   @override
//   void removeFromCart({required int index}) {
//     _cartList.removeAt(index);
//     notifyListeners();
//   }
// }
