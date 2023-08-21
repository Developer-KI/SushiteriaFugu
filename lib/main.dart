import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sushiteria_fugu/user_side/pages/user_main_page.dart';
import 'package:sushiteria_fugu/user_side/models/user_shop_model.dart';
import 'package:sushiteria_fugu/user_side/pages/user_cart_page.dart';
import 'package:sushiteria_fugu/user_side/pages/user_intro_page.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => UserShop(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const UserIntroPage(),
      routes: {
        "/user_intro_page": (context) => const UserIntroPage(),
        "/user_main_page": (context) => const UserMainPage(),
        "/user_cart_page": (context) => const UserCartPage(),
      },
    );
  }
}
