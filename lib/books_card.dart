import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'books_class.dart';

class BooksCard extends StatelessWidget {
  const BooksCard({Key? key, required this.onTap, required this.book})
      : super(key: key);

  final VoidCallback onTap;
  final Books book;
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Container(
          height: size.height * .39,
          width: size.width * .4,
          decoration: const BoxDecoration(
            color: Color(0x00ffffff),
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          child: Column(
            children: [
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(book.image),
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
                  child: Stack(
                    children: [
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
                                blurRadius: 3.0,
                              )
                            ],
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              vertical: 3.0,
                              horizontal: 5,
                            ),
                            child: Text(
                              book.genre,
                              textDirection: TextDirection.rtl,
                              style: const TextStyle(
                                color: Colors.black,
                                fontFamily: 'Tajawal',
                              ),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        right: 5,
                        bottom: 7,
                        child: InkWell(
                          onTap: () {
                            Fluttertoast.showToast(
                                msg: 'قريبا',
                                toastLength: Toast.LENGTH_LONG,
                                gravity: ToastGravity.BOTTOM,
                              fontSize: 20,
                            );
                          },
                          child: const Icon(
                            Icons.download_for_offline,
                            size: 40,
                            color: Colors.white,
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
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        book.title,
                        textAlign: TextAlign.end,
                        softWrap: true,
                        style: const TextStyle(
                          fontFamily: 'Tajawal',
                          fontSize: 13,
                          color: Colors.white,
                        ),
                        overflow: TextOverflow.fade,
                      ),
                      Text(
                        book.writer,
                        textAlign: TextAlign.end,
                        softWrap: true,
                        style: const TextStyle(
                          fontFamily: 'Tajawal',
                          fontSize: 13,
                          color: Color(0xFFF9A826),
                        ),
                        overflow: TextOverflow.fade,
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
  }
}
