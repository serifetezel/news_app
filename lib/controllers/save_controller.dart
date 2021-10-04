import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:xd_news_page/listModel.dart';

class SaveController extends GetxController {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  late TextEditingController nameController,
      contentController,
      roadController,
      imageController,
      authImageController,
      extensiveContentController,
      titleController;

  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

  late CollectionReference collectionReference;

  RxList<ListModel> save_list = RxList<ListModel>([]);

  

  @override
  void onInit() {
    super.onInit();
    nameController = TextEditingController();
    roadController = TextEditingController();
    contentController = TextEditingController();
    authImageController = TextEditingController();
    imageController = TextEditingController();
    extensiveContentController = TextEditingController();
    titleController = TextEditingController();
    
    collectionReference = firebaseFirestore.collection("save");
    save_list.bindStream(getAllSave_List());
    
  }

  @override
  void onReady() {
    super.onReady();
  }

  Stream<List<ListModel>> getAllSave_List() =>
      collectionReference.snapshots().map((Query) =>
          Query.docs.map((item) => ListModel.fromMap(item)).toList());

  
}
