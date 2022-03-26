import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lottie/lottie.dart';
import 'constants.dart';


class AudioBooks extends StatefulWidget {
  const AudioBooks({Key? key}) : super(key: key);

  @override
  _AudioBooksState createState() => _AudioBooksState();
}

Future _checkInternetConnection() async {

  await InternetAddress.lookup('www.google.com').timeout(const Duration(seconds: 10));

  return Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Lottie.asset('images/retro-vinyl-player.json', width: 70, height: 70,),
        const SizedBox(height: 30,),
        const Text('... قريبا',style: kPageTitleStyle,),
      ],
    ),
  ) ;
}

class _AudioBooksState extends State<AudioBooks> {

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery
        .of(context)
        .size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: const [
            Text(
              'المكتبة الصوتية',
              style: kPageTitleStyle,
            ),
          ],
        ),
        elevation: 0,
      ),
      body: Center(
          child: FutureBuilder(
            future: _checkInternetConnection(),
            builder: (context,snapshot){
              if(snapshot.connectionState == ConnectionState.waiting ){
                return  Center(
                    child: Lottie.asset(
                      'images/book-app.json',
                      width: 120,
                      height: 120,
                    ));
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
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Lottie.asset('images/retro-vinyl-player.json', width: 150 , height: 150,),
                      const SizedBox(height: 5,),
                      const Text('... قريبا',style: kPageTitleStyle,),
                    ],
                  ),
                );
              }
            },
          )
      )

    );
  }
}
