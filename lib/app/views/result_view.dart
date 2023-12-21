import 'dart:math';

import 'package:bmi_calculator/app/constans/colors/app_colors.dart';
import 'package:bmi_calculator/app/data/local_data/bmi_calculate_data.dart';
import 'package:bmi_calculator/app/text_style/app_text_style.dart';
import 'package:bmi_calculator/app/views/home_view.dart';
import 'package:flutter/material.dart';

class ResultView extends StatelessWidget {
  const ResultView({
    Key? key,
    required this.weightFirstView,
    required this.heightFirstView,
  }) : super(key: key);
  final int? weightFirstView;
  final double? heightFirstView;
  double bmiCalculate() {
    // final bmi = weightFirstView / (heightFirstView * heightFirstView);
    final bmi = weightFirstView! / pow(heightFirstView! / 100, 2);
    return bmi;
  }

  static String bmiResult(double bmi) {
    if (bmi >= 25) {
      return "Overweight";
    } else if (bmi > 18.5) {
      return "Normal";
    } else if (bmi < 18.5) {
      return "Underweight";
    }
    return "";
  }

  static String giveDescription(double bmiJoop) {
    if (bmiJoop >= 25) {
      return 'You need to lose weight';
    } else if (bmiJoop >= 18.5) {
      return 'Normal, follow this pattern';
    } else if (bmiJoop <= 18.5) {
      return 'You need to gain weight!';
    }
    return '';
  }

  @override
  Widget build(BuildContext context) {
    final bmi = bmiCalculate();
    return Scaffold(
        backgroundColor: AppColors.secondarycolor,
        appBar: AppBar(
          backgroundColor: AppColors.female,
          title: Center(child: Text('Health index   (BMI)')),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 120,
              ),
              Center(
                child: Text('Result', style: AppTextStyle.white40w700),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: AppColors.maincolor),
                width: 380,
                height: 380,
                child: Column(
                  children: [
                    SizedBox(
                      height: 60,
                    ),
                    Text(
                      bmiResult(bmi),
                      style: TextStyle(color: AppColors.green, fontSize: 30),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Text(
                      bmi.toStringAsFixed(1),
                      style: AppTextStyle.white40w700,
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Text(
                      '${giveDescription(bmi)} ',
                      style: AppTextStyle.white22w500,
                    )
                  ],
                ),
              )
            ],
          ),
        ),
        bottomNavigationBar: calculate_widget(
          text: ('COUNT AGAIN'),
          bas: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => HomeView()));
          },
        ));
  }
}
