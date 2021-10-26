import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intertoons_screening/cart_page/cart_page.dart';
import 'package:intertoons_screening/datalayer/data_repo.dart';
import 'package:intertoons_screening/home_page/home_page.dart';
import 'package:intertoons_screening/product_page/product_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => DataRepository(),
      child: MaterialApp(
        initialRoute: "/",
        routes: {
          '/': (context) => const HomePage(),
          '/productpage': (context) => const ProductPage(),
          '/cartpage': (context) => const CartPage()
        },
      ),
    );
  }
}
