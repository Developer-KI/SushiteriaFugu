import 'package:flutter/material.dart';
import 'package:sushiteria_fugu/assets/themes/colors.dart';

class MyUserButton extends StatelessWidget {
  final String text;
  final Icon icon;
  final void Function()? onTap;

  const MyUserButton({
    super.key,
    required this.text,
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: secondaryColor,
          borderRadius: BorderRadius.circular(40),
        ),
        padding: const EdgeInsets.all(20.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //text
            Text(
              text,
              style: const TextStyle(
                color: selectedTextColor,
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(width: 10),
            //icon
            Container(child: icon),
          ],
        ),
      ),
    );
  }
}
