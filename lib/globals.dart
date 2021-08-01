import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';

class Globals {
  static late final database;
}

class SavedList extends ChangeNotifier {
  List<Map> savedList = [];

  Future<void> loadPosts() async {
    Database db = await Globals.database;
    savedList = await db.query("posts");
    notifyListeners();
  }

  Future<void> addToFav(String id) async {
    Database db = await Globals.database;
    await db.insert(
      "posts",
      {
        "pId": id,
      },
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
    loadPosts();
  }

  Future<void> removeFromFav(String id) async {
    Database db = await Globals.database;
    await db.delete("posts", where: 'pId = ?', whereArgs: [id.toString()]);
    loadPosts();
  }
}
