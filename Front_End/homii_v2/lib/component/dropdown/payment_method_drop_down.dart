import 'package:flutter/material.dart';
import 'package:homii_v2/component/image/image_in_container.dart';
import 'package:homii_v2/utils/colors.dart';

import '../../model/payment_model.dart';

class PaymentMethodDropDown extends StatelessWidget {
  dynamic controller;
  PaymentMethodDropDown({Key? key, required this.controller}) : super(key: key);

  String dropDownValue = 'Item 1';
  List<Payment> payment = [
    Payment(name: 'MTN', image: 'images/MTN-logo.jpg', colors: AppColors.mtn),
    Payment(
        name: 'syratel',
        image: 'images/syriatel.jpg',
        colors: AppColors.syriatel),
    Payment(name: 'Cash', image: 'images/cash.png', colors: AppColors.cash),
    Payment(
        name: 'paypal',
        image: 'images/paypal-logo.jpg',
        colors: AppColors.dropBackGround),
  ];

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return DropdownButton<Payment>(
      icon: const Icon(Icons.keyboard_arrow_down),
      iconSize: 35,
      underline: Container(
        height: 2,
        color: AppColors.innerShadow,
      ),
      itemHeight: 65,
      hint: Ink(
        child: Container(
          margin: const EdgeInsets.fromLTRB(2,0,2,12),
          height: 100,
          width:175,
          decoration: BoxDecoration(
            color: controller.paymentMethod.colors,
            border: Border.all(width: 1, color: AppColors.blue),
            borderRadius: BorderRadius.circular(6),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              ImageInContainer(
                backgroundColor:controller.paymentMethod.colors ,
                height: 70,
                image: controller.paymentMethod.image,
                width: 75,
              ),
              const SizedBox(width: 20,),
              Text(
                controller.paymentMethod.name,
                style: const TextStyle(
                    color: AppColors.textColor, fontSize: 22),
              ),
            ],
          ),
        ),
      ),
      items: payment.map((payment) {
        return DropdownMenuItem<Payment>(
          alignment: Alignment.center,
          value: payment,
          child: Ink(
            child: Container(
              margin: const EdgeInsets.all(4),
              height: 100,
              width:170,
              decoration: BoxDecoration(
                color: payment.colors,
                border: Border.all(width: 1, color: AppColors.blue),
                borderRadius: BorderRadius.circular(6),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  ImageInContainer(
                    backgroundColor:controller.paymentMethod.colors ,
                    height: 70,
                    image: payment.image,
                    width: 75,
                  ),
                  const SizedBox(width: 20,),
                  Text(
                    payment.name,
                    style: const TextStyle(
                        color: AppColors.textColor, fontSize: 22),
                  ),
                ],
              ),
            ),
          ),
        );
      }).toList(),
      onChanged: (Payment? newValue) {
           controller.setMethod(newValue);
      },
    );
  }
}
