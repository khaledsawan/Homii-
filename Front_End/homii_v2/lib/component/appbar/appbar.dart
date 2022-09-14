import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sizer/sizer.dart';
import '../../utils/colors.dart';

AppBar appBar(
  IconData? icon,
  String tooltip,
  Function? fun,
  String title,
  IconData? icon2,
  Function? fun2,
) {
  return AppBar(
    backgroundColor: AppColors.mainColor,
    automaticallyImplyLeading: true,
    actions: <Widget>[
      SizedBox(
        width: 1.w,
      ),
      icon != Icons.adb
          ? IconButton(
              icon: Icon(
                icon,
                color: AppColors.white,
                size: 28,
              ),
              tooltip: tooltip,
              onPressed: () async {
                await fun!();
              },
            )
          : const SizedBox(),
      icon2 != Icons.adb
          ? Row(
              children: [
                IconButton(
                  icon: Icon(
                    icon2,
                    color: AppColors.white,
                    size: 28,
                  ),
                  tooltip: tooltip,
                  onPressed: () async {
                    await fun2!();
                  },
                ),
              ],
            )
          : const SizedBox()
    ],
    title: Title(
      title: '',
      color: AppColors.iconColor1,
      child: Center(
        child: Text(title,
            style: const TextStyle(
              fontSize: 24,
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.bold,
              color: AppColors.blue,
            )),
      ),
    ),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
          bottomRight: Radius.circular(20), bottomLeft: Radius.circular(20)),
    ),
    elevation: 4.0,
    systemOverlayStyle: SystemUiOverlayStyle.light,
    titleSpacing: 00.0,
    centerTitle: true,
    toolbarHeight: 50.0,
    toolbarOpacity: 0.8,
    // leading: IconButton(
    //   icon: const Icon(Icons.arrow_back),
    //   onPressed: () => Navigator.pop(context),
    // ),
  );
}
