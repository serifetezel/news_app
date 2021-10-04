import 'package:cloud_firestore/cloud_firestore.dart';

class ListModel {
  String? name;
  String? road;
  String? content;
  String? images;
  String? auth_image;
  String? title;
  String? extensiveContentController;
  

  ListModel.fromMap(DocumentSnapshot data) {
    name = data["name"];
    road = data["road"];
    content = data["content"];
    images = data["images"];
    auth_image = data["auth_image"];
    title = data["title"];
    extensiveContentController = data["extensiveContentController"];
  }
}
