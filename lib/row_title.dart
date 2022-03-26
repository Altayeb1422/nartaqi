import 'package:flutter/material.dart';

import 'constants.dart';


class RowTitle extends StatelessWidget {
  const RowTitle({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: kHomeScreenTextStyle,

    );
  }
}
