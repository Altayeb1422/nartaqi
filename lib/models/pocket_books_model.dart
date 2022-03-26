import 'package:cloud_firestore/cloud_firestore.dart';

class PocketBooksModel {
  String? docId;
  String? title;
  String? author;
  String? image;

  PocketBooksModel({this.docId, this.title, this.author, this.image});

  PocketBooksModel.fromMap(DocumentSnapshot data) {
    docId = data.id;
    title = data["title"];
    author = data["author"];
    image = data["image"];
  }
}