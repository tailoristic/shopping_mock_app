import 'package:flutter/material.dart';

class CartActionButton extends StatelessWidget {
  const CartActionButton({
    Key? key,
    required this.quantity,
    required this.onTap,
  }) : super(key: key);
  final int quantity;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(right: 10.0),
        child: Center(
          child: Stack(
            children: [
              const Icon(
                Icons.shopping_cart_outlined,
                color: Colors.white,
                size: 30.0,
              ),
              Visibility(
                visible: quantity > 0,
                child: Positioned(
                  right: 0.0,
                  child: CircleAvatar(
                    backgroundColor: Colors.deepPurpleAccent,
                    radius: 7.0,
                    child: Text(
                      quantity.toString(),
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 12.0,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
