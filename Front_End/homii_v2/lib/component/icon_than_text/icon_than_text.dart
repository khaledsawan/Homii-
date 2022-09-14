import 'package:flutter/material.dart';
import '../../utils/colors.dart';
import '../App_Icons/app_icons.dart';
import '../text/big_text.dart';

class IconThanText extends StatelessWidget {
  IconData icon;
  double? width;
  double? iconSize;
  double? sizedWidth;
  double? leftPadding;
  double? height;
  EdgeInsets? margin;
  EdgeInsets? padding;
  int? maxLine;
  Color color;
  Color textColor;
  Color? iconColor;
  String text;
  IconThanText(
      {Key? key,
      this.width,
      this.height,
      this.iconSize=27,
      this.sizedWidth=15,
      this.iconColor=AppColors.mainColor,
      this.margin=const EdgeInsets.only(left: 15,right: 15),
      this.padding=const EdgeInsets.only(left: 10, right: 10, top: 5, bottom: 5),
      this.maxLine,
      required this.icon,
      required this.text,
      required this.color,
      this.textColor = Colors.black54})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      margin: margin,
      padding:  padding,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: AppColors.mainColor),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
                color: Colors.grey[300]!,
                blurRadius: 8,
                spreadRadius: 2,
                offset: const Offset(0, 4),
                blurStyle: BlurStyle.normal)
          ]),
      child: Row(
        // mainAxisAlignment: MainAxisAlignment.start,
        // crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppIcons(
            icon: icon,
            containerSize: 40,
            iconSize: iconSize!,
            backgruondcolor: color,
            iconColor: iconColor!,
          ),
           SizedBox(
            width: sizedWidth,
          ),
          BigText(
            maxLine: maxLine,
            textBody: text,
            color: textColor,
          ),
        ],
      ),
    );
  }
}
