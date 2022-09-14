import 'package:flutter/material.dart';
import 'package:homii_v2/utils/colors.dart';

class BigText extends StatelessWidget {
  final String textBody;
  Color? color;
  double? size;
  FontWeight? fontWeight;
  double? height;
  int? maxLine;
  TextOverflow textOverflow;
  BigText(
      {Key? key,
      required this.textBody,
      this.color = AppColors.textColor,
      this.maxLine = 2,
      this.textOverflow = TextOverflow.ellipsis,
      this.height = 1.2,
      this.fontWeight = FontWeight.w400,
      this.size = 20})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Text(
        textBody,
        maxLines: maxLine,
        style: TextStyle(
          fontFamily: 'Roboto',
          fontSize: size,
          height: height,
          fontWeight: fontWeight,
          color: color,
        ),
        overflow: textOverflow,
      ),
    );
  }
}
