import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shopping_cart/src/core/models/product_model.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({
    Key? key,
    required this.product,
    required this.isInCart,
    required this.onAddCart,
    required this.onRemoveCart,
  }) : super(key: key);
  final Product product;
  final VoidCallback onAddCart;
  final VoidCallback onRemoveCart;
  final bool isInCart;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(12.0),
      padding: const EdgeInsets.all(6.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Row(
        children: [
          Container(
            height: 120.0,
            width: 120.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              image: DecorationImage(
                image: CachedNetworkImageProvider(
                  product.image,
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(width: 16.0),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product.name,
                  style: Theme.of(context).textTheme.headline6,
                ),
                Text(
                  '\$ ${product.price}',
                  style: Theme.of(context).textTheme.labelLarge!.copyWith(
                        color: Colors.indigo,
                      ),
                ),
                const SizedBox(height: 10.0),
                Text(
                  product.description,
                  maxLines: 2,
                ),
                const SizedBox(height: 10.0),
                AnimatedCrossFade(
                  crossFadeState: isInCart
                      ? CrossFadeState.showSecond
                      : CrossFadeState.showFirst,
                  duration: const Duration(milliseconds: 200),
                  secondChild: OutlinedButton.icon(
                    onPressed: onRemoveCart,
                    icon: const Icon(
                      Icons.shopping_cart,
                    ),
                    label: const Text(
                      'Remove from cart',
                    ),
                  ),
                  firstChild: ElevatedButton.icon(
                    onPressed: onAddCart,
                    icon: const Icon(
                      Icons.shopping_cart,
                    ),
                    label: const Text(
                      'Add to cart',
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
