import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:xd_news_page/controllers/home_controller.dart';
import 'package:xd_news_page/screens/saved_page.dart';
import 'detail_page.dart';

class Home_Page extends StatefulWidget {
  @override
  State<Home_Page> createState() => _Home_PageState();
}

class _Home_PageState extends State<Home_Page> {
  int _currentTabIndex = 0;
  final controller = Get.put(HomeController());
  final TextEditingController nameController = TextEditingController();
  final TextEditingController contentController = TextEditingController();
  final TextEditingController readController = TextEditingController();
  final TextEditingController titleController = TextEditingController();
  final TextEditingController extensiveContentController =
      TextEditingController();
  XFile? file;

  File? _imageFile;
  final picker = ImagePicker();

  Future pickImages() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    setState(() {
      _imageFile = File(pickedFile!.path);
    });
  }

  Future<String?> uploadFile() async {
    File file = File(_imageFile!.path);

    try {
      var uploadFile = await firebase_storage.FirebaseStorage.instance
          .ref('uploads')
          .putFile(file);
      return await uploadFile.ref.getDownloadURL();
    } catch (e) {
      print(e);
    }
  }

  void _onItemTapped(int tabIndex) {
    switch (tabIndex) {
      case 0:
        Get.to(Home_Page());
        break;
      case 1:
        Get.to(Home_Page());
        break;
      case 2:
        Get.to(SavedPage());
        break;
      case 3:
        Get.to(Home_Page());
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 50, left: 20, right: 20),
        child: Column(
          children: <Widget>[
            Row(
              children: [
                Text(
                  'Latest Feed',
                  style: TextStyle(fontSize: 30),
                ),
                SizedBox(
                  width: 150,
                ),
                FloatingActionButton(
                  onPressed: () {
                    showModalBottomSheet(
                        context: context,
                        builder: (context) {
                          return SingleChildScrollView(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                ListTile(
                                  leading: new Icon(Icons.person),
                                  title: new Text('Name'),
                                  subtitle: TextFormField(
                                    controller: nameController,
                                    decoration: InputDecoration(
                                      hintText: "Enter Name",
                                      labelStyle: TextStyle(fontSize: 5),
                                    ),
                                  ),
                                  onTap: () {},
                                ),
                                ListTile(
                                  leading: new Icon(Icons.chrome_reader_mode),
                                  title: new Text('Content Title'),
                                  subtitle: TextFormField(
                                    controller: contentController,
                                    decoration: InputDecoration(
                                      hintText: "Enter Content Title",
                                      labelStyle: TextStyle(fontSize: 5),
                                    ),
                                  ),
                                  onTap: () {},
                                ),
                                ListTile(
                                  leading: new Icon(Icons.sort),
                                  title: new Text('Title'),
                                  subtitle: TextFormField(
                                    controller: titleController,
                                    decoration: InputDecoration(
                                      hintText: "Enter Title",
                                      labelStyle: TextStyle(fontSize: 5),
                                    ),
                                  ),
                                  onTap: () {},
                                ),
                                ListTile(
                                  leading: new Icon(Icons.chrome_reader_mode),
                                  title: new Text('Content'),
                                  subtitle: TextField(
                                    keyboardType: TextInputType.multiline,
                                    maxLines: null,
                                    controller: extensiveContentController,
                                    decoration: InputDecoration(
                                      hintText: "Enter Content",
                                      labelStyle: TextStyle(fontSize: 5),
                                    ),
                                  ),
                                  onTap: () {},
                                ),
                                ListTile(
                                  leading: new Icon(Icons.sort),
                                  title: new Text('Read'),
                                  subtitle: TextFormField(
                                    controller: readController,
                                    decoration: InputDecoration(
                                      hintText: "Enter Read",
                                      labelStyle: TextStyle(fontSize: 5),
                                    ),
                                  ),
                                  onTap: () {},
                                ),
                                ListTile(
                                  leading: new Icon(Icons.photo),
                                  title: new Text('Photo'),
                                  onTap: () {
                                    pickImages();
                                  },
                                ),
                                ListTile(
                                  leading: new Icon(Icons.person_add),
                                  title: new Text('Author Photo'),
                                  onTap: () {
                                    pickImages();
                                  },
                                ),
                                ElevatedButton(
                                  onPressed: () async {
                                    var imagePath = await uploadFile();
                                    Map<String, dynamic> newsData = {
                                      'name': nameController.text,
                                      'content': contentController.text,
                                      'extensiveContentController':
                                          extensiveContentController.text,
                                      'road': readController.text,
                                      'images': imagePath,
                                      'auth_image': imagePath,
                                      'title': titleController.text,
                                    };
                                    await FirebaseFirestore.instance
                                        .collection("news_list")
                                        .doc(nameController.text)
                                        .set(newsData);
                                  },
                                  child: Text('add'),
                                  style: ElevatedButton.styleFrom(
                                    primary: Colors.blue,
                                  ),
                                )
                              ],
                            ),
                          );
                        });
                  },
                  child: Icon(Icons.add),
                  backgroundColor: Colors.blue[300],
                )
              ],
            ),
            Obx(
              () => Flexible(
                child: ListView.builder(
                    itemCount: controller.news_list.length,
                    itemBuilder: (context, index) => Card(
                          child: InkWell(
                            onTap: () {
                              Get.to(Detail(
                                news: controller.news_list[index],
                              ));
                            },
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    CircleAvatar(
                                      backgroundImage: NetworkImage(controller
                                          .news_list[index].auth_image!
                                          .toString()),
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Column(
                                      children: [
                                        Text(controller.news_list[index].name!),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Text(
                                          controller.news_list[index].road!,
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
                                      controller.news_list[index].content!,
                                      style: TextStyle(fontSize: 16),
                                    ),
                                  ],
                                ),
                                Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Container(
                                      child: Image.network(controller
                                          .news_list[index].images!
                                          .toString()),
                                    )),
                              ],
                            ),
                          ),
                        )),
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.black,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              color: Colors.grey,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.search,
              color: Colors.grey,
            ),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.bookmark_border,
              color: Colors.grey,
            ),
            label: 'Save',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person,
              color: Colors.grey,
            ),
            label: 'Account',
          ),
        ],
        currentIndex: _currentTabIndex,
        selectedItemColor: Colors.blue[800],
        onTap: _onItemTapped,
      ),
    );
  }
}
