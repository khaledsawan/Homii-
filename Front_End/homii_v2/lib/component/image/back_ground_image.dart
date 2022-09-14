import 'package:flutter/material.dart';
class BackGroundImage extends StatelessWidget {
  String image;
  Widget widget;
  BackGroundImage({
    Key? key,
    required this.image,
    required this.widget,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          opacity: 0.25,
            image: AssetImage(image), fit: BoxFit.contain),
      ),
      child: widget,
    );
  }
}
