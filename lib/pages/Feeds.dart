import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:instagram_test/widgets/Post.dart';
import 'package:http/http.dart' as http;

class Feeds extends StatefulWidget {
  const Feeds({Key? key}) : super(key: key);

  @override
  _FeedsState createState() => _FeedsState();
}

class _FeedsState extends State<Feeds> {

  List<PostClass> parsePost(String responseBody) {
    final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();

    return parsed.map<PostClass>((json) => PostClass.fromJson(json)).toList();
  }

  List<PostClass> _myList= [];
  
  Future<List<PostClass>> getPostsDetails() async {
    final response =
        await http.get(Uri.parse('https://hiit.ria.rocks/videos_api/cdn/com.rstream.crafts?versionCode=40&lurl=Canvas%20painting%20ideas'));
    _myList = parsePost(response.body);
    return parsePost(response.body);
  }



  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: FutureBuilder(
        builder: (context, AsyncSnapshot projectSnap) {
          if (projectSnap.connectionState == ConnectionState.none &&
              !projectSnap.hasData) {
            return Column(
              children: [
                Center(
                  child: Text("Loading..."),
                ),
              ],
            );
          }


          return Column(
            children:  _myList.asMap().entries.map((e) => Column(
              children: [
                Post(title: e.value.title,name: e.value.name,image: e.value.thumbnail,),
                Divider(color: Colors.black.withOpacity(0.1),)
              ],
            )).toList(),
          );
        },
        future: getPostsDetails(),
      ),
    );
  }
}

class PostClass {
  String id;
  String name;
  String title;
  String thumbnail;
  PostClass({required this.id, required this.name, required this.title, required this.thumbnail});

  factory PostClass.fromJson(Map<String, dynamic> json) {
    return PostClass(id: json["id"], name: json["channelname"], title: json["title"], thumbnail: json["high thumbnail"],);
  }
}
