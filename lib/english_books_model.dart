import 'package:cloud_firestore/cloud_firestore.dart';

class EnglishBooksModel {
  String? docId;
  String? title;
  String? author;
  String? image;

  EnglishBooksModel({this.docId, this.title, this.author, this.image});

  EnglishBooksModel.fromMap(DocumentSnapshot data) {
    docId = data.id;
    title = data["title"];
    author = data["author"];
    image = data["image"];
  }
}