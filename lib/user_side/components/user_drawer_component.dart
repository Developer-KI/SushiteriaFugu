import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sushiteria_fugu/assets/themes/colors.dart';

class DrawerItem {
  final String title;
  final IconData icon;

  const DrawerItem({
    required this.title,
    required this.icon,
  });
}

class DrawerItems {
  static const home = DrawerItem(title: "Home", icon: FontAwesomeIcons.house);
  static const menu =
      DrawerItem(title: "Menu", icon: FontAwesomeIcons.utensils);
  static const aboutUs =
      DrawerItem(title: "About Us", icon: FontAwesomeIcons.peopleGroup);

  static final List<DrawerItem> all = [home, menu, aboutUs];
  static final List<DrawerItem> adminAll = [];
}

class OurDrawerMenuWidget extends StatelessWidget {
  final VoidCallback onClicked;

  const OurDrawerMenuWidget({
    super.key,
    required this.onClicked,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onClicked,
      child: const Icon(
        FontAwesomeIcons.alignLeft,
        color: Colors.black,
      ),
    );
  }
}

class OurDrawerWidget extends StatelessWidget {
  final ValueChanged<DrawerItem> onSelectedItem;
  final DrawerItem selectedDrawer;
  final bool isDrawerOpen;
  final bool isAdmin;

  const OurDrawerWidget({
    super.key,
    required this.onSelectedItem,
    required this.selectedDrawer,
    required this.isDrawerOpen,
    required this.isAdmin,
  });

  @override
  Widget build(BuildContext context) => Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(height: 100),
          buildDrawerItems(context),
        ],
      );

  Widget buildDrawerItems(BuildContext context) => Container(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: isAdmin
              ? DrawerItems.adminAll
                  .map((item) => ListTile(
                        contentPadding: const EdgeInsets.symmetric(
                            horizontal: 24, vertical: 8),
                        leading: Icon(
                          size: isDrawerOpen ? 24 : 0,
                          item.icon,
                          color: item == selectedDrawer
                              ? selectedTextColor
                              : deSelectedTextColor,
                        ),
                        title: Text(
                          item.title,
                          softWrap: false,
                          style: TextStyle(
                            color: item == selectedDrawer
                                ? selectedTextColor
                                : deSelectedTextColor,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        onTap: () => onSelectedItem(item),
                      ))
                  .toList()
              : DrawerItems.all
                  .map((item) => ListTile(
                        contentPadding: const EdgeInsets.symmetric(
                            horizontal: 24, vertical: 8),
                        leading: Icon(
                          size: isDrawerOpen ? 24 : 0,
                          item.icon,
                          color: item == selectedDrawer
                              ? selectedTextColor
                              : deSelectedTextColor,
                        ),
                        title: Text(
                          item.title,
                          softWrap: false,
                          style: TextStyle(
                            color: item == selectedDrawer
                                ? selectedTextColor
                                : deSelectedTextColor,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        onTap: () => onSelectedItem(item),
                      ))
                  .toList(),
        ),
      );
}
