import 'package:flutter/material.dart';
import 'package:flutter_web/tadrebk%20home%20Website/Body/body_section.dart';
import 'package:flutter_web/tadrebk%20home%20Website/Head/header_section.dart';

import '../Footer/footer_section.dart';
import '../Head/my_drawer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.black12,
      // for mobile screen
      drawer: MyDrawer(),
      body: SingleChildScrollView(
        child: SafeArea(
            child: Column(
          children: [
            // Head
            HeaderSection(),
            // Body
            BodySection(),
            // Footer
            FooterSection(),
          ],
        )),
      ),
    );
  }
}
