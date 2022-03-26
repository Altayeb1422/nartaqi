import 'dart:io';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'constants.dart';
import 'package:shimmer/shimmer.dart';

final bucketGlobal = PageStorageBucket();

class ArabicBooksPage extends StatefulWidget {
  const ArabicBooksPage({Key? key}) : super(key: key);

  @override
  _ArabicBooksPage createState() => _ArabicBooksPage();
}

Future _checkInternetConnection() async {
  await InternetAddress.lookup('www.google.com')
      .timeout(const Duration(seconds: 20));
}

class _ArabicBooksPage extends State<ArabicBooksPage> {
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
                  'الكتب العربية',
                  style: kPageTitleStyle,
                ),
              ],
            ),
          ),
          elevation: 0,
          leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: const Icon(
              Icons.cancel,
              color: Color(0xFFF9A826),
            ),
          ),
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
                            .collection('ArabicBooks')
                            .snapshots(),
                        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                          if (!snapshot.hasData) {
                            return Center(
                                child: Lottie.asset(
                                  'images/book-app.json',
                                  width: 120,
                                  height: 120,
                                ));
                          }
                          return PageStorage(
                            bucket: bucketGlobal,
                            child: GridView.count(
                              key: const PageStorageKey<String>('ArabicBooks'),
                              crossAxisCount: 2,
                              childAspectRatio: .51,
                              mainAxisSpacing: 10,
                              physics:  BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
                              children: snapshot.data!.docs.map((ArabicBooks) {
                                return GestureDetector(
                                  child: Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: Container(
                                      height: size.height * .38,
                                      width: size.width * .4,
                                      decoration: const BoxDecoration(
                                        color: Colors.transparent,
                                        borderRadius: BorderRadius.all(Radius.circular(10)),
                                      ),
                                      child: Column(
                                        children: [
                                          Expanded(
                                            child: Container(
                                              decoration: BoxDecoration(
                                                color: Color(0xff292929),
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
                                                    blurRadius: 5.0,)
                                                ],),
                                              child: Stack(
                                                children: [
                                                  CachedNetworkImage(
                                                    fit: BoxFit.cover,
                                                    imageUrl: ArabicBooks['image'] ,
                                                    imageBuilder: (context, imageProvider) => Container(
                                                      decoration: BoxDecoration(
                                                        borderRadius: BorderRadius.all(Radius.circular(10)),
                                                        image: DecorationImage(
                                                            image: imageProvider, fit: BoxFit.fill),
                                                      ),
                                                    ),
                                                    placeholder: (context, url) => SizedBox(
                                                      height: size.height,
                                                      width: size.width,
                                                      child: Shimmer.fromColors(
                                                        baseColor: Color(0xff292929),
                                                        highlightColor: Colors.white12,
                                                        child: Container(
                                                          decoration: const BoxDecoration(
                                                            color: Colors.white,
                                                            borderRadius: BorderRadius.all(Radius.circular(10)),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    errorWidget: (context, url, error) => Icon(Icons.error),
                                                  ),
                                                  Positioned(
                                                    right: 5,
                                                    top: 7,
                                                    child: Container(
                                                      decoration: BoxDecoration(
                                                        color: Colors.orangeAccent,
                                                        borderRadius:
                                                        const BorderRadius.all(Radius.circular(5)),
                                                        boxShadow: [
                                                          BoxShadow(
                                                            color: Colors.grey.withOpacity(0.4),
                                                            offset: const Offset(0, 4),
                                                            blurRadius: 3.0,)
                                                        ],),
                                                      child: Padding(
                                                        padding: const EdgeInsets.symmetric(
                                                          vertical: 3.0, horizontal: 5,),
                                                        child: Text(
                                                          ArabicBooks['genre'],
                                                          textDirection: TextDirection.rtl,
                                                          style: const TextStyle(
                                                            color: Colors.black,
                                                            fontFamily: 'Tajawal',
                                                            fontSize: 15 ,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(top: 18.0),
                                            child: SizedBox(
                                              height: size.height * .09,
                                              width: double.infinity,
                                              child: Column(
                                                crossAxisAlignment: CrossAxisAlignment.center,
                                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                children: [
                                                  Center(
                                                    child: Text(
                                                      ArabicBooks['title'],
                                                      textAlign: TextAlign.start,
                                                      softWrap: true,
                                                      style: const TextStyle(
                                                        fontFamily: 'Tajawal',
                                                        fontSize: 15,
                                                        color: Colors.white,),
                                                    ),
                                                  ),
                                                  Center(
                                                    child: Text(
                                                      ArabicBooks['author'],
                                                      textAlign: TextAlign.start,
                                                      softWrap: true,
                                                      style: const TextStyle(
                                                        fontFamily: 'Tajawal',
                                                        fontSize: 13,
                                                        color: Color(0xFFF9A826),),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              }).toList(),
                            ),
                          );
                        }),
                  );
                }
              },
            )));
  }
}
