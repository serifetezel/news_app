import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xd_news_page/controllers/home_controller.dart';
import 'package:xd_news_page/listModel.dart';
import 'package:xd_news_page/screens/person_page.dart';

class Detail extends StatefulWidget {
  const Detail({Key? key, required this.news}) : super(key: key);
  final ListModel news;

  @override
  _DetailState createState() => _DetailState();
}

class _DetailState extends State<Detail> {
  final _firestore = FirebaseFirestore.instance;
  final controller = Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            child: Column(children: [
              Padding(
                padding: const EdgeInsets.only(top: 50, right: 10, left: 5),
                child: Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.pop(context, true);
                      },
                      icon: Icon(Icons.keyboard_arrow_left),
                      iconSize: 30,
                    ),
                    SizedBox(
                      width: 300,
                    ),
                    IconButton(
                      icon: Icon(Icons.bookmark_border),
                      onPressed: () async {
                        Map<String, dynamic> newsData = {
                          'name': widget.news.name.toString(),
                          'content': widget.news.content.toString(),
                          'extensiveContentController':
                              widget.news.extensiveContentController.toString(),
                          'road': widget.news.road.toString(),
                          'images': widget.news.images.toString(),
                          'auth_image': widget.news.auth_image.toString(),
                          'title': widget.news.title.toString(),
                        };
                        await FirebaseFirestore.instance
                            .collection("save")
                            .doc(widget.news.name.toString())
                            .set(newsData);
                      },
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.all(2.0),
                child: Container(
                  child: Image.network(widget.news.images.toString()),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 18, left: 18),
                    child: Text(
                      widget.news.title.toString(),
                      style:
                          TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 18, left: 18, top: 8),
                    child: Row(
                      children: [
                        CircleAvatar(
                          child: InkWell(
                            onTap: () {
                              Get.to(PersonPage(person: widget.news));
                            },
                          ),
                          backgroundImage:
                              NetworkImage(widget.news.auth_image.toString()),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Column(
                          children: [
                            Text(widget.news.name.toString()),
                            SizedBox(
                              height: 5,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(right: 18, left: 18),
                child: Text(
                  widget.news.extensiveContentController.toString(),
                ),
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
