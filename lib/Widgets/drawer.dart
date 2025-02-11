import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:simple_notes_app/Screens/favorites_page.dart';
import 'package:simple_notes_app/Widgets/text.dart';

class MyDrawer extends StatefulWidget {
  const MyDrawer({Key? key}) : super(key: key);

  @override
  State<MyDrawer> createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  final user = FirebaseAuth.instance.currentUser!;
  @override
  Widget build(BuildContext context) {
    return Drawer(
      shape: const RoundedRectangleBorder(
          // borderRadius: BorderRadius.only(
          //     topRight: Radius.circular(20), bottomRight: Radius.circular(20)),
          ),
      backgroundColor: Colors.grey[200],
      child: ListView(
        children: [
          DrawerHeader(
              margin: const EdgeInsets.fromLTRB(5, 5, 0, 10),
              padding: const EdgeInsets.symmetric(vertical: 5),
              duration: const Duration(milliseconds: 250),
              child: ListView(children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CircleAvatar(
                      radius: 50,
                    ),
                    ListTile(
                      title: Text(
                        user.email!,
                        style: TextStyle(fontSize: 12),
                      ),
                      dense: true,
                    )
                  ],
                ),
              ])),
          const Divider(),
          ListTile(
            leading: const Icon(
              Icons.star_border_rounded,
              size: 30,
            ),
            title: MyText(input: "Favorites", fontSize: 20),
            onTap: () => Navigator.push(context,
                MaterialPageRoute(builder: (context) => const Favorites())),
          ),
          ListTile(
            leading: const Icon(
              Icons.settings,
              size: 30,
            ),
            title: MyText(input: "Settings", fontSize: 20),
            onTap: () {
              Navigator.pushNamed(context, '/Settings');
            },
          ),
          ListTile(
            leading: const Icon(
              Icons.exit_to_app_sharp,
              size: 30,
            ),
            title: MyText(input: "Sign-out", fontSize: 20),
            onTap: () => FirebaseAuth.instance.signOut(),
          ),
          Divider(
            color: Colors.grey[600],
          ),
          const SizedBox(
            height: 30,
          ),
        ],
      ),
    );
  }
}
