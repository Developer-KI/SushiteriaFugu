// ignore_for_file: prefer_final_fields

import 'package:flutter/cupertino.dart';
import 'package:sushiteria_fugu/user_side/models/user_food_model.dart';

class UserShop extends ChangeNotifier {
  List<Food> _userCart = [];

  final List<Food> _userFoodMenu = [
    //Salmon Sushi test
    Food(
      name: "Salmon Sushi",
      price: "10.00 lv",
      imagePath: "lib/assets/images/salmon_sushi.png",
      rating: "4.9/5",
      description:
          "Delicate sliced, fresh salmon drapes elegantly over a pillow of perfectly seasoned sushi rice.Delicate sliced, fresh salmon drapes elegantly over a pillow of perfectly seasoned sushi rice.Delicate sliced, fresh salmon drapes elegantly over a pillow of perfectly seasoned sushi rice.Delicate sliced, fresh salmon drapes elegantly over a pillow of perfectly seasoned sushi rice.Delicate sliced, fresh salmon drapes elegantly over a pillow of perfectly seasoned sushi rice.Delicate sliced, fresh salmon drapes elegantly over a pillow of perfectly seasoned sushi rice.",
    ),
    //Tuna sushi test
    Food(
      name: "Tuna Sushi",
      price: "15.00 lv",
      imagePath: "lib/assets/images/tuna.png",
      rating: "4.7/5",
      description:
          "Delicate sliced, fresh salmon drapes elegantly over a pillow of perfectly seasoned sushi rice.Delicate sliced, fresh salmon drapes elegantly over a pillow of perfectly seasoned sushi rice.Delicate sliced, fresh salmon drapes elegantly over a pillow of perfectly seasoned sushi rice.Delicate sliced, fresh salmon drapes elegantly over a pillow of perfectly seasoned sushi rice.Delicate sliced, fresh salmon drapes elegantly over a pillow of perfectly seasoned sushi rice.Delicate sliced, fresh salmon drapes elegantly over a pillow of perfectly seasoned sushi rice.",
    ),
    //Chopsticks Sushi test
    Food(
      name: "Other Sushi",
      price: "20.00 lv",
      imagePath: "lib/assets/images/chopsticks_sushi.png",
      rating: "4.8/5",
      description:
          "Delicate sliced, fresh salmon drapes elegantly over a pillow of perfectly seasoned sushi rice.Delicate sliced, fresh salmon drapes elegantly over a pillow of perfectly seasoned sushi rice.Delicate sliced, fresh salmon drapes elegantly over a pillow of perfectly seasoned sushi rice.Delicate sliced, fresh salmon drapes elegantly over a pillow of perfectly seasoned sushi rice.Delicate sliced, fresh salmon drapes elegantly over a pillow of perfectly seasoned sushi rice.Delicate sliced, fresh salmon drapes elegantly over a pillow of perfectly seasoned sushi rice.",
    ),
  ];

  List<Food> get userFoodMenu => _userFoodMenu;
  List<Food> get userCart => _userCart;

  void addToCart(Food foodItem, int quantity) {
    for (var i = 0; i < quantity; i++) {
      _userCart.add(foodItem);
    }
    notifyListeners();
  }

  void removeFromCart(Food foodItem) {
    _userCart.remove(foodItem);
    notifyListeners();
  }
}
