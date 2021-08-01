import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:instagram_test/customIcons/test_instagram_icons.dart';
import 'package:instagram_test/pages/FavList.dart';
import 'package:instagram_test/pages/Feeds.dart';
import 'package:instagram_test/widgets/MyBottomNavigationBar.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        bottomNavigationBar: MyBottomNavigationBar(),
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0.6,
          title: Image.asset(
            "assets/logo.png",
            height: 50,
          ),
          actions: [
            Icon(
              TestInstagram.messenger,
              color: Colors.black,
            ),
            SizedBox(
              width: 20,
            )
          ],
        ),
        body: SafeArea(
          child: Consumer(builder: (context,BottomNavigationBarIndex indexer, child) {
            Widget child;

            if (indexer.currentIndex == 3)
              child = FavList();
            else
              child = Feeds();

            return Container(child: child,);
          },),
        ));
  }
}
