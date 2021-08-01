import 'package:flutter/material.dart';
import 'package:instagram_test/widgets/MyBottomNavigationBar.dart';

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
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [

            ],
          ),
        ),
      )
    );
  }
}
