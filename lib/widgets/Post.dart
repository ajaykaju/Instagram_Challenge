
import 'package:flutter/material.dart';
import 'package:flutter_image/flutter_image.dart';
import 'package:instagram_test/customIcons/test_instagram_icons.dart';

class Post extends StatefulWidget {
  final String title;
  final String name;
  final String image;

  const Post(
      {Key? key, required this.title, required this.image, required this.name})
      : super(key: key);

  @override
  _PostState createState() => _PostState();
}

class _PostState extends State<Post> {


  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    child: Row(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(100),
                          child: Image.asset(
                            "assets/profile.png",
                            width: 40,
                            height: 40,
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          widget.name,
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  Icon(Icons.more_vert)
                ],
              ),
            ),
          ),
          Container(
            child: FadeInImage(
              placeholder: AssetImage("assets/imageSample.png"),
              image: NetworkImageWithRetry(widget.image),
            ),
          ),
          Container(
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    child: Row(
                      children: [
                        Icon(TestInstagram.heart),
                        SizedBox(
                          width: 20,
                        ),
                        Icon(TestInstagram.comment),
                        SizedBox(
                          width: 20,
                        ),
                        Icon(TestInstagram.share)
                      ],
                    ),
                  ),
                  GestureDetector(child: Icon(TestInstagram.save),onTap: (){

                  },),
                ],
              ),
            ),
          ),
          Container(
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
              child: Row(
                children: [
                  Container(
                    width: 40,
                    height: 20,
                    child: Stack(
                      children: [
                        Positioned(
                          right: 0,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(100),
                            child: Container(
                              width: 20,
                              height: 20,
                              child: Image.network(
                                "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ9Va_rbCp6NQwgHA5jo05QHzPyzj-_5UhQqvWboeIrxLBzWgC0Ys-Jar-72A9XnGgC8tY&usqp=CAU",
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          right: 10,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(100),
                            child: Container(
                              width: 20,
                              height: 20,
                              child: Image.network(
                                "https://upload.wikimedia.org/wikipedia/commons/4/42/Shaqi_jrvej.jpg",
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(100),
                            child: Container(
                              width: 20,
                              height: 20,
                              child: Image.network(
                                "https://images.indianexpress.com/2021/02/Green-solution.jpg",
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text('Liked by'),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    'neeharika_boda',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    'and',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    '62,707 others',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
              child: Row(
                children: [
                  Text(
                    widget.name,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Flexible(
                      child: RichText(
                    overflow: TextOverflow.ellipsis,
                    text: TextSpan(text: widget.title,style: TextStyle(
                      color: Colors.black
                    )),
                  ))
                ],
              ),
            ),
          ),
          Container(
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
              child: Row(
                children: [
                  GestureDetector(
                    child: Text(
                      "View all 931 comments",
                      style: TextStyle(color: Colors.black.withOpacity(0.5)),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
