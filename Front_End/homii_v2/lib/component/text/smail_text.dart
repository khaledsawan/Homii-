import 'package:flutter/material.dart';

class SmailText extends StatelessWidget {
  final String textBody;
  Color? color;
  double? size;
  int? maxLine;
  double? height;

  SmailText(
      {Key? key,
      required this.textBody,
      this.color = const Color(0xFF89dad0),
      this.size = 12,
      this.maxLine = 1,
      this.height=0.6})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Text(
      textBody,
      maxLines: maxLine,

      style: TextStyle(
        fontFamily: 'Roboto',
        fontSize: size,
        height: height,
        fontWeight: FontWeight.w400,
        color: color,
      ),
    );
  }
}
