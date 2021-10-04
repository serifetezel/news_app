import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xd_news_page/screens/create_account_page.dart';
import 'package:xd_news_page/screens/login_page.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';

class Welcome_Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(children: [
      ImageSlideshow(
        width: double.infinity,
        height: double.infinity,
        initialPage: 0,
        children: [
          Image.asset(
            'assets/images/camera.jpeg',
            fit: BoxFit.cover,
          ),
          Image.asset(
            'assets/images/houcine-ncib-GvTW_T6Nij8-unsplash.jpg',
            fit: BoxFit.cover,
          )
        ],
        autoPlayInterval: 0,
      ),
      Positioned(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 25),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        'The Future of ',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 38,
                            fontWeight: FontWeight.bold,
                            wordSpacing: 5),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Text(
                        'Photograpy',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 38,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Text(
                        '& Unsplash',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 38,
                            fontWeight: FontWeight.bold,
                            wordSpacing: 5),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(1.0),
                        child: CircleAvatar(
                          backgroundImage:
                              AssetImage('assets/images/circle_image.jpg'),
                        ),
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(1.0),
                        child: Text(
                          'Tobias Van',
                          style: TextStyle(color: Colors.white),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                          onPressed: () {
                            Get.to(Login());
                          },
                          child: Text(
                            'LOGIN',
                            style: TextStyle(color: Colors.black),
                          ),
                          style: ElevatedButton.styleFrom(
                              primary: Colors.white,
                              padding: EdgeInsets.symmetric(
                                  horizontal: 45, vertical: 15))),
                      SizedBox(
                        width: 10,
                      ),
                      ElevatedButton(
                        onPressed: () {
                          Get.to(Create_Account());
                        },
                        child: Text('CREATE ACCOUNT'),
                        style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.symmetric(
                                horizontal: 45, vertical: 15)),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      )
    ]));
  }
}
