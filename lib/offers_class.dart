import 'package:cloud_firestore/cloud_firestore.dart';

class BooksDiscountOffers {
  final String title, sub1, tag, img1, img2, img3;

  const BooksDiscountOffers({
    required this.title,
    required this.sub1,
    required this.tag,
    required this.img1,
    required this.img2,
    required this.img3,
  });


}

List<BooksDiscountOffers> discount = [
  BooksDiscountOffers(
    title: 'discount',
    sub1: 'discount 50% on all ',
    tag: 'تخفيضات 10%',
    img1: 'images/souq.jpg',
    img3: 'images/sirat.jpg',
    img2: 'images/gaber.jpg',
  ),
  BooksDiscountOffers(
    title: 'disscount',
    sub1: 'disscounnt 50% on all ',
    tag: 'تخفيضات 10%',
    img1: 'images/souq.jpg',
    img3: 'images/sirat.jpg',
    img2: 'images/gaber.jpg',
  ),
];
