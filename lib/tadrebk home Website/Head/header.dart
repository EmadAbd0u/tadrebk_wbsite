import 'package:flutter/material.dart';
import 'package:flutter_web/person/login_screen/login_screen.dart';
import 'package:flutter_web/tadrebk%20home%20Website/Head/header_web_menu.dart';
import 'package:flutter_web/tadrebk%20home%20Website/screen/responsive.dart';

class Header extends StatelessWidget {
  const Header({Key? key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // For mobile
        if (!Responsive.isDesktop(context))
          Builder(
            builder: (context) => IconButton(
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
              icon: const Icon(Icons.menu),
            ),
          ),
        // Site name and icon
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Row(
            children: [
              Image.asset(
                "assets/images/logo.png",
                height: 200,
                width: 200,
              ),
              const SizedBox(width: 8),
            ],
          ),
        ),
        const Spacer(),
        if (Responsive.isDesktop(context)) const HeaderWebMenu(),
        const Spacer(),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.indigo,
            elevation: 17,
            minimumSize: const Size(90, 50),
          ),
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => LoginScreen(),
              ),
            );
          },
          child: const Text(
            "Join Now",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }
}
