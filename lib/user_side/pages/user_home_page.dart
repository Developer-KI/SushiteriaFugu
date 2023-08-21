import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sushiteria_fugu/assets/themes/colors.dart';
import 'package:sushiteria_fugu/user_side/components/user_drawer_component.dart';
import 'package:sushiteria_fugu/user_side/components/user_button_component.dart';
import 'package:sushiteria_fugu/user_side/components/user_foodTile_component.dart';
import 'package:sushiteria_fugu/user_side/models/user_shop_model.dart';
import 'package:provider/provider.dart';
import 'package:sushiteria_fugu/user_side/pages/user_foodDetails_page.dart';

class UserHomePage extends StatefulWidget {
  final VoidCallback openDrawer;

  const UserHomePage({
    super.key,
    required this.openDrawer,
  });

  @override
  State<UserHomePage> createState() => _UserHomePageState();
}

class _UserHomePageState extends State<UserHomePage> {
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
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //promo banner
          Container(
            decoration: BoxDecoration(
              color: primaryColor,
              borderRadius: BorderRadius.circular(20),
            ),
            margin: const EdgeInsets.symmetric(horizontal: 25),
            padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    //promo message
                    Text(
                      "On Sale Right Now",
                      style: GoogleFonts.dmSerifDisplay(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                    const SizedBox(height: 20),
                    //promo button
                    MyUserButton(
                      text: "Buy Now",
                      icon: const Icon(
                        FontAwesomeIcons.moneyBill,
                        color: Colors.white,
                      ),
                      onTap: (() {}),
                    )
                  ],
                ),
                //promo image
                Image.asset(
                  "lib/assets/images/many_sushi.png",
                  height: 100,
                )
              ],
            ),
          ),

          //new food
          const SizedBox(height: 25),

          Container(
            decoration: BoxDecoration(
              color: Colors.grey[100],
              borderRadius: BorderRadius.circular(20),
            ),
            margin: const EdgeInsets.symmetric(horizontal: 25),
            padding: const EdgeInsets.all(20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                //image
                Row(
                  children: [
                    Image.asset(
                      "lib/assets/images/salmon_eggs.png",
                      height: 60,
                    ),
                    const SizedBox(width: 25),
                    //core
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        //name
                        Text(
                          "Salmon Eggs",
                          style: GoogleFonts.dmSerifDisplay(fontSize: 18),
                        ),

                        const SizedBox(height: 10),
                        //price
                        Text(
                          "21.00 lv",
                          style: TextStyle(
                            color: Colors.grey[700],
                          ),
                        )
                      ],
                    ),
                  ],
                ),
                //heart
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    "New and\nPopular!",
                    style: TextStyle(
                      color: primaryColor,
                      fontStyle: FontStyle.italic,
                      fontSize: 18,
                    ),
                  ),
                ),
              ],
            ),
          ),
          //menu list
          const SizedBox(height: 20),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Text(
              "Best Value Products",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.grey[800],
                fontSize: 18,
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: SizedBox(
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
          ),
        ],
      ),
    );
  }
}
