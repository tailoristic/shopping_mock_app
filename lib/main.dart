import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_cart/src/core/providers/product_provider.dart';
import 'src/presentation/home/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ProductProvider>(
      create: ((context) => ProductProvider()..getProducts()),
      builder: (context, child) => MaterialApp(
        title: 'Mock Shopping Cart',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.indigo,
        ),
        home: const HomePage(),
      ),
    );
  }
}
