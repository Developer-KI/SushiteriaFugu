import 'package:flutter/material.dart';
import 'package:sushiteria_fugu/user_side/components/user_drawer_component.dart';
import 'package:sushiteria_fugu/user_side/components/user_foodTile_component.dart';
import 'package:sushiteria_fugu/user_side/models/user_shop_model.dart';
import 'package:provider/provider.dart';
import 'package:sushiteria_fugu/user_side/pages/user_foodDetails_page.dart';

class UserMenuPage extends StatefulWidget {
  final VoidCallback openDrawer;

  const UserMenuPage({
    super.key,
    required this.openDrawer,
  });

  @override
  State<UserMenuPage> createState() => _UserMenuPageState();
}

class _UserMenuPageState extends State<UserMenuPage> {
  void navigateToFoodDetails(int index) {
    final userShop = context.read<UserShop>();
    final userFoodMenu = userShop.userFoodMenu;

    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => UserFoodDetailsPage(
                food: userFoodMenu[index],
              )),
    );
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var height = size.height;

    final userShop = context.read<UserShop>();
    final userFoodMenu = userShop.userFoodMenu;

    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Colors.grey[800],
        leading: OurDrawerMenuWidget(
          onClicked: widget.openDrawer,
        ),
        title: const Text(
          "S U S H I T E R I A   F U G U",
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, "/user_cart_page");
            },
            icon: const Icon(
              Icons.shopping_cart,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10),
            //menu list
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Text(
                "Favourite Foods",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.grey[800],
                  fontSize: 18,
                ),
              ),
            ),

            const SizedBox(height: 10),

            SizedBox(
              height: height / 3,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: userFoodMenu.length,
                itemBuilder: ((context, index) => UserFoodTile(
                      food: userFoodMenu[index],
                      onTap: (() => navigateToFoodDetails(index)),
                    )),
              ),
            ),

            const SizedBox(height: 20),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Text(
                "Sushi Menu",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.grey[800],
                  fontSize: 18,
                ),
              ),
            ),

            const SizedBox(height: 10),

            SizedBox(
              height: height / 3,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: userFoodMenu.length,
                itemBuilder: ((context, index) => UserFoodTile(
                      food: userFoodMenu[index],
                      onTap: (() => navigateToFoodDetails(index)),
                    )),
              ),
            ),

            const SizedBox(height: 20),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Text(
                "Burger Menu",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.grey[800],
                  fontSize: 18,
                ),
              ),
            ),

            const SizedBox(height: 10),

            SizedBox(
              height: height / 3,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: userFoodMenu.length,
                itemBuilder: ((context, index) => UserFoodTile(
                      food: userFoodMenu[index],
                      onTap: (() => navigateToFoodDetails(index)),
                    )),
              ),
            ),

            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
