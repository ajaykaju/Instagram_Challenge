import 'package:flutter/material.dart';
import 'package:instagram_test/pages/Home.dart';
import 'package:instagram_test/widgets/MyBottomNavigationBar.dart';
import 'package:path/path.dart';
import 'package:provider/provider.dart';
import 'package:sqflite/sqflite.dart';

import 'globals.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  Globals.database = openDatabase(
    join(await getDatabasesPath(), "posts_database"),
    onCreate: (db, version) async {
      await db.execute(
          'CREATE TABLE posts(id INTEGER PRIMARY KEY AUTOINCREMENT, pId TEXT)');
    },
    version: 1,
  );

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
