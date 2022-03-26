import 'package:flutter/material.dart';
import 'package:nartaqi/constants.dart';
import 'package:nartaqi/offers_class.dart';

class OffersCard extends StatefulWidget {
  const OffersCard({Key? key, required this.discountOffer}) : super(key: key);

  final BooksDiscountOffers discountOffer;

  @override
  State<OffersCard> createState() => _OffersCardState();
}

class _OffersCardState extends State<OffersCard> {

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Container(
              height: size.height * .35,
              width: size.width,
              decoration: const BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.all(
                  Radius.circular(20),
                ),
              ),
              child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    children: [
                      Container(
                        height: size.height * .3,
                        width: size.width,
                        decoration: const BoxDecoration(
                          color: Colors.transparent,
                          borderRadius: BorderRadius.all(
                            Radius.circular(20),
                          ),
                        ),
                        child: Stack(
                          children: [
                            Positioned(
                                top: 0,
                                right: size.width * .02,
                                child: PhysicalModel(
                                  shape: BoxShape.circle,
                                  color: Colors.grey.withOpacity(.5),
                                  elevation: 10,
                                  child: CircleAvatar(
                                    radius: size.height * .04,
                                    backgroundColor: Colors.orangeAccent,
                                    child: Text(
                                      widget.discountOffer.tag.toString(),
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontFamily: 'Tajawal',
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black),
                                    ),
                                  ),
                                )),
                            Positioned(
                              top: size.height * .05,
                              left: 0,
                              child: Book_Picture(size: size, offer: widget.discountOffer, img: widget.discountOffer.img1,),),
                            Positioned(
                                top: 0,
                                left: size.width * .27,
                                child: Book_Picture(size: size, offer: widget.discountOffer, img: widget.discountOffer.img2,)),
                            Positioned(
                                bottom: 0,
                                left: size.width * .2,
                                child: Book_Picture(size: size, offer: widget.discountOffer, img: widget.discountOffer.img3,)),
                            Positioned(
                              right: size.height * .02,
                              top: size.height * .1,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(':تخفيض 10% علي ', style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'Tajawal',
                                    color: Colors.orangeAccent,
                                  ),),
                                  SizedBox(height: 15,),
                                  Text("data['sub1']", style: kPageTitleStyle,textAlign: TextAlign.right,),
                                  SizedBox(height: 15,),
                                  Text('سيرة ناس',style: kPageTitleStyle,textAlign: TextAlign.right,),
                                  SizedBox(height: 15,),
                                  Text('سوق العناقريب',style: kPageTitleStyle,textAlign: TextAlign.right,),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 10,),
                      Divider(color: Colors.orangeAccent,),
                    ],
                  )),
            ),
          ],
        ));
  }
}


class Book_Picture extends StatelessWidget {
  const Book_Picture({
    Key? key,
    required this.size,
    required this.offer, required this.img,
  }) : super(key: key);

  final Size size;
  final BooksDiscountOffers offer;
  final String img;
  @override
  Widget build(BuildContext context) {

    return Container(
      height: size.height * .17,
      width: size.width * .27,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(img),
          fit: BoxFit.fill,
        ),
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(8),
          topRight: Radius.circular(8),
          bottomRight: Radius.circular(8),
          bottomLeft: Radius.circular(8),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black12.withOpacity(0.6),
            offset: const Offset(0, 8),
            blurRadius: 5.0,
          )
        ],
      ),
    );
  }
}

