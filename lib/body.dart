import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';
import 'package:nartaqi/arabic_books_page.dart';
import 'package:nartaqi/categories_card.dart';
import 'package:nartaqi/categories_class.dart';
import 'package:nartaqi/english_books_page.dart';
import 'package:nartaqi/published_books.dart';
import 'package:nartaqi/sudanese_books_page.dart';
import 'book_detailes.dart';
import 'books_card.dart';
import 'books_class.dart';
import 'categories_page.dart';
import 'row_all_button.dart';
import 'row_title.dart';

class Body extends StatefulWidget {
  const Body({
    Key? key,
  }) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {

  @override
  Widget build(BuildContext context) {
    return AnimationLimiter(
      child: ListView.builder(
          key: const PageStorageKey<String>('mainPageList'),
          physics: const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
          itemCount: 1,
          itemBuilder: (context, index)  {
            return
              AnimationConfiguration.staggeredList(position: index,
                delay: const Duration(milliseconds: 100),
                child: SlideAnimation(
                  duration: const Duration(milliseconds: 2500),
                  curve: Curves.fastLinearToSlowEaseIn,
                  verticalOffset: -250,
                  child: ScaleAnimation(
                      duration: const Duration(milliseconds: 1500),
                      curve: Curves.fastLinearToSlowEaseIn,
                      child:SingleChildScrollView(
                        key: const PageStorageKey<String>('mainPageList'),
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                children: [
                                  AllBtn(
                                    onPressed: () {
                                      Get.to(PublishedBooksPage());
                                    },
                                  ),
                                  const Spacer(),
                                  const Padding(
                                    padding: EdgeInsets.only(right: 5.0),
                                    child: RowTitle(title: 'منشورات الدار'),
                                  ),
                                ],
                              ),
                            ),
                            SingleChildScrollView(
                              key: const PageStorageKey<String>('booksRow'),
                              scrollDirection: Axis.horizontal,
                              reverse: true,
                              physics:
                              const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
                              child: Row(
                                children: [
                                  BooksCard(
                                    onTap: () {
                                      Get.to(BookDetails(book: book[5]));
                                    },
                                    book: book[5],
                                  ),
                                  BooksCard(
                                    onTap: () {
                                      Get.to(BookDetails(book: book[9]));
                                    },
                                    book: book[9],
                                  ),
                                  BooksCard(
                                    onTap: () {
                                      Get.to(BookDetails(book: book[7]));
                                    },
                                    book: book[7],
                                  ),
                                  BooksCard(
                                    onTap: () {
                                      Get.to(BookDetails(book: book[8]));
                                    },
                                    book: book[8],
                                  ),
                                  BooksCard(
                                    onTap: () {
                                      Get.to(BookDetails(book: book[1]));
                                    },
                                    book: book[1],
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                children: [
                                  AllBtn(
                                    onPressed: () {
                                      Get.to(CategoriesPage());
                                    },
                                  ),
                                  const Spacer(),
                                  const Padding(
                                    padding: EdgeInsets.only(right:5.0),
                                    child: RowTitle(title: 'الأقسام'),
                                  ),
                                ],
                              ),
                            ),
                            SingleChildScrollView(
                              key: const PageStorageKey<String>('CategoriesRow'),
                              scrollDirection: Axis.horizontal,
                              reverse: true,
                              physics:
                              const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
                              child: Row(
                                children: [
                                  CategoriesCard(onTap:(){
                                    Get.to(SudaneseBooksPage());}, categories: categories[3],),
                                  CategoriesCard(onTap:(){}, categories: categories[1],),
                                  CategoriesCard(onTap:(){
                                    Get.to(ArabicBooksPage());}, categories: categories[5],),
                                  CategoriesCard(onTap:(){
                                    Get.to(EnglishBooksPage());}, categories: categories[0],),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                  ),
                ),
              );
          }
      ,),
    );
  }
}
