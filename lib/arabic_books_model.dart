import 'package:cloud_firestore/cloud_firestore.dart';

class ArabicBooksModel {
  String? docId;
  String? title;
  String? author;
  String? image;

  ArabicBooksModel({this.docId, this.title, this.author, this.image});

  ArabicBooksModel.fromMap(DocumentSnapshot data) {
    docId = data.id;
    title = data["title"];
    author = data["author"];
    image = data["image"];
  }
}