import 'package:flutter/material.dart';
import '../../utils/colors.dart';
import 'big_text.dart';

class TextInContainer extends StatelessWidget {
  Color? backgroundColor;
  Color? textColor;
  Color? borderColor;
  double? height;
  double? textHeight;
  double? border;
  IconData? icon;
  double? width;
  double? textSize;
  int? maxLine;
  String text;
  bool isCenter;
  TextInContainer({
    Key? key,
    this.backgroundColor = AppColors.white,
    this.textSize,
    this.width = 100,
    this.icon =Icons.adb,
    this.height = 30,
    this.border = 1,
    this.textHeight = 1.2,
    this.isCenter = false,
    this.textColor = AppColors.textColor,
    this.borderColor = AppColors.searchColor,
    required this.text,
    this.maxLine = 1,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          alignment:isCenter? Alignment.center:null,
          padding: const EdgeInsets.all(4),
          width: width,
          height: height,
          decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: const BorderRadius.all(Radius.circular(10)),
            border: Border.all(width: border!, color: borderColor!),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 10,
                spreadRadius: 2,
              ),
            ],
          ),
          child: BigText(
            height: textHeight,
            maxLine: maxLine,
            textBody: text,
            color: textColor,
            size: textSize,
          )
          ,
        ),
        Positioned(child:icon==Icons.adb?Container(): Container(   padding: const EdgeInsets.all(4),child: Icon(icon,color: AppColors.mainColor,size: 28,)))
      ],
    );
  }
}
