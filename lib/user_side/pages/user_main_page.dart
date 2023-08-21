import 'package:flutter/material.dart';
import 'package:sushiteria_fugu/assets/themes/colors.dart';
import 'package:sushiteria_fugu/user_side/components/user_drawer_component.dart';
import 'package:sushiteria_fugu/user_side/pages/user_aboutUs_page.dart';
import 'package:sushiteria_fugu/user_side/pages/user_home_page.dart';
import 'package:sushiteria_fugu/user_side/pages/user_menu_page.dart';

class UserMainPage extends StatefulWidget {
  const UserMainPage({
    super.key,
  });

  @override
  State<UserMainPage> createState() => _UserMainPageState();
}

class _UserMainPageState extends State<UserMainPage> {
  late double xOffset;
  late double yOffset;
  late double scaleFactor;
  bool isDragging = false;
  bool isDrawerOpen = false;
  DrawerItem item = DrawerItems.home;
  DrawerItem currentItem = DrawerItems.home;

  @override
  void initState() {
    super.initState();

    closeDrawer();
  }

  void openDrawer() => setState(() {
        xOffset = 40;
        yOffset = 75;
        scaleFactor = 80;
        isDrawerOpen = true;
      });

  void closeDrawer() => setState(() {
        xOffset = 100;
        yOffset = 100;
        scaleFactor = 100;
        isDrawerOpen = false;
      });

  Widget getDrawerPage() {
    switch (item) {
      case DrawerItems.home:
        return UserHomePage(openDrawer: openDrawer);
      case DrawerItems.menu:
        return UserMenuPage(openDrawer: openDrawer);
      case DrawerItems.aboutUs:
        return UserAboutUsPage(openDrawer: openDrawer);

      default:
        return UserHomePage(openDrawer: openDrawer);
    }
  }

  Widget buildDrawer() {
    return SafeArea(
      child: SizedBox(
        width: (1 - xOffset / 100) * MediaQuery.of(context).size.width,
        child: OurDrawerWidget(
          onSelectedItem: (item) {
            switch (item) {
              default:
                setState(() {
                  this.item = item;
                  currentItem = item;
                });
                closeDrawer();
            }
          },
          selectedDrawer: currentItem,
          isDrawerOpen: isDrawerOpen,
          isAdmin: false,
        ),
      ),
    );
  }

  Widget buildPage() {
    return WillPopScope(
      onWillPop: () async {
        if (isDrawerOpen) {
          closeDrawer();
          return false;
        } else {
          return true;
        }
      },
      child: GestureDetector(
        onHorizontalDragStart: (details) => isDragging = true,
        onHorizontalDragUpdate: ((details) {
          if (!isDragging) return;

          const delta = 1;
          if (details.delta.dx > delta) {
            openDrawer();
          } else if (details.delta.dx < -delta) {
            closeDrawer();
          }

          isDragging = false;
        }),
        onTap: closeDrawer,
        child: AnimatedContainer(
            duration: const Duration(milliseconds: 100),
            transform: Matrix4.translationValues(
                (1 - xOffset / 100) * MediaQuery.of(context).size.width,
                (1 - yOffset / 100) * MediaQuery.of(context).size.width,
                0)
              ..scale(scaleFactor / 100),
            child: AbsorbPointer(
              absorbing: isDrawerOpen,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(isDrawerOpen ? 20 : 0),
                child: Container(
                  color: isDrawerOpen ? Colors.white12 : Colors.white,
                  child: getDrawerPage(),
                ),
              ),
            )),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [primaryColor, primaryColor]),
        ),
        child: SafeArea(
          child: Stack(children: [
            buildDrawer(),
            buildPage(),
          ]),
        ),
      ),
    );
  }
}
