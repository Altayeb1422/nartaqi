import 'package:flutter/material.dart';
import 'package:nartaqi/categories_class.dart';


class CategoriesCard extends StatelessWidget {
  const CategoriesCard({Key? key, required this.onTap, required this.categories})
      : super(key: key);
  final VoidCallback onTap;
  final Categories categories;
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          height: size.height * .32,
          width: size.width * .58,
          decoration: const BoxDecoration(
            color: Colors.transparent,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
              bottomRight: Radius.circular(20),
              bottomLeft: Radius.circular(20),
            ),
          ),
          child: Stack(
            children: [
              Container(
                alignment: Alignment.topCenter,
                height: size.height,
                width: size.width ,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(categories.cover), fit: BoxFit.cover,),
                  borderRadius: const BorderRadius.all(Radius.circular(20),
                  ),
                ),
              ),

              Container(
                decoration: BoxDecoration(
                  gradient:
                  LinearGradient(begin: Alignment.bottomRight, colors: [
                    Colors.black,
                    Colors.black.withOpacity(.3),
                  ],),
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                    bottomRight: Radius.circular(20),
                    bottomLeft: Radius.circular(20),
                  ),
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 18.0),
                      child: Container(
                        decoration: BoxDecoration( color: Colors.orangeAccent,
                            borderRadius: const BorderRadius.all(Radius.circular(5)),
                            boxShadow: [BoxShadow(
                                color: Colors.grey.withOpacity(0.4),
                                offset: const Offset(0,4),
                                blurRadius: 3.0
                            ,)],),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical:5.0, horizontal: 5),
                          child: Text(categories.catName,textDirection: TextDirection.rtl, textAlign: TextAlign.center, style: const TextStyle(color: Colors.black,fontFamily: 'Tajawal',fontSize: 15),),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
