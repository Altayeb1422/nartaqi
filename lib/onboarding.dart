import 'package:flutter/material.dart';
import 'home_screen.dart';

class Onboarding extends StatefulWidget {
  const Onboarding({Key? key}) : super(key: key);

  @override
  _OnboardingState createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  final _controller = PageController();

  int initialPage = 0;

  @override
  Widget build(BuildContext context) {
    _controller.addListener(() {
      setState(() {
        initialPage = _controller.page!.round();

      });
    });
    return Scaffold(
      body: PageView(
        controller: _controller,
        physics: const NeverScrollableScrollPhysics(),
        children: [
          Body(image: 'images/lib.jpg', title: 'المكتبة', subTitle: 'ليس بالخبز وحده يحيا الإنسان',onTap: (){
            _controller.nextPage(duration: const Duration(milliseconds: 200), curve: Curves.easeInCirc);
          }, value: (initialPage + 1) / (4 + 1),),
          Body(image: 'images/workshop.jpg', title: 'خدمات لغوية', subTitle: 'تدقيق لغوي وتحرير, تفريغ صوتي وبصري, ترجمة',onTap: (){
            _controller.nextPage(duration: const Duration(milliseconds: 200), curve: Curves.easeInCirc);
          },value: (initialPage + 1) / (4 + 1),),
          Body(image: 'images/Art.jpg', title: 'ورش الفنون', subTitle: 'الفن يمسح عن الروح غبار الحياة اليومي ',onTap: (){
            _controller.nextPage(duration: const Duration(milliseconds: 200), curve: Curves.easeInCirc);
          },value: (initialPage + 1) / (4 + 1),),
          Body(image: 'images/music.jpg', title: 'ورش الموسيقي', subTitle: 'لولا الموسيقي لكانت الحياة غلطة',onTap: (){
            _controller.nextPage(duration: const Duration(milliseconds: 200), curve: Curves.easeInCirc);
          }, value: (initialPage + 1) / (4 + 1),),
          const HomeScreen(),
        ],
      )
    ,);
  }
}

class Body extends StatelessWidget {
  const Body({Key? key, required this.image, required this.title, required this.subTitle, required this.onTap, required this.value}) : super(key: key);
 final String image;
 final String title;
 final String subTitle;
 final VoidCallback onTap;
 final double value;
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Stack(
      children: [
        Container(
          height: double.infinity,
          width: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(image), fit: BoxFit.fill,),
          ),
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.bottomRight,
                  colors: [
                    Colors.black.withOpacity(.7),
                    Colors.black.withOpacity(.3),
                  ]
              ,),
            ),
          ),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Center(
              child: Column(
                children: [
                  Text(
                    title,
                    textAlign: TextAlign.center,
                    textDirection: TextDirection.rtl,
                    style: const TextStyle(
                        fontFamily: 'Tajawal',
                        color: Colors.white,
                        fontSize: 21,
                        fontWeight: FontWeight.bold
                    ,),
                  ),
                  const SizedBox(height: 16,),
                  Text(
                    subTitle,
                    textAlign: TextAlign.center,
                    textDirection: TextDirection.rtl,
                    style: const TextStyle(
                        fontFamily: 'Tajawal',
                        color: Colors.grey,
                        fontSize: 15,
                        fontWeight: FontWeight.bold
                    ,),
                  ),
                ],
              ),
            ),
            SizedBox(height: size.height * .1,),
            SizedBox(
              height: 80,
              width: 80,
              child: Stack(
                children: [
                  Align(
                    child: SizedBox(
                      height: 80,
                      width: 80,
                      child: CircularProgressIndicator(
                        value: value,
                        valueColor:const AlwaysStoppedAnimation(Colors.orangeAccent),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: onTap,
                    child: Align(
                      child: Container(
                        height: 65,
                        width: 65,
                        decoration: const BoxDecoration(
                          color: Colors.orangeAccent,
                          borderRadius: BorderRadius.all(Radius.circular(100)),
                        ),
                        child: const Icon(Icons.arrow_forward_ios, color: Colors.white,),
                      ),
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(height: 20,),
            Padding(
              padding: const EdgeInsets.only(bottom: 30.0),
              child: InkWell(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> const HomeScreen()));
                },
                child: const Text('تخطي', textAlign: TextAlign.center,
                  textDirection: TextDirection.rtl,
                  style: TextStyle(
                      fontFamily: 'Tajawal',
                      color: Colors.grey,
                      fontSize: 18,
                      fontWeight: FontWeight.bold
                  ,),),
              ),
            )
          ],
        )
      ],
    );
  }
}
