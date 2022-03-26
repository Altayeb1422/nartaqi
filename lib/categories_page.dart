import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nartaqi/arabic_books_page.dart';
import 'package:nartaqi/categories_card.dart';
import 'package:nartaqi/categories_class.dart';
import 'package:nartaqi/classics_books_page.dart';
import 'package:nartaqi/english_books_page.dart';
import 'package:nartaqi/pocket_books_page.dart';
import 'package:nartaqi/sudanese_books_page.dart';
import 'package:nartaqi/translate_books_page.dart';
import 'constants.dart';

final bucketGlobal = PageStorageBucket();

class CategoriesPage extends StatefulWidget {
  const CategoriesPage({Key? key}) : super(key: key);

  @override
  _CategoriesPageState createState() => _CategoriesPageState();
}

Future _checkInternetConnection() async {

  await InternetAddress.lookup('www.kindacode.com').timeout(const Duration(seconds: 3));
}

class _CategoriesPageState extends State<CategoriesPage> {

  @override
  Widget build(BuildContext context) {
    final list = [
      CategoriesCard(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) =>  EnglishBooksPage(),
            ),
          );
        },
        categories: categories[0],
      ),
      CategoriesCard(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const PocketBooksPage(),
            ),
          );
        },
        categories: categories[1],
      ),
      CategoriesCard(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const TranslatedBooksPage(),
            ),
          );
        },
        categories: categories[2],
      ),
      CategoriesCard(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const SudaneseBooksPage(),
            ),
          );
        },
        categories: categories[3],
      ),
      CategoriesCard(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const ClassicBooksPage(),
            ),
          );
        },
        categories: categories[4],
      ),
      CategoriesCard(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const ArabicBooksPage(),
            ),
          );
        },
        categories: categories[5],
      ),
      CategoriesCard(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const PocketBooksPage(),
            ),
          );
        },
        categories: categories[6],
      ),
    ];
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        automaticallyImplyLeading: false,
        title: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: const [
              Text(
                'الأقسام',
                style: kPageTitleStyle,
              ),
            ],
          ),
        ),
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
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
            builder: (context,snapshot){
              if(snapshot.connectionState == ConnectionState.waiting ){
                return  SpinKitThreeBounce(
                  color: Colors.orangeAccent,
                  size: 30.0,
                );
              }if(snapshot.hasError){
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset('images/offline.svg', width: 100, height: 100,),
                    SizedBox(height: 15,),
                    const Text(
                      'لايوجد إتصال',
                      style: kPageTitleStyle,
                    ),
                    SizedBox(height: 15,),
                    ElevatedButton(onPressed:(){setState(() {});} , child: Text('تحديث',style: kRefreshButton)),
                  ],
                );
              }else{
                return PageStorage(
                  bucket: bucketGlobal,
                  child: AnimationLimiter(
                    child: GridView.count(
                      key: const PageStorageKey<String>('categories'),
                      physics: const BouncingScrollPhysics(
                          parent: AlwaysScrollableScrollPhysics()),
                      crossAxisCount: 2,
                      childAspectRatio: .7,
                      children: List.generate(
                        list.length,
                            (int index) {
                          return AnimationConfiguration.staggeredGrid(
                            position: index,
                            duration: const Duration(milliseconds: 500),
                            columnCount: 2,
                            child: ScaleAnimation(
                              duration: const Duration(milliseconds: 900),
                              curve: Curves.fastLinearToSlowEaseIn,
                              child: FadeInAnimation(
                                child: list[index],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                );
              }
            },
          )
      )

    );
  }
}
