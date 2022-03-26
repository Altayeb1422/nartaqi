import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nartaqi/english_books_model.dart';

class EnglishBooksController extends GetxController {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  // Firestore operation
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

  late CollectionReference collectionReference;

  RxList<EnglishBooksModel> employees = RxList<EnglishBooksModel>([]);

  @override
  Future<void> onInit() async {
    collectionReference = firebaseFirestore.collection("EnglishBooks");
    employees.bindStream(getAllBooks());
  }

  Stream<List<EnglishBooksModel>> getAllBooks() =>
      collectionReference.snapshots().map((query) =>
          query.docs.map((item) => EnglishBooksModel.fromMap(item)).toList());

}