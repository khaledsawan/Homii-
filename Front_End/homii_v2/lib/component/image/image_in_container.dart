import '../../utils/colors.dart';
import 'package:flutter/material.dart';

class ImageInContainer extends StatelessWidget {
  Color? backgroundColor;
  Color borderColor;
  double? height;
  double? width;
  double border;
  String image;

  ImageInContainer({
    Key? key,
    this.backgroundColor = AppColors.white,
    this.borderColor = AppColors.searchColor,
    required this.image,
    this.width = 100,
    this.height = 30,
     this.border = 1.0,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      margin: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: const BorderRadius.all(Radius.circular(10)),
        image: DecorationImage(image: AssetImage(image),fit: BoxFit.fill),
        border: Border.all(width: border, color: borderColor),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            spreadRadius: 2,
          ),
        ],
      ),
    );
  }
}
