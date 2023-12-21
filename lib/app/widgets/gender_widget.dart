import 'package:bmi_calculator/app/constans/colors/app_colors.dart';
import 'package:bmi_calculator/app/text_style/app_text_style.dart';
import 'package:flutter/material.dart';

class GenderWidget extends StatelessWidget {
  const GenderWidget({
    super.key,
    required this.gender,
    this.genderTitle,
    this.vertical = 40,
    this.borderRadius = 20,
    this.onTap,
    this.tus,
  });
  final IconData? gender;
  final String? genderTitle;
  final double? vertical;
  final double? borderRadius;
  final Function()? onTap;
  final Color? tus;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(borderRadius!),
          color: tus,
        ),
        //margin: EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.22),
        // width: 150,
        // height: 177,
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: vertical!),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                gender,
                size: 100,
                color: AppColors.white,
              ),
              Text(
                genderTitle!.toUpperCase(),
                style: AppTextStyle.white25,
              )
            ],
          ),
        ),
      ),
    );
  }
}
