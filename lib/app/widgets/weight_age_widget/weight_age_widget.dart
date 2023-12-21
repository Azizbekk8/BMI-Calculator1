import 'package:bmi_calculator/app/constans/colors/app_colors.dart';
import 'package:bmi_calculator/app/text_style/app_text_style.dart';
import 'package:flutter/material.dart';

class WeightAgeWidget extends StatelessWidget {
  const WeightAgeWidget({
    Key? key,
    this.text,
    this.weightAge,
    this. minusknopka,
    this.plusknopka,
  }) : super(key: key);
  final String? text;
  final String? weightAge;
  final Function()? minusknopka;
  final Function()? plusknopka;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: AppColors.maincolor,
      ),
      height: 215,
      width: 174,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            weightAge!.toUpperCase(),
            style: AppTextStyle.white22w500,
          ),
          Text(
            text.toString(),
            style: AppTextStyle.white40w700,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: minusknopka,
                child: Icon(
                  Icons.remove,
                  size: 40,
                ),
                style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.iconcolor,
                    shape: const CircleBorder(),
                    padding: const EdgeInsets.all(6)),
              ),
              SizedBox(
                width: 15,
              ),
              ElevatedButton(
                onPressed: plusknopka,
                child: Icon(
                  Icons.add,
                  size: 40,
                ),
                style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.iconcolor,
                    shape: const CircleBorder(),
                    padding: const EdgeInsets.all(6)),
              ),
            ],
          )
        ],
      ),
    );
    ;
  }
}
