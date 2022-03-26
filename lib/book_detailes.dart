import 'dart:io';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:nartaqi/constants.dart';
import 'books_class.dart';
class BookDetails extends StatefulWidget {
  const BookDetails({Key? key, required this.book}) : super(key: key);
  final Books book;

  @override
  State<BookDetails> createState() => _BookDetailsState();
}

class _BookDetailsState extends State<BookDetails> {
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
          fontSize: 16.0);
    }
  }
  @override
  void initState() {
    _checkInternetConnection();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: const Color(0xff292929) ,
      appBar: AppBar(
        leading: IconButton(
          onPressed: (){Navigator.pop(context);},
      icon: const Icon(Icons.cancel, color: Color(0xFFF9A826),),
    ),
        elevation: 0,
        backgroundColor: const Color(0xff292929),
      ),
      body: _isConnected == true?
      SingleChildScrollView(
        child: SizedBox(
          width: size.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Stack(
                children: [
                  SizedBox(
                    height: size.height *.36,
                    width: size.width*.53,
                    child: Hero(
                      tag: 'imageHero',
                      child: Container(
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage(widget.book.image),
                                fit: BoxFit.fill
                            ,),
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(10),
                              topRight: Radius.circular(10),
                              bottomRight: Radius.circular(10),
                              bottomLeft: Radius.circular(10),
                            ),
                            boxShadow: [BoxShadow(
                                color: Colors.black12.withOpacity(0.4),
                                offset: const Offset(0,8),
                                blurRadius: 5.0
                            ,)]
                        ,),
                      ),
                    ),
                  ),
                  Positioned(
                    right: 5,
                    top: 7,
                    child: Container(
                      decoration: BoxDecoration( color: Colors.orangeAccent,
                      borderRadius: const BorderRadius.all(Radius.circular(5)),
                          boxShadow: [BoxShadow(
                              color: Colors.grey.withOpacity(0.4),
                              offset: const Offset(0,4),
                              blurRadius: 3.0
                          ,)],),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical:3.0, horizontal: 5),
                        child: Text(widget.book.genre,textDirection: TextDirection.rtl, style: const TextStyle(color: Colors.black,fontFamily: 'Tajawal',),),
                      ),
                    ),
                  ),
                ]
              ,),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 30.0, horizontal: 10),
                child: Container(
                  alignment: Alignment.bottomRight,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              widget.book.title,
                              style: kDetailesPAgeTextStyle ,
                              textDirection: TextDirection.rtl,
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 5,),
                      const Divider(),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CircleAvatar(
                              backgroundImage: AssetImage(widget.book.icon),
                              radius: 50,
                            ),
                            Text(
                              'الكاتب: ${widget.book.writer}',
                              style:const TextStyle(fontFamily: 'Tajawal', fontSize: 18, color: Color(0xFFF9A826)),
                              textDirection: TextDirection.rtl,
                              textAlign: TextAlign.right,
                            ),
                          ],
                        ),
                      ),
                      const Divider(),
                      const SizedBox(height: 5,),
                      const Text(
                        'عن الكتاب:',
                        style: kDetailesPAgeTextStyle ,
                        textDirection: TextDirection.rtl,
                      ),
                      const SizedBox(height: 13,),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: Text(
                          widget.book.description,
                          style: kDetailesPAgeTextStyle ,
                          textDirection: TextDirection.rtl,
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ):
      InkWell(
          onTap: _checkInternetConnection,
          child: Center(child: CircularProgressIndicator(),)),
    );
  }
}
