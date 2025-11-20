import 'package:flutter/material.dart';
import 'home_screen.dart';

void main() {
  runApp(const MyShopMiniApp());
}

class MyShopMiniApp extends StatelessWidget {
  const MyShopMiniApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MyShop Mini',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: true,
      ),
      home: const HomeScreen(),
    );
  }
}