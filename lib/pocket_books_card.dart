import 'package:flutter/material.dart';
import 'package:nartaqi/categories_books_pages_class.dart';

class PocketBooksCard extends StatelessWidget {
  const PocketBooksCard({Key? key, required this.pocketBooks})
      : super(key: key);

  final PocketBooks pocketBooks;
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return GestureDetector(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Container(
          height: size.height * .38,
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
                      image: NetworkImage(pocketBooks.image),
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
                          child: const Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: 3.0, horizontal: 5,),
                            child: Text(
                              'رواية',
                              textDirection: TextDirection.rtl,
                              style: TextStyle(
                                color: Colors.black,
                                fontFamily: 'Tajawal',
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
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        pocketBooks.title,
                        textAlign: TextAlign.end,
                        softWrap: true,
                        style: const TextStyle(
                            fontFamily: 'Tajawal',
                            fontSize: 13,
                            color: Colors.white,),
                        overflow: TextOverflow.fade,
                      ),
                      Text(
                        pocketBooks.writer,
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
