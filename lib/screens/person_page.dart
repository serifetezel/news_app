import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xd_news_page/controllers/home_controller.dart';
import 'package:xd_news_page/listModel.dart';

class PersonPage extends StatefulWidget {
  const PersonPage({Key? key, required this.person}) : super(key: key);
  final ListModel person;

  @override
  _PersonPageState createState() => _PersonPageState();
}

class _PersonPageState extends State<PersonPage> {
  final controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Center(
          child: Column(
            children: [
              CircleAvatar(
                  radius: 150,
                  backgroundImage:
                      NetworkImage(widget.person.auth_image.toString())),
              SizedBox(
                height: 30,
              ),
              Text(
                widget.person.name.toString(),
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 35),
              )
            ],
          ),
        ),
      ),
    );
  }
}
