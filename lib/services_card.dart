import 'package:flutter/material.dart';
import 'services_class.dart';


class ServicesCard extends StatelessWidget {
  const ServicesCard({Key? key, required this.services, required this.onTap}) : super(key: key);
  final Services services;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: size.height * .32,
        width: size.width * .6,
        decoration: const BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.all(Radius.circular(20),
          ),
        ),
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
              child: Container(
                height: size.height * .32,
                width: size.width * .6,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(services.cover),fit: BoxFit.fill,),
                  borderRadius: const BorderRadius.all(Radius.circular(20),
                  ),
                ),
              ),
            ),

            Container(
              decoration: const BoxDecoration(
                gradient:
                LinearGradient(begin: Alignment.bottomRight, colors: [
                  Colors.black,
                  Colors.black12,
                ],),
                borderRadius: BorderRadius.all(Radius.circular(20),
                ),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Center(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical:15.0, horizontal: 5),
                    child: Text(services.title,textDirection: TextDirection.rtl, textAlign: TextAlign.center, style: const TextStyle(color: Colors.white,fontFamily: 'Tajawal',fontSize: 16),),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
