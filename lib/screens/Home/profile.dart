import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:skripsian/constants.dart';
import 'package:skripsian/screens/about_us.dart';
import 'package:skripsian/screens/History/history.dart';

import '../../main.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    List<Widget> _listItem = [
      Container(
        child: Row(
          children: [
            CircleAvatar(
              radius: 30,
              backgroundColor: kPrimaryLightColor,
              child: Icon(
                EvaIcons.personOutline,
                color: Colors.black,
                size: 25,
              ),
            ),
            SizedBox(
              width: 15,
            ),
            Text("Hi, Username")
          ],
        ),
      ),
      Container(
        child: Row(
          children: [
            Icon(EvaIcons.fileTextOutline),
            SizedBox(
              width: 15,
            ),
            Text("Order history"),
          ],
        ),
      ),
      Container(
        child: Row(
          children: [
            Icon(EvaIcons.infoOutline),
            SizedBox(
              width: 15,
            ),
            Text("About Us"),
          ],
        ),
      ),
      InkWell(
        child: Padding(
          padding: EdgeInsets.all(8),
          child: Container(
            child: Row(
              children: [
                Icon(EvaIcons.logOut),
                SizedBox(
                  width: 15,
                ),
                Text("Logout"),
              ],
            ),
          ),
        ),
        onTap: () async {
          final storage = new FlutterSecureStorage();
          await storage.delete(key: "token");

          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => CheckAuth(),
            ),
          );
        },
      ),
    ];
    List<Widget> _listScreen = [
      HistoryPage(),
      AboutUsPage(),
      AboutUsPage(),
    ];
    return Container(
        child: ListView.separated(
      padding: EdgeInsets.all(25),
      itemCount: _listItem.length,
      itemBuilder: (BuildContext context, int index) => InkWell(
        child: Padding(
          padding: EdgeInsets.all(8),
          child: _listItem.elementAt(index),
        ),
        onTap: () {
          if (index != 0) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => _listScreen.elementAt(index - 1),
              ),
            );
          }
        },
      ),
      separatorBuilder: (BuildContext context, int index) =>
          Divider(color: Colors.black),
    ));
  }
}
