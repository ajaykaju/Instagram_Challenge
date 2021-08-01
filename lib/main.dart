import 'package:flutter/material.dart';
import 'package:instagram_test/pages/Home.dart';
import 'package:instagram_test/widgets/MyBottomNavigationBar.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => BottomNavigationBarIndex()),
      ],
      child: MaterialApp(
        title: 'Instagram Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Home(),
      ),
    );
  }
}


