import 'package:flutter/material.dart';
import 'package:flutter_web/company/login_screen/login_screen.dart';
import 'package:flutter_web/tadrebk%20home%20Website/screen/home_screen.dart';
import 'package:flutter_web/tadrebk%20home%20Website/trinning_home/trinng_home.dart';


class HeaderWebMenu extends StatefulWidget {
  const HeaderWebMenu({Key? key}) : super(key: key);

  @override
  State<HeaderWebMenu> createState() => _HeaderWebMenuState();
}

class _HeaderWebMenuState extends State<HeaderWebMenu> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        menuItems("Home", HomeScreen()),
        menuItems("Training", TrinningHome()),
        menuItems("Review", TrinningHome()),
        menuItems("Favorite", TrinningHome()),
        menuItems("About us", TrinningHome()),
      ],
    );
  }

  Padding menuItems(String name, Widget screen) {
    return Padding(
      padding: const EdgeInsets.only(right: 20),
      child: InkWell(
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => screen));
        },
        child: Text(
          name,
          style: const TextStyle(
            fontWeight: FontWeight.w900,
            fontSize: 18,
          ),
        ),
      ),
    );
  }
}
