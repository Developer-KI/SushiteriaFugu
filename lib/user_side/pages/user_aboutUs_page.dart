// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sushiteria_fugu/user_side/components/user_drawer_component.dart';
import 'package:sushiteria_fugu/user_side/models/user_shop_model.dart';
import 'package:provider/provider.dart';
import 'package:sushiteria_fugu/user_side/pages/user_foodDetails_page.dart';

class UserAboutUsPage extends StatefulWidget {
  final VoidCallback openDrawer;

  const UserAboutUsPage({
    super.key,
    required this.openDrawer,
  });

  @override
  State<UserAboutUsPage> createState() => _UserAboutUsPageState();
}

class _UserAboutUsPageState extends State<UserAboutUsPage> {
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
            //Sushiteria Fugu
            const SizedBox(height: 10),
            //menu list
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Text(
                "Who are Sushiteria Fugu?",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.grey[800],
                  fontSize: 25,
                ),
              ),
            ),

            const SizedBox(height: 10),

            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 25),
              child: Text(
                "We are a renowned culinary establishment that has gained widespread recognition for its unique and daring approach to Japanese cuisine. This exclusive restaurant has carved a niche for itself by specializing in the art of preparing fugu, a delicacy that is as famous for its exquisite taste as it is for its potential danger. \n\nIt features an array of meticulously crafted dishes, each showcasing the delicate flavors of fugu while ensuring the utmost safety for its patrons. From elegantly plated sashimi to expertly rolled sushi, every dish is a masterpiece that reflects the commitment to quality and precision that defines the restaurant. Sushiteria Fugu isn't just a dining destination; it's a cultural experience that celebrates the intersection of tradition and modernity. \n\nDiners are invited to indulge in the centuries-old tradition of fugu consumption while placing their trust in the skilled hands of the restaurant's chefs. Through this, Sushiteria Fugu has earned its place as a culinary icon, captivating adventurous food enthusiasts and connoisseurs alike who seek not only exquisite flavors but also a story to savor.",
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
            ),

            //Agile Development
            const SizedBox(height: 20),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Text(
                "Who are Agile Development?",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.grey[800],
                  fontSize: 25,
                ),
              ),
            ),

            const SizedBox(height: 10),

            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 25),
              child: Text(
                "Agile development refers to a modern approach to software development that emphasizes flexibility, collaboration, and iterative progress. In contrast to traditional waterfall methodologies, agile teams work in short cycles, delivering functional increments of a project at regular intervals. This iterative process allows for continuous feedback and adaptation, promoting quicker response to changing requirements. \n\nAgile development places a premium on customer collaboration, valuing working software over comprehensive documentation. Cross-functional teams collaborate closely, fostering open communication and shared ownership of project outcomes. Through practices like Scrum or Kanban, agile methodologies empower teams to prioritize tasks, self-organize, and continuously improve their processes. The result is faster development, increased adaptability, and a more customer-centric approach to building software solutions.",
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
            ),
            //Social media
            const SizedBox(height: 20),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Text(
                "Follow Us Here:",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.grey[800],
                  fontSize: 25,
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                      onPressed: () {},
                      icon: const Icon(FontAwesomeIcons.facebook),
                      iconSize: 75),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(FontAwesomeIcons.instagram),
                    iconSize: 75,
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(FontAwesomeIcons.tiktok),
                    iconSize: 75,
                  ),
                ],
              ),
            ),

            //Contact Info

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Text(
                "And Reach Out Here:",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.grey[800],
                  fontSize: 25,
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text("E-mail: "),
                      Text("suhiteriaFugu@example.com"),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text("Phone: "),
                      Text("+359 88 888 8888"),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text("E-mail: "),
                      Text("suhiteriaFugu@example.com"),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text("Address: "),
                      Text("Stara Zagora, st zagora street 18"),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text("Developer E-mail: "),
                      Text("agileDevelopment@example.com"),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text("Developer Phone: "),
                      Text("+359 89 999 9999"),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
