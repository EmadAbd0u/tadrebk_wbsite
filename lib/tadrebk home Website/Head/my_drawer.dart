import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const UserAccountsDrawerHeader(
            accountName: Text("Emad Abdou"),
            accountEmail: Text("emadabdou2030@gmail.com"),
            currentAccountPicture: ClipOval(
              child: Image(

                ///profile-----------------------------------------
                image: AssetImage(
                  "assets/images/myphoto.png",
                ),
                fit: BoxFit.cover,
              ),
            ),
            decoration: BoxDecoration(
                image: DecorationImage(
              image: AssetImage(
                  "assets/images/Tadrebk Log in.png"),
              fit: BoxFit.cover,
            )),
          ),
          ListTile(
            onTap: () {},
            title: const Text("Home"),
            leading: const Icon(Icons.home),
          ),
          ListTile(
            onTap: () {},
            title: const Text("Favorite"),
            leading: const Icon(Icons.favorite),
          ),
          ListTile(
            onTap: () {},
            title: const Text("Them"),
            leading: const Icon(Icons.dark_mode),
          ),
          ListTile(
            onTap: () {},
            title: const Text("Message"),
            leading: const Icon(Icons.message),
          ),
          ListTile(
            onTap: () {},
            title: const Text("Review"),
            leading: const Icon(Icons.reviews),
          ),
          ListTile(
            onTap: () {},
            title: const Text("Share"),
            leading: const Icon(Icons.share),
          ),
        ],
      ),
    );
  }
}
