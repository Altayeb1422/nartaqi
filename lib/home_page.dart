import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/route_manager.dart';
import 'package:lottie/lottie.dart';
import 'package:nartaqi/notifications.dart';
import 'body.dart';
import 'constants.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    Key? key,
  }) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}


Future _checkInternetConnection() async {

  await InternetAddress.lookup('www.google.com').timeout(const Duration(seconds: 20));
  return Body();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: kPrimaryColor,
          elevation: 0.0,
          leading: ElevatedButton(
              style: ButtonStyle(
                shadowColor: MaterialStateProperty.all(
                    Colors.transparent),
                backgroundColor: MaterialStateProperty.all<
                    Color>(
                  Colors.transparent,
                ),
              ),
            onPressed: () {
              Get.to(()=> NotificationPage());
            },

            child: Center(child: Lottie.asset('images/notification-bell-ring.json',width: 120, height: 120,fit: BoxFit.cover))
          ),
          actions: const [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 16.0),
              child: Text(
                'الرئيسية',
                style: kPageTitleStyle,
              ),
            ),
          ],
        ),
        body: Center(
          child: FutureBuilder(
            future: _checkInternetConnection(),
            builder: (context,snapshot){
              if(snapshot.connectionState == ConnectionState.waiting ){
                return  Center(child: Lottie.asset('images/book-app.json',width: 120, height: 120,));
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
                return Body();
              }
            },
          )
        )
    );
  }
}
