import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'books_class.dart';

class ReviewDetailes extends StatefulWidget {
  const ReviewDetailes({Key? key, required this.book}) : super(key: key);
  final Books book;

  @override
  State<ReviewDetailes> createState() => _ReviewDetailesState();
}

class _ReviewDetailesState extends State<ReviewDetailes> {

  @override
  Widget build(BuildContext context) {
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
      body:
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Center(child: Text(widget.book.title)),
              SizedBox(height: 20,),
              Center(child: Text('الكاتب: ${widget.book.writer}',style: const TextStyle(fontFamily: 'Tajawal',color: Colors.white),)),
              Divider(),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(child: Text('عدد الصفحات')),

              ),
              Divider(),

              Center(child: Text(widget.book.review))
            ],
          ),
        ),
      )
    );
  }
}
