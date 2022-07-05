import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_cart/src/core/providers/product_provider.dart';
import 'package:shopping_cart/src/presentation/home/widgets/product_card.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Cart'),
        backgroundColor: Colors.indigo.shade300,
        elevation: 0.0,
      ),
      bottomNavigationBar: Container(
        color: Colors.deepPurple.withOpacity(0.1),
        height: 100.0,
        child: Consumer<ProductProvider>(builder: (context, product, c) {
          if (product.cartTotal() == 0) {
            return const SizedBox.shrink();
          }
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              RichText(
                text: TextSpan(
                  text: 'Total : ',
                  style: const TextStyle(
                    fontSize: 20.0,
                    color: Colors.black54,
                    fontWeight: FontWeight.bold,
                  ),
                  children: [
                    TextSpan(
                      text:
                          '\$ ${context.watch<ProductProvider>().cartTotal()}',
                      style: const TextStyle(
                        fontSize: 20.0,
                        color: Colors.black54,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ],
                ),
              ),
              CupertinoButton(
                color: Colors.red,
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Successful payment'),
                    ),
                  );
                  product.clearCart();
                  // Navigator.pop(context);
                },
                child: const Text(
                  'Checkout',
                ),
              ),
            ],
          );
        }),
      ),
      body: Consumer<ProductProvider>(
        builder:
            (BuildContext context, ProductProvider product, Widget? child) {
          if (product.cartList.isEmpty) {
            return Center(
              child: Text(
                "Cart Empty",
                style: Theme.of(context).textTheme.headline4,
              ),
            );
          }
          return ListView.builder(
            itemCount: product.cartList.length,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return ProductCard(
                product: product.cartList[index],
                isInCart: true,
                onAddCart: () {},
                onRemoveCart: () {
                  product.removeFromCart(index: index, isCartPage: true);
                },
              );
            },
          );
        },
      ),
    );
  }
}
