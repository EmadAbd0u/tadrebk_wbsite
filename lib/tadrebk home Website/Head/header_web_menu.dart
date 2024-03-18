import 'package:flutter/material.dart';
import 'package:flutter_web/tadrebk%20home%20Website/screen/home_screen.dart';

class HeaderWebMenu extends StatefulWidget {
  const HeaderWebMenu({super.key});

  @override
  State<HeaderWebMenu> createState() => _HeaderWebMenuState();
}

class _HeaderWebMenuState extends State<HeaderWebMenu> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        menuItems("Home"),
        menuItems("Training"),
        menuItems("Review"),
        menuItems("Favorite"),
        menuItems("About us"),
      ],
    );
  }

  Padding menuItems(name)
  {
    return Padding(

      padding: const EdgeInsets.only(right: 20),
      child: InkWell(
        onTap: ()
        {
          Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen(),));

        },

        child: Text( name,
          style: const TextStyle(
            fontWeight: FontWeight.w900,
            fontSize: 18,
          ),
        ),
      ),
    );
  }
}
