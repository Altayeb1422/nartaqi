import 'package:flutter/material.dart';
import 'package:nartaqi/writers_class.dart';

import 'constants.dart';

class WriterCardWriter extends StatelessWidget {
  const WriterCardWriter({Key? key,  required this.writer}) : super(key: key);
  final Writer writer;
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Center(
              child: PhysicalModel(
                shape: BoxShape.circle,
                color: Colors.black.withOpacity(.5),
                elevation: 10,
                child: CircleAvatar(
                  radius: size.height * .1,
                  backgroundColor: Colors.black.withOpacity(0.4),
                  backgroundImage: AssetImage(writer.iconimage),
                ),
              ),
            ),
            SizedBox(height: 10,),
            Text(writer.name,textAlign: TextAlign.center, style: kPageTitleStyle,),
            SizedBox(height: 10,),
            Container(
              decoration: BoxDecoration(
                color: Colors.orangeAccent,
                borderRadius:
                const BorderRadius.all(Radius.circular(5)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.4),
                    offset: const Offset(0, 4),
                    blurRadius: 3.0,
                  )
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 3.0,
                  horizontal: 5,
                ),
                child: Text(
                  writer.cv,
                  textDirection: TextDirection.rtl,
                  style: const TextStyle(
                    color: Colors.black,
                    fontFamily: 'Tajawal',
                  ),
                ),
              ),
            ),
          ],
        )
    ,);
  }
}
