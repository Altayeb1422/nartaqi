import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nartaqi/constants.dart';
import 'package:nartaqi/writer_card_writer.dart';
import 'package:nartaqi/writers_class.dart';

final bucketGlobal = PageStorageBucket();

class WritersPage extends StatefulWidget {
  const WritersPage({
    Key? key,
  }) : super(key: key);

  @override
  _WritersPageState createState() => _WritersPageState();
}

Future _checkInternetConnection() async {
  await InternetAddress.lookup('www.kindacode.com').timeout(const Duration(seconds: 3));
}

class _WritersPageState extends State<WritersPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: const [
            Text(
              'كتاب الدار',
              style: kPageTitleStyle,
            ),
          ],
        ),
        elevation: 0,
      ),
      body:  Center(
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
                return  PageStorage(
                  bucket: bucketGlobal,
                  child: AnimationLimiter(
                    child: GridView.count(
                      key: const PageStorageKey<String>('writersPageList'),
                      physics:
                      const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
                      crossAxisCount: 2,
                      childAspectRatio: .75,
                      children: List.generate(
                        writer.length,
                            (int index) {
                          return AnimationConfiguration.staggeredGrid(
                            position: index,
                            duration: const Duration(milliseconds: 500),
                            columnCount: 2,
                            child: ScaleAnimation(
                              duration: const Duration(milliseconds: 900),
                              curve: Curves.fastLinearToSlowEaseIn,
                              child: FadeInAnimation(
                                child: WriterCardWriter(
                                  writer: writer[index],
                                ),
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

