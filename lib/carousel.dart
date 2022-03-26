import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

final List<String> imgList = [
  'images/gallries.jpg',
  'images/proofReading.jpg',
  'images/membership.jpg',
  'images/publishing.jpg',
  'images/membership.jpg',
  'images/bookLaunch.jpg',
];
final List<String> imgdesc = [
  'معرض الكتاب',
  'خدمات لغوية',
  'عضوية نرتقي',
  'طباعة و نشر',
  'سينما نرتقي',
  'تدشين كتب',
];

class EventsCarousel extends StatelessWidget {
  const EventsCarousel({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      child: CarouselSlider(
        items: imgList
            .map(
              (item) => Container(
                child: ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  child: Stack(
                    children: [
                      Image.asset(item, width: size.width,)
                    ],
                  ),
                )
              )
            )
            .toList(),
        options: CarouselOptions(
          autoPlay: true,
          aspectRatio: 2.0,
          enlargeCenterPage: true,
        ),
      ),
    );
  }
}
