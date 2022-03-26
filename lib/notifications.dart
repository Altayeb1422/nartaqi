import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nartaqi/constants.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff292929) ,
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.only(right: 10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                'الإشعارات',
                style: kPageTitleStyle,
              ),
            ],
          ),
        ),
        leading: IconButton(
          onPressed: (){Get.back();},
          icon: Icon(Icons.cancel, color: Color(0xFFF9A826),),
        ),
        elevation: 0,
        backgroundColor: Color(0xff292929),
      ),
      body: Container(
        child: Center(child: Text('لا توجد إشعارات')),
      ),
    );
  }
}
