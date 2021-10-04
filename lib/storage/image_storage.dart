import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class ImageStorage extends GetxController {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController contentController = TextEditingController();
  final TextEditingController readController = TextEditingController();
  XFile? file;

  get index => null;

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

  Future pick() async {
    var imagePath = await uploadFile();
    Map<String, dynamic> newsData = {
      'name': nameController.text,
      'content': contentController.text,
      'road': readController.text,
      'images': imagePath,
      'auth_image': imagePath
    };
    await FirebaseFirestore.instance
        .collection("news_list")
        .doc(nameController.text)
        .set(newsData);
  }

  void setState(Null Function() param0) {}
}
