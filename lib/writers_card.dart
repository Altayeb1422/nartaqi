import 'package:flutter/material.dart';
import 'package:nartaqi/writers_class.dart';

class WriterCard extends StatelessWidget {
  const WriterCard({Key? key, required this.onTap, required this.writer})
      : super(key: key);
  final VoidCallback onTap;
  final Writer writer;
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          height: size.height * .32,
          width: size.width * .6,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(
              Radius.circular(20),
            ),
          ),
          child: Stack(
            children: [
              Container(
                height: size.height,
                width: size.width,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(writer.iconimage),
                    fit: BoxFit.fill,
                  ),
                  borderRadius: const BorderRadius.all(
                    Radius.circular(20),
                  ),
                ),
              ),
              Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.bottomRight,
                    colors: [
                      Colors.black,
                      Colors.black12,
                    ],
                  ),
                  borderRadius: BorderRadius.all(
                    Radius.circular(20),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 15.0),
                child: Container(
                  alignment: Alignment.bottomCenter,
                    child: Text(
                  writer.name,
                  textDirection: TextDirection.rtl,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      color: Colors.white, fontFamily: 'Tajawal', fontSize: 16),
                )),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child:   PhysicalModel(
                      shape: BoxShape.circle,
                      color: Colors.grey.withOpacity(.5),
                      elevation: 10,
                      child: CircleAvatar(
                        radius: size.height * .03,
                        backgroundColor: Colors.orangeAccent,
                        child: Text(writer.cv, textAlign: TextAlign.center, style: TextStyle(
                            fontFamily: 'Tajawal',
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Colors.black
                        ),),
                      ),
                    )
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
