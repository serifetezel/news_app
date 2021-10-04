import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xd_news_page/controllers/home_controller.dart';
import 'package:xd_news_page/controllers/save_controller.dart';
import 'package:xd_news_page/screens/detail_page.dart';

class SavedPage extends StatefulWidget {
  const SavedPage({Key? key}) : super(key: key);

  @override
  _SavedPageState createState() => _SavedPageState();
}

class _SavedPageState extends State<SavedPage> {
  final controller = Get.put(SaveController());
  final homecontroller = Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.only(top: 50, left: 20, right: 20),
      child: Column(children: <Widget>[
        Row(children: [
          Text(
            'Saved News',
            style: TextStyle(fontSize: 30),
          ),
        ]),
        Obx(
          () => Flexible(
              child: ListView.builder(
            itemCount: controller.save_list.length,
            itemBuilder: (context, index) => Card(
              child: InkWell(
                onTap: () {
                  Get.to(Detail(
                    news: homecontroller.news_list[index],
                  ));
                },
                child: Column(
                  children: [
                    Row(
                      children: [
                        CircleAvatar(
                          backgroundImage: NetworkImage(controller
                              .save_list[index].auth_image!
                              .toString()),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Column(
                          children: [
                            Text(controller.save_list[index].name!),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              controller.save_list[index].road!,
                              style: TextStyle(color: Colors.grey),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Wrap(
                      crossAxisAlignment: WrapCrossAlignment.start,
                      runAlignment: WrapAlignment.start,
                      children: [
                        Text(
                          controller.save_list[index].content!,
                          style: TextStyle(fontSize: 16),
                        ),
                      ],
                    ),
                    Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          child: Image.network(
                              controller.save_list[index].images!.toString()),
                        )),
                  ],
                ),
              ),
            ),
          )),
        ),
      ]),
    ));
  }
}
