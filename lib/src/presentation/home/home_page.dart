import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_cart/src/core/providers/product_provider.dart';
import 'package:shopping_cart/src/presentation/cart/cart_page.dart';
import 'package:shopping_cart/src/widgets/cart_action_button.dart';
import 'widgets/product_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 234, 234, 234),
      appBar: AppBar(
        title: const Text('Mock Shopping Cart'),
        centerTitle: false,
        backgroundColor: Colors.indigo.shade300,
        elevation: 0.0,
        actions: [
          Consumer<ProductProvider>(
            builder: (BuildContext context, ProductProvider productProvider,
                Widget? child) {
              return CartActionButton(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const CartPage(),
                    ),
                  );
                },
                quantity: productProvider.cartLength,
              );
            },
          )
        ],
      ),
      body: Consumer<ProductProvider>(
        builder: (BuildContext context, ProductProvider productProvider,
            Widget? child) {
          return ListView.builder(
            itemCount: productProvider.productList.length,
            shrinkWrap: true,
            itemBuilder: (BuildContext context, int i) {
              return ProductCard(
                product: productProvider.productList[i],
                isInCart: productProvider.productList[i].cart,
                onAddCart: () {
                  productProvider.addToCart(index: i);
                },
                onRemoveCart: () {
                  productProvider.removeFromCart(index: i, isCartPage: true);
                },
              );
            },
          );
        },
      ),
    );
  }
}
