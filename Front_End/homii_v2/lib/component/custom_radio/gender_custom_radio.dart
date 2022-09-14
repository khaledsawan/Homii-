import 'package:flutter/material.dart';
import '../../model/gender.dart';
import '../../utils/colors.dart';

class GenderCustomRadio extends StatelessWidget {
  final Gender _gender;

  bool isRow;
  double? width;
   GenderCustomRadio(this.isRow,this._gender, {Key? key,this.width=50}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
        margin: const EdgeInsets.only(right: 10),
        color: _gender.isSelected ? AppColors.mainColor : Colors.white,
        child: Column(
          children: [
            Container(
             // padding: EdgeInsets.all(4),
              width: width,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(4),
                  border: Border.all(width: 1, color: AppColors.white),
                  boxShadow: [
                    BoxShadow(
                        color:_gender.isSelected ?AppColors.mainColor: Colors.grey[400]!,
                        blurRadius: 4,
                        spreadRadius:1,
                        offset: const Offset(0, 4),
                        blurStyle: BlurStyle.normal)
                  ]),
              child:isRow? Row(mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Icon(
                    _gender.icon,
                    color: _gender.isSelected ?AppColors.mainColor : Colors.grey,
                    size: 26,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    _gender.name,
                    style: TextStyle(
                        color: _gender.isSelected ? AppColors.mainColor : Colors.grey),
                  )
                ],
              ):Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Icon(
                    _gender.icon,
                    color: _gender.isSelected ?AppColors.mainColor : Colors.grey,
                    size: 24,
                  ),
                  const SizedBox(height: 6),
                  Text(
                    _gender.name,
                    style: TextStyle(
                        color: _gender.isSelected ? AppColors.mainColor : Colors.grey),
                  )
                ],
              ),
            ),
          ],
        ));
  }
}
