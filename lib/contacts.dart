
import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lottie/lottie.dart';
import 'package:url_launcher/url_launcher.dart';
import 'constants.dart';
import 'row_title.dart';

class ContactsPage extends StatefulWidget {
  const ContactsPage({Key? key}) : super(key: key);

  @override
  _ContactsPageState createState() => _ContactsPageState();
}

Future _checkInternetConnection() async {
  await InternetAddress.lookup('www.google.com').timeout(const Duration(seconds: 20));
}

class _ContactsPageState extends State<ContactsPage> {
  void _launchUrl(String url) async {
    if (await canLaunch(url)) {
      await launch(
        url,
        forceSafariVC: false,
      );
    } else {
      throw 'هذا الرابط غير متاح';
    }
  }

  void _launchCaller(int number) async {
    final url = 'tel:${number.toString()}';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'هذا الرابط غير متاح';
    }
  }

  void _launchEmail(String emailId) async {
    final url = "mailto:$emailId?subject=مرحبا";
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'هذا الرابط غير متاح';
    }
  }
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
              'تواصل معنا',
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
                return AnimationLimiter(
                  child: ListView.builder(
                    key: const PageStorageKey<String>('contactUsPageList'),
                    physics: const BouncingScrollPhysics(
                      parent: AlwaysScrollableScrollPhysics(),),
                    itemCount: 1,
                    itemBuilder: (context, index) {
                      return AnimationConfiguration.staggeredList(
                        position: index,
                        delay: const Duration(milliseconds: 100),
                        child: SlideAnimation(
                          duration: const Duration(milliseconds: 2500),
                          curve: Curves.fastLinearToSlowEaseIn,
                          verticalOffset: -250,
                          child: ScaleAnimation(
                            duration: const Duration(milliseconds: 1500),
                            curve: Curves.fastLinearToSlowEaseIn,
                            child: Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: Column(
                                children: [
                                  Center(
                                    child: PhysicalModel(
                                      shape: BoxShape.circle,
                                      color: Colors.grey.withOpacity(.6),
                                      elevation: 15,
                                      child: CircleAvatar(
                                        radius: size.height * .12,
                                        backgroundColor: Colors.grey.shade800,
                                        backgroundImage:
                                        const AssetImage('images/esra.jpg'),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 10,),
                                  const Padding(
                                    padding: EdgeInsets.symmetric(vertical: 15.0),
                                    child: Text(
                                      'إسراء الريس',
                                      style: TextStyle(
                                        fontFamily: 'Tajawal',
                                        color: Colors.orangeAccent, fontSize: 20,),
                                      textAlign: TextAlign.center,

                                    ),
                                  ),
                                  const Padding(
                                    padding: EdgeInsets.symmetric(vertical: 10.0),
                                    child: Text(
                                      'مؤسس دار نرتقي للنشر والتوزيع',
                                      style: TextStyle(
                                        fontFamily: 'Tajawal',
                                        color: Colors.white,
                                        fontSize: 15,),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                  const Divider(),
                                  Padding(
                                    padding: const EdgeInsets.all(5.0),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        ElevatedButton(
                                          onPressed: () {
                                            _launchCaller(00249916874502);
                                          },

                                          style: ButtonStyle(
                                            shadowColor: MaterialStateProperty.all(
                                                Colors.transparent),
                                            backgroundColor: MaterialStateProperty.all<
                                                Color>(
                                              Colors.transparent,
                                            ),

                                          ),
                                          child: Center(child: Lottie.asset('images/phone-call.json',width: size.width * .13, height: 70,fit: BoxFit.cover)),
                                        ),
                                        ElevatedButton(
                                            onPressed: () {
                                              _launchEmail("esraaamin254@gmail.com");
                                            },
                                            style: ButtonStyle(
                                              shadowColor: MaterialStateProperty.all(
                                                  Colors.transparent),
                                              backgroundColor:
                                              MaterialStateProperty.all<Color>(
                                                Colors.transparent,),),
                                            child: Center(child: Lottie.asset('images/email.json',width: size.width * .13, height: 70,fit: BoxFit.cover))
                                        ),
                                        ElevatedButton(
                                          onPressed: () {
                                            _launchUrl(
                                              "https://www.facebook.com/groups/1689455181135459/",
                                            );
                                          },
                                          style: ButtonStyle(
                                            shadowColor: MaterialStateProperty.all(
                                                Colors.transparent),
                                            backgroundColor: MaterialStateProperty.all<
                                                Color>(
                                              Colors.transparent,
                                            ),
                                          ),
                                          child: Center(child: Lottie.asset('images/facebook.json',width: size.width * .13, height: 70,fit: BoxFit.cover))
                                        ),

                                        ElevatedButton(
                                          onPressed: () {
                                            _launchUrl(
                                              "https://www.google.com/maps/place/%D9%85%D8%B1%D9%83%D8%B2+%D9%86%D8%B1%D8%AA%D9%82%D9%8A+%D8%A7%D9%84%D8%AB%D9%82%D8%A7%D9%81%D9%8A%E2%80%AD/@15.5966396,32.5765232,15z/data=!4m5!3m4!1s0x0:0x17705b8ba2b4d06e!8m2!3d15.5966396!4d32.5765232",);
                                          },
                                          style: ButtonStyle(
                                            shadowColor: MaterialStateProperty.all(
                                                Colors.transparent),
                                            backgroundColor:
                                            MaterialStateProperty.all<Color>(
                                              Colors.transparent,),),
                                          child: Center(child: Lottie.asset('images/location.json',width: size.width * .13, height: 70,fit: BoxFit.cover))) //Icon(Icons.location_on, size: 45, color: Colors.blue) )
                                      ],
                                    ),
                                  ),
                                  const Divider(),
                                  const SizedBox(height: 10,),
                                  Padding(
                                    padding: const EdgeInsets.all(20.0),
                                    child: Container(
                                      alignment: Alignment.center,
                                      width: size.width,
                                      child: const Text(
                                        'أنشئت دار نرتقي في أكتوبر في العام 2019, وعملت علي إنتاج مؤلفات مخلتفة تتناول الرواية والقصة والسيرة والكتابات وغيرها, بتوجه تنويري الغاية منه  الإسهام في خلق  نهضة ثقافية كبيرة مواصلة لما قدمه السابقون.',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(fontFamily: 'Tajawal',
                                            fontSize: 19,
                                            color: Colors.white),
                                        textDirection: TextDirection.rtl,),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      children: const [
                                        Spacer(),
                                        Padding(
                                          padding: EdgeInsets.only(top: 10.0, right: 5),
                                          child: RowTitle(title: ':فريق العمل'),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                                      children: [
                                        Column(
                                          children: [
                                            PhysicalModel(
                                              shape: BoxShape.circle,
                                              color: Colors.grey.withOpacity(.6),
                                              elevation: 15,
                                              child: CircleAvatar(
                                                radius: size.height * .05,
                                                backgroundColor: Colors.grey.shade800,
                                                backgroundImage:
                                                const AssetImage('images/esra.jpg'),
                                              ),
                                            ),

                                            const Padding(
                                              padding: EdgeInsets.symmetric(
                                                  vertical: 8.0),
                                              child: Text(
                                                'إسراء الريس',
                                                style: TextStyle(
                                                  fontFamily: 'Tajawal',
                                                  color: Colors.orangeAccent,),
                                                textAlign: TextAlign.center,

                                              ),
                                            ),
                                            const Padding(
                                              padding: EdgeInsets.symmetric(
                                                  vertical: 5.0),
                                              child: Text(
                                                'منسق',
                                                style: TextStyle(
                                                  fontFamily: 'Tajawal',
                                                  color: Colors.white,),
                                                textAlign: TextAlign.center,
                                              ),
                                            ),
                                          ],
                                        ),
                                        Column(
                                          children: [
                                            PhysicalModel(
                                              shape: BoxShape.circle,
                                              color: Colors.grey.withOpacity(.6),
                                              elevation: 15,
                                              child: CircleAvatar(
                                                radius: size.height * .05,
                                                backgroundColor: Colors.grey.shade800,
                                                backgroundImage:
                                                const AssetImage('images/esra.jpg'),
                                              ),
                                            ),

                                            const Padding(
                                              padding: EdgeInsets.symmetric(
                                                  vertical: 8.0),
                                              child: Text(
                                                'إسراء الريس',
                                                style: TextStyle(
                                                  fontFamily: 'Tajawal',
                                                  color: Colors.orangeAccent,),
                                                textAlign: TextAlign.center,

                                              ),
                                            ),
                                            const Padding(
                                              padding: EdgeInsets.symmetric(
                                                  vertical: 5.0),
                                              child: Text(
                                                'منسق',
                                                style: TextStyle(
                                                  fontFamily: 'Tajawal',
                                                  color: Colors.white,),
                                                textAlign: TextAlign.center,
                                              ),
                                            ),
                                          ],
                                        ),
                                        Column(
                                          children: [
                                            PhysicalModel(
                                              shape: BoxShape.circle,
                                              color: Colors.grey.withOpacity(.6),
                                              elevation: 15,
                                              child: CircleAvatar(
                                                radius: size.height * .05,
                                                backgroundColor: Colors.grey.shade800,
                                                backgroundImage:
                                                const AssetImage('images/esra.jpg'),
                                              ),
                                            ),

                                            const Padding(
                                              padding: EdgeInsets.symmetric(
                                                  vertical: 8.0),
                                              child: Text(
                                                'إسراء الريس',
                                                style: TextStyle(
                                                  fontFamily: 'Tajawal',
                                                  color: Colors.orangeAccent,),
                                                textAlign: TextAlign.center,

                                              ),
                                            ),
                                            const Padding(
                                              padding: EdgeInsets.symmetric(
                                                  vertical: 5.0),
                                              child: Text(
                                                'منسق',
                                                style: TextStyle(
                                                  fontFamily: 'Tajawal',
                                                  color: Colors.white,),
                                                textAlign: TextAlign.center,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                                      children: [
                                        Column(
                                          children: [
                                            PhysicalModel(
                                              shape: BoxShape.circle,
                                              color: Colors.grey.withOpacity(.6),
                                              elevation: 15,
                                              child: CircleAvatar(
                                                radius: size.height * .05,
                                                backgroundColor: Colors.grey.shade800,
                                                backgroundImage:
                                                const AssetImage('images/esra.jpg'),
                                              ),
                                            ),

                                            const Padding(
                                              padding: EdgeInsets.symmetric(
                                                  vertical: 8.0),
                                              child: Text(
                                                'إسراء الريس',
                                                style: TextStyle(
                                                  fontFamily: 'Tajawal',
                                                  color: Colors.orangeAccent,),
                                                textAlign: TextAlign.center,

                                              ),
                                            ),
                                            const Padding(
                                              padding: EdgeInsets.symmetric(
                                                  vertical: 5.0),
                                              child: Text(
                                                'منسق',
                                                style: TextStyle(
                                                  fontFamily: 'Tajawal',
                                                  color: Colors.white,),
                                                textAlign: TextAlign.center,
                                              ),
                                            ),
                                          ],
                                        ),
                                        Column(
                                          children: [
                                            PhysicalModel(
                                              shape: BoxShape.circle,
                                              color: Colors.grey.withOpacity(.6),
                                              elevation: 15,
                                              child: CircleAvatar(
                                                radius: size.height * .05,
                                                backgroundColor: Colors.grey.shade800,
                                                backgroundImage:
                                                const AssetImage('images/esra.jpg'),
                                              ),
                                            ),

                                            const Padding(
                                              padding: EdgeInsets.symmetric(
                                                  vertical: 8.0),
                                              child: Text(
                                                'إسراء الريس',
                                                style: TextStyle(
                                                  fontFamily: 'Tajawal',
                                                  color: Colors.orangeAccent,),
                                                textAlign: TextAlign.center,

                                              ),
                                            ),
                                            const Padding(
                                              padding: EdgeInsets.symmetric(
                                                  vertical: 5.0),
                                              child: Text(
                                                'منسق',
                                                style: TextStyle(
                                                  fontFamily: 'Tajawal',
                                                  color: Colors.white,),
                                                textAlign: TextAlign.center,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                );
              }
            },
          )
      )
    );
  }
}
