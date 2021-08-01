import 'package:flutter/material.dart';
import 'package:instagram_test/customIcons/test_instagram_icons.dart';
import 'package:provider/provider.dart';

class MyBottomNavigationBar extends StatefulWidget {
  const MyBottomNavigationBar({Key? key}) : super(key: key);

  @override
  _MyBottomNavigationBarState createState() => _MyBottomNavigationBarState();
}

class _MyBottomNavigationBarState extends State<MyBottomNavigationBar> {
  var _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, BottomNavigationBarIndex indexer, child) =>
          BottomNavigationBar(
        onTap: (i) {
          context.read<BottomNavigationBarIndex>().indexChanger(i);
        },
        currentIndex: indexer.currentIndex,
        backgroundColor: Colors.white,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.black.withOpacity(0.7),
        items: [
          /// Feeds
          BottomNavigationBarItem(
            icon: Icon(TestInstagram.home),
            label: "Feeds",
          ),

          /// Search
          BottomNavigationBarItem(
            icon: Icon(TestInstagram.search),
            label: "Search",
          ),

          /// Add
          BottomNavigationBarItem(
            icon: Icon(TestInstagram.add),
            label: "Add",
          ),

          /// Fav
          BottomNavigationBarItem(
            icon: Icon(TestInstagram.heart),
            label: "Fav",
          ),

          /// Profile
          BottomNavigationBarItem(
            icon: ClipRRect(
                borderRadius: BorderRadius.circular(100),
                child: Image.asset(
                  "assets/profile.png",
                  width: 30,
                  height: 30,
                )),
            label: "Profile",
          ),
        ],
      ),
    );
  }
}

class BottomNavigationBarIndex extends ChangeNotifier {
  int currentIndex = 0;
  indexChanger(int index) {
    currentIndex = index;
    notifyListeners();
  }
}
