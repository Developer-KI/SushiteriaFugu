import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sushiteria_fugu/assets/themes/colors.dart';
import 'package:sushiteria_fugu/user_side/components/user_button_component.dart';

class UserIntroPage extends StatelessWidget {
  const UserIntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              //shop name
              Text(
                "SUSHITERIA FUGU",
                style: GoogleFonts.dmSerifDisplay(
                  fontSize: 28,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 25),
              //logo/shop image
              Padding(
                padding: const EdgeInsets.all(50.0),
                child: Image.asset("lib/assets/images/salmon_eggs.png"),
              ),
              const SizedBox(height: 25),
              //title
              Text(
                "THE TASTE OF JAPANESE FOOD",
                style: GoogleFonts.dmSerifDisplay(
                  fontSize: 44,
                  color: Colors.white,
                ),
              ),
              //sub-title
              const SizedBox(height: 10),
              Text(
                "Feel the taste of the most popular Japanese food from anywhere and anytime",
                style: TextStyle(
                  color: Colors.grey[300],
                  height: 1.5,
                ),
              ),
              const SizedBox(height: 10),
              //action button
              MyUserButton(
                text: "Get Started",
                icon: const Icon(
                  FontAwesomeIcons.arrowRight,
                  color: selectedTextColor,
                  size: 18,
                ),
                onTap: () {
                  Navigator.pushNamed(context, "/user_main_page");
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
