import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sushiteria_fugu/assets/themes/colors.dart';
import 'package:sushiteria_fugu/user_side/components/user_button_component.dart';
import 'package:sushiteria_fugu/user_side/models/user_shop_model.dart';
import '../models/user_food_model.dart';

class UserCartPage extends StatelessWidget {
  const UserCartPage({super.key});

  void removeFromCart(Food food, BuildContext context) {
    final userShop = context.read<UserShop>();

    userShop.removeFromCart(food);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<UserShop>(
      builder: (context, value, child) => Scaffold(
        backgroundColor: primaryColor,
        appBar: AppBar(
          centerTitle: true,
          title: const Text("My Cart"),
          backgroundColor: primaryColor,
          elevation: 0,
        ),
        body: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: value.userCart.length,
                itemBuilder: ((context, index) {
                  final Food food = value.userCart[index];
                  final String foodName = food.name;
                  final String foodPrice = food.price;

                  return Container(
                    decoration: BoxDecoration(
                      color: secondaryColor,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    margin: const EdgeInsets.only(
                      left: 20,
                      top: 20,
                      right: 20,
                    ),
                    child: ListTile(
                      title: Text(
                        foodName,
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      subtitle: Text(
                        foodPrice,
                        style: TextStyle(
                          color: Colors.grey[200],
                        ),
                      ),
                      trailing: IconButton(
                        icon: Icon(
                          Icons.delete,
                          color: Colors.grey[200],
                        ),
                        onPressed: () => removeFromCart(food, context),
                      ),
                    ),
                  );
                }),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(25),
              child: MyUserButton(
                text: "Pay now",
                icon: const Icon(
                  Icons.shopping_cart_checkout,
                  color: Colors.white,
                ),
                onTap: () {},
              ),
            )
          ],
        ),
      ),
    );
  }
}
