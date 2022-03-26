import 'dart:async';
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:flutter_svg/svg.dart';
import 'constants.dart';
import 'package:lottie/lottie.dart';

class OffersPage extends StatefulWidget {
  const OffersPage({Key? key}) : super(key: key);

  @override
  _OffersPageState createState() => _OffersPageState();
}

Future _checkInternetConnection() async {
  await InternetAddress.lookup('www.google.com')
      .timeout(const Duration(seconds: 20));
}

class _OffersPageState extends State<OffersPage> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          backgroundColor: kPrimaryColor,
          automaticallyImplyLeading: false,
          title: Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: const [
                Text(
                  'العروض',
                  style: kPageTitleStyle,
                ),
              ],
            ),
          ),
          elevation: 0,
        ),
        body: Center(
            child: FutureBuilder(
          future: _checkInternetConnection(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                  child: Lottie.asset(
                'images/book-app.json',
                width: 120,
                height: 120,
              ));
            }
            if (snapshot.hasError) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    'images/offline.svg',
                    width: 100,
                    height: 100,
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  const Text(
                    'لايوجد إتصال',
                    style: kPageTitleStyle,
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        setState(() {});
                      },
                      child: Text('تحديث', style: kRefreshButton)),
                ],
              );
            } else {
              return Center(
                child: StreamBuilder(
                    stream: FirebaseFirestore.instance
                        .collection('Offers')
                        .snapshots(),
                    builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                      if (!snapshot.hasData) {
                        return SpinKitThreeBounce(
                          color: Colors.orangeAccent,
                          size: 30.0,
                        );
                      }
                      return ListView(
                        physics:  BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
                        children: snapshot.data!.docs.map((Discount) {
                          return Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Column(
                                children: [
                                  Container(
                                    height: size.height * .39,
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
                                              height: size.height * .33,
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
                                                      right: 0,
                                                      child: Center(
                                                        child: Lottie.network(
                                                            'https://assets8.lottiefiles.com/packages/lf20_FM9Hwb.json',
                                                            width: size.width *
                                                                .27,
                                                            height:
                                                                size.height *
                                                                    .08,
                                                            fit: BoxFit.cover),
                                                      )),
                                                  Positioned(
                                                    top: size.height * .03,
                                                    left: 0,
                                                    child: Book_Picture(
                                                      size: size,
                                                      img: Discount['img1'],
                                                    ),
                                                  ),
                                                  Positioned(
                                                      top: 0,
                                                      left: size.width * .27,
                                                      child: Book_Picture(
                                                        size: size,
                                                        img: Discount['img2'],
                                                      )),
                                                  Positioned(
                                                      bottom: 0,
                                                      left: size.width * .25,
                                                      child: Book_Picture(
                                                        size: size,
                                                        img: Discount['img3'],
                                                      )),
                                                  Positioned(
                                                      bottom: size.height * .01,
                                                      left: size.width * .01,
                                                      child: Book_Picture(
                                                        size: size,
                                                        img: Discount['img4'],
                                                      )),
                                                  Positioned(
                                                    right: 0,
                                                    top: size.height * .13,
                                                    child: Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .end,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Text(
                                                          Discount['title'],
                                                          style: TextStyle(
                                                            fontSize: 17.5,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontFamily:
                                                                'Tajawal',
                                                            color: Colors
                                                                .orangeAccent,
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          height: 10,
                                                        ),
                                                        Text(
                                                          Discount['sub1'],
                                                          style: kOffersSub,
                                                          textAlign:
                                                              TextAlign.right,
                                                        ),
                                                        SizedBox(
                                                          height: 10,
                                                        ),
                                                        Text(
                                                          Discount['sub2'],
                                                          style: kOffersSub,
                                                          textAlign:
                                                              TextAlign.right,
                                                        ),
                                                        SizedBox(
                                                          height: 10,
                                                        ),
                                                        Text(
                                                          Discount['sub3'],
                                                          style: kOffersSub,
                                                          textAlign:
                                                              TextAlign.right,
                                                        ),
                                                        SizedBox(
                                                          height: 10,
                                                        ),
                                                        Text(
                                                          Discount['sub4'],
                                                          style: kOffersSub,
                                                          textAlign:
                                                              TextAlign.right,
                                                        ),
                                                        SizedBox(
                                                          height: 10,
                                                        ),
                                                        Text(
                                                          Discount['footer'],
                                                          style: TextStyle(
                                                            fontSize: 15,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontFamily:
                                                                'Tajawal',
                                                            color: Colors
                                                                .orangeAccent,
                                                          ),
                                                          textAlign:
                                                              TextAlign.right,
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            SizedBox(
                                              height: 5,
                                            ),
                                            Divider(
                                              color: Colors.orangeAccent,
                                            ),
                                          ],
                                        )),
                                  ),
                                  Container(
                                    height: size.height * .39,
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
                                              height: size.height * .33,
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
                                                      right: 0,
                                                      child: Center(
                                                        child: Lottie.network(
                                                            'https://assets6.lottiefiles.com/packages/lf20_jm1zwwig.json',
                                                            width: size.width *
                                                                .34,
                                                            height:
                                                                size.height *
                                                                    .12,
                                                            fit: BoxFit.cover),
                                                      )),
                                                  Positioned(
                                                    top: size.height * .03,
                                                    left: 0,
                                                    child: Book_Picture(
                                                      size: size,
                                                      img: Discount['img1'],
                                                    ),
                                                  ),
                                                  Positioned(
                                                      top: 0,
                                                      left: size.width * .27,
                                                      child: Book_Picture(
                                                        size: size,
                                                        img: Discount['img2'],
                                                      )),
                                                  Positioned(
                                                      bottom: 0,
                                                      left: size.width * .25,
                                                      child: Book_Picture(
                                                        size: size,
                                                        img: Discount['img3'],
                                                      )),
                                                  Positioned(
                                                      bottom: size.height * .01,
                                                      left: size.width * .01,
                                                      child: Book_Picture(
                                                        size: size,
                                                        img: Discount['img4'],
                                                      )),
                                                  Positioned(
                                                    right: 0,
                                                    top: size.height * .13,
                                                    child: Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .end,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Text(
                                                          Discount['title'],
                                                          style: TextStyle(
                                                            fontSize: 17.5,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontFamily:
                                                                'Tajawal',
                                                            color: Colors
                                                                .orangeAccent,
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          height: 10,
                                                        ),
                                                        Text(
                                                          Discount['sub1'],
                                                          style: kOffersSub,
                                                          textAlign:
                                                              TextAlign.right,
                                                        ),
                                                        SizedBox(
                                                          height: 10,
                                                        ),
                                                        Text(
                                                          Discount['sub2'],
                                                          style: kOffersSub,
                                                          textAlign:
                                                              TextAlign.right,
                                                        ),
                                                        SizedBox(
                                                          height: 10,
                                                        ),
                                                        Text(
                                                          Discount['sub3'],
                                                          style: kOffersSub,
                                                          textAlign:
                                                              TextAlign.right,
                                                        ),
                                                        SizedBox(
                                                          height: 10,
                                                        ),
                                                        Text(
                                                          Discount['sub4'],
                                                          style: kOffersSub,
                                                          textAlign:
                                                              TextAlign.right,
                                                        ),
                                                        SizedBox(
                                                          height: 10,
                                                        ),
                                                        Text(
                                                          Discount['footer'],
                                                          style: TextStyle(
                                                            fontSize: 15,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontFamily:
                                                                'Tajawal',
                                                            color: Colors
                                                                .orangeAccent,
                                                          ),
                                                          textAlign:
                                                              TextAlign.right,
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            SizedBox(
                                              height: 5,
                                            ),
                                            Divider(
                                              color: Colors.orangeAccent,
                                            ),
                                          ],
                                        )),
                                  ),
                                  Container(
                                    height: size.height * .39,
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
                                              height: size.height * .33,
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
                                                      right: 0,
                                                      child: Center(
                                                        child: Lottie.network(
                                                            'https://assets4.lottiefiles.com/packages/lf20_fwQ7Gu.json',
                                                            width: size.width *
                                                                .34,
                                                            height:
                                                            size.height *
                                                                .12,
                                                            fit: BoxFit.fill),
                                                      )),
                                                  Positioned(
                                                    top: size.height * .03,
                                                    left: 0,
                                                    child: Book_Picture(
                                                      size: size,
                                                      img: Discount['img1'],
                                                    ),
                                                  ),
                                                  Positioned(
                                                      top: 0,
                                                      left: size.width * .27,
                                                      child: Book_Picture(
                                                        size: size,
                                                        img: Discount['img2'],
                                                      )),
                                                  Positioned(
                                                      bottom: 0,
                                                      left: size.width * .25,
                                                      child: Book_Picture(
                                                        size: size,
                                                        img: Discount['img3'],
                                                      )),
                                                  Positioned(
                                                      bottom: size.height * .01,
                                                      left: size.width * .01,
                                                      child: Book_Picture(
                                                        size: size,
                                                        img: Discount['img4'],
                                                      )),
                                                  Positioned(
                                                    right: 0,
                                                    top: size.height * .13,
                                                    child: Column(
                                                      crossAxisAlignment:
                                                      CrossAxisAlignment
                                                          .end,
                                                      mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                      children: [
                                                        Text(
                                                          Discount['title'],
                                                          style: TextStyle(
                                                            fontSize: 17.5,
                                                            fontWeight:
                                                            FontWeight.bold,
                                                            fontFamily:
                                                            'Tajawal',
                                                            color: Colors
                                                                .orangeAccent,
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          height: 10,
                                                        ),
                                                        Text(
                                                          Discount['sub1'],
                                                          style: kOffersSub,
                                                          textAlign:
                                                          TextAlign.right,
                                                        ),
                                                        SizedBox(
                                                          height: 10,
                                                        ),
                                                        Text(
                                                          Discount['sub2'],
                                                          style: kOffersSub,
                                                          textAlign:
                                                          TextAlign.right,
                                                        ),
                                                        SizedBox(
                                                          height: 10,
                                                        ),
                                                        Text(
                                                          Discount['sub3'],
                                                          style: kOffersSub,
                                                          textAlign:
                                                          TextAlign.right,
                                                        ),
                                                        SizedBox(
                                                          height: 10,
                                                        ),
                                                        Text(
                                                          Discount['sub4'],
                                                          style: kOffersSub,
                                                          textAlign:
                                                          TextAlign.right,
                                                        ),
                                                        SizedBox(
                                                          height: 10,
                                                        ),
                                                        Text(
                                                          Discount['footer'],
                                                          style: TextStyle(
                                                            fontSize: 15,
                                                            fontWeight:
                                                            FontWeight.bold,
                                                            fontFamily:
                                                            'Tajawal',
                                                            color: Colors
                                                                .orangeAccent,
                                                          ),
                                                          textAlign:
                                                          TextAlign.right,
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            SizedBox(
                                              height: 5,
                                            ),
                                            Divider(
                                              color: Colors.orangeAccent,
                                            ),
                                          ],
                                        )),
                                  ),
                                  Container(
                                    height: size.height * .39,
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
                                              height: size.height * .33,
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
                                                      right: 0,
                                                      child: Center(
                                                        child: Lottie.network(
                                                            'https://assets5.lottiefiles.com/packages/lf20_gKzBIi.json',
                                                            width: size.width *
                                                                .32,
                                                            height:
                                                            size.height *
                                                                .13,
                                                            fit: BoxFit.fill),
                                                      )),
                                                  Positioned(
                                                    top: size.height * .03,
                                                    left: 0,
                                                    child: Book_Picture(
                                                      size: size,
                                                      img: Discount['img1'],
                                                    ),
                                                  ),
                                                  Positioned(
                                                      top: 0,
                                                      left: size.width * .27,
                                                      child: Book_Picture(
                                                        size: size,
                                                        img: Discount['img2'],
                                                      )),
                                                  Positioned(
                                                      bottom: 0,
                                                      left: size.width * .25,
                                                      child: Book_Picture(
                                                        size: size,
                                                        img: Discount['img3'],
                                                      )),
                                                  Positioned(
                                                      bottom: size.height * .01,
                                                      left: size.width * .01,
                                                      child: Book_Picture(
                                                        size: size,
                                                        img: Discount['img4'],
                                                      )),
                                                  Positioned(
                                                    right: 0,
                                                    top: size.height * .13,
                                                    child: Column(
                                                      crossAxisAlignment:
                                                      CrossAxisAlignment
                                                          .end,
                                                      mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                      children: [
                                                        Text(
                                                          Discount['title'],
                                                          style: TextStyle(
                                                            fontSize: 17.5,
                                                            fontWeight:
                                                            FontWeight.bold,
                                                            fontFamily:
                                                            'Tajawal',
                                                            color: Colors
                                                                .orangeAccent,
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          height: 10,
                                                        ),
                                                        Text(
                                                          Discount['sub1'],
                                                          style: kOffersSub,
                                                          textAlign:
                                                          TextAlign.right,
                                                        ),
                                                        SizedBox(
                                                          height: 10,
                                                        ),
                                                        Text(
                                                          Discount['sub2'],
                                                          style: kOffersSub,
                                                          textAlign:
                                                          TextAlign.right,
                                                        ),
                                                        SizedBox(
                                                          height: 10,
                                                        ),
                                                        Text(
                                                          Discount['sub3'],
                                                          style: kOffersSub,
                                                          textAlign:
                                                          TextAlign.right,
                                                        ),
                                                        SizedBox(
                                                          height: 10,
                                                        ),
                                                        Text(
                                                          Discount['sub4'],
                                                          style: kOffersSub,
                                                          textAlign:
                                                          TextAlign.right,
                                                        ),
                                                        SizedBox(
                                                          height: 10,
                                                        ),
                                                        Text(
                                                          Discount['footer'],
                                                          style: TextStyle(
                                                            fontSize: 15,
                                                            fontWeight:
                                                            FontWeight.bold,
                                                            fontFamily:
                                                            'Tajawal',
                                                            color: Colors
                                                                .orangeAccent,
                                                          ),
                                                          textAlign:
                                                          TextAlign.right,
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            SizedBox(
                                              height: 5,
                                            ),
                                            Divider(
                                              color: Colors.orangeAccent,
                                            ),
                                          ],
                                        )),
                                  ),
                                ],
                              ));
                        }).toList(),
                      );
                    }),
              );
            }
          },
        )));
  }
}

class Book_Picture extends StatelessWidget {
  const Book_Picture({
    Key? key,
    required this.size,
    required this.img,
  }) : super(key: key);

  final Size size;
  final String img;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: size.height * .19,
      width: size.width * .29,
      decoration: BoxDecoration(
        color: Color(0xd7292929),
        image: DecorationImage(
          image: NetworkImage(img),
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
