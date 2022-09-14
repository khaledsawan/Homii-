import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_typedefs/rx_typedefs.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:homii_v2/utils/colors.dart';


class CustomButton extends StatelessWidget {
  late Callback? onPressed;
  late String buttonText;
  late double? width;
  late double? height;
  late double? fontSize;
  late double radius;
  late IconData? icon;
  late EdgeInsets? margin;
  late EdgeInsets? padding;
  late bool transparent;

  CustomButton(
      {Key? key,
      required this.buttonText,
      this.onPressed,
      this.width=50,
      this.height=50,
      this.fontSize,
      this.icon,
      this.margin,
      this.padding,
      this.transparent = false,
      this.radius = 5})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        onPressed!();
      },
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: AppColors.white,
          border: Border.all(width: 1,color: AppColors.white),
              borderRadius: BorderRadius.circular(radius),
            boxShadow:  [
              BoxShadow(
                  color: Colors.grey[400]!,
                  blurRadius: 6,
                  spreadRadius:1,
                 // offset:  const Offset(0, 4),
                  blurStyle: BlurStyle.normal)
            ]
        ),
        child: Center(
          child: Text(buttonText,style: GoogleFonts.roboto(
            color: AppColors.textColor,
            fontWeight: FontWeight.bold,fontStyle: FontStyle.italic,fontSize:fontSize
          ),),
        )    ),
    );
  }
}
