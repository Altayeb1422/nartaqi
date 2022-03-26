import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'book_detailes.dart';
import 'books_card.dart';
import 'books_class.dart';
import 'constants.dart';

final bucketGlobal = PageStorageBucket();
class PublishedBooksPage extends StatefulWidget {
  const PublishedBooksPage({Key? key}) : super(key: key);

  @override
  _PublishedBooksPageState createState() => _PublishedBooksPageState();
}

class _PublishedBooksPageState extends State<PublishedBooksPage> {
  bool? _isConnected;
  // This function is triggered when the floating button is pressed
  Future<void> _checkInternetConnection() async {
    try {
      final response = await InternetAddress.lookup('www.kindacode.com');
      if (response.isNotEmpty) {
        setState(() {
          _isConnected = true;
        });
      }
    } on SocketException {
      setState(() {
        _isConnected = false;
      });

      Fluttertoast.showToast(
          msg: "لايوجد إتصال",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.TOP,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0
      );

    }
  }
  @override
  void initState() {
    _checkInternetConnection();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        automaticallyImplyLeading: false,
      title: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: const [
              Text('إصدارات الدار', style: kPageTitleStyle,),
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
      body: _isConnected == true ?
      PageStorage(
        bucket: bucketGlobal,
        child: AnimationLimiter(
          child: GridView.count(
            key: const PageStorageKey<String>('publishedBooks'),
            physics:
            const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
            crossAxisCount: 2,
            childAspectRatio: .51,
            children: List.generate(
              book.length,
                  (int index) {
                return AnimationConfiguration.staggeredGrid(
                  position: index,
                  duration: const Duration(milliseconds: 500),
                  columnCount: 2,
                  child: ScaleAnimation(
                    duration: const Duration(milliseconds: 900),
                    curve: Curves.fastLinearToSlowEaseIn,
                    child: FadeInAnimation(
                      child: BooksCard(
                        onTap: () {Navigator.push(context, MaterialPageRoute(builder: (context)=>BookDetails(book: book[index])));},
                        book: book[index],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ):
      Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset('images/offline.svg', width: 100, height: 100,),
            SizedBox(height: 15,),
            const Text(
              'لايوجد إتصال',
              style: kPageTitleStyle,
            ),
            SizedBox(height: 15,),
            ElevatedButton(onPressed: _checkInternetConnection, child: Text('تحديث',style: kRefreshButton))
          ],
        ),
      ) ,
    );
  }
}
