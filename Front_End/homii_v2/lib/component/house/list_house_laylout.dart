import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:homii_v2/component/icon_than_text/icon_than_text.dart';
import 'package:homii_v2/component/image/image_in_container.dart';
import '../../utils/colors.dart';

class ListHouseLayout extends StatelessWidget {
  const ListHouseLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = Get.width;
    double height = Get.height;
    return Container(
      margin: const EdgeInsets.fromLTRB(0, 16, 0, 0),
      decoration: const BoxDecoration(
        color: AppColors.white,
      ),
      child: Column(
        children: [
          ImageInContainer(
              height: height * 0.33, width: width, image: 'images/me.jpg'),
          IconThanText(
              sizedWidth: 0,
              padding: const EdgeInsets.only(left: 2),
              margin: const EdgeInsets.only(left: 4, right: 4),
              icon: Icons.location_on,
              text: 'Syria Damascus muzzy MTN',
              color: AppColors.white),
          const SizedBox(
            height: 4,
          ),
          Row(
            children: [
              SizedBox(
                width: width * 0.333,
                child: IconThanText(
                    padding: const EdgeInsets.only(left: 2),
                    sizedWidth: 0,
                    margin: const EdgeInsets.only(left: 4, right: 4),
                    icon: Icons.money,
                    text: '300\$',
                    color: AppColors.white),
              ),
              SizedBox(
                width: width * 0.66,
                child: IconThanText(
                    padding: const EdgeInsets.only(left: 2),
                    sizedWidth: 0,
                    icon: Icons.bed,
                    margin: const EdgeInsets.only(left: 4, right: 4),
                    text: 'rooms and bath room 4',
                    color: AppColors.white),
              ),
            ],
          ),
          const Divider(),
        ],
      ),
    );
  }
}
