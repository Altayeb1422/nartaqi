import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:nartaqi/constants.dart';
import 'package:nartaqi/writers_class.dart';

class WriterDetails extends StatefulWidget {
  const WriterDetails({required this.writer});
  final Writer writer;

  @override
  State<WriterDetails> createState() => _WriterDetailsState();
}

class _WriterDetailsState extends State<WriterDetails> {
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
      backgroundColor: const Color(0xff292929),
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.cancel,
            color: Color(0xFFF9A826),
          ),
        ),
        elevation: 0,
        backgroundColor: const Color(0xff292929),
      ),
      body: _isConnected == true?
      SafeArea(
        child: ListView(
          padding: EdgeInsets.zero,
          physics:
          const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: Container(
                  margin: const EdgeInsets.only(bottom: 20),
                  child: TopPage(
                    writer: widget.writer,
                  ),),
            ),
            Column(
              children: [
                const SizedBox(
                  height: 8,
                ),
                Text(
                  widget.writer.name,
                  style: kDetailesPAgeTextStyle,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 8,
                ),
                const Text(
                  'كاتب وروائي',
                  textAlign: TextAlign.center,
                  style: kPageTitleStyle,
                ),
                const SizedBox(
                  height: 16,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Icon(
                      Icons.facebook,
                      size: 40,
                      color: Colors.blueAccent,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 16,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: const [
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 20.0, vertical: 10,),
                          child: Text(
                            'عن الكاتب :',
                            textAlign: TextAlign.right,
                            style: kPageTitleStyle,
                            textDirection: TextDirection.rtl,
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 16.0),
                      child: Text(widget.writer.description,style: kDetailesPAgeTextStyle ,
                        textDirection: TextDirection.rtl,
                        textAlign: TextAlign.center,),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 16,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: const [
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 20.0, vertical: 5,),
                      child: Text(
                        'الكتب :',
                        textAlign: TextAlign.right,
                        style: kPageTitleStyle,
                        textDirection: TextDirection.rtl,
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Container(
                        height: size.height * .3,
                        width: size.width * .41,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage(widget.writer.book2.toString()),
                                fit: BoxFit.fill,),
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(8),
                              topRight: Radius.circular(8),
                              bottomRight: Radius.circular(8),
                              bottomLeft: Radius.circular(8),
                            ),

                            ),
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Container(
                        height: size.height * .3,
                        width: size.width * .41,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(widget.writer.book1),
                            fit: BoxFit.fill,),
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(8),
                            topRight: Radius.circular(8),
                            bottomRight: Radius.circular(8),
                            bottomLeft: Radius.circular(8),
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black12.withOpacity(0.4),
                              offset: const Offset(0, 8),
                              blurRadius: 5.0,),
                          ],),
                      ),
                    ),
                  ],
                )
              ],
            )
          ],
        ),
      ):
      InkWell(
        onTap: _checkInternetConnection,
          child: Center(child: CircularProgressIndicator(),)),
    );
  }
}

class TopPage extends StatelessWidget {
  const TopPage({
    Key? key,
    required this.writer,
  }) : super(key: key);
  final Writer writer;
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.center,
      children: [
        InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: const Icon(
              Icons.arrow_back,
              color: Colors.orangeAccent,
            ),),
        PhysicalModel(
          shape: BoxShape.circle,
          color: Colors.grey.withOpacity(.5),
          elevation: 10,
          child: CircleAvatar(
            radius: size.height * .3 / 2,
            backgroundColor: Colors.grey.shade800,
            backgroundImage: AssetImage(writer.iconimage),
          ),
        ),
      ],
    );
  }
}
