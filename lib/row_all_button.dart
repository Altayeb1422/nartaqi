import 'package:flutter/material.dart';

import 'constants.dart';

class AllBtn extends StatelessWidget {
  const AllBtn({
    Key? key, required this.onPressed,
  }) : super(key: key);

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(onPressed: onPressed,
      style: TextButton.styleFrom(
          backgroundColor: Colors.transparent,
          shadowColor:Colors.transparent ,
          shape:  RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),)
      ,), child: const Text(
      'عرض الكل',
      style: kBtnStyle,
      textAlign: TextAlign.center,
    ),);
  }
}
