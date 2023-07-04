import 'package:flutter/material.dart';
import 'package:store/pages/home_page.dart';
import 'package:store/pages/update_product.dart';
import 'package:store/services/update_product.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.orange
      ),
      debugShowCheckedModeBanner: false,
      routes: {
        HomePage.id:(context)=>const HomePage(),
        UpdateProductPage.id:(context)=>const UpdateProductPage(),
        '/':(context)=>const HomePage(),

      },
    );
  }
}

