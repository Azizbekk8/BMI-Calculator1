// ignore_for_file: unused_import

import 'package:bmi_calculator/app/constans/colors/app_colors.dart';
import 'package:bmi_calculator/app/enums/gender_enum.dart';
import 'package:bmi_calculator/app/text_style/app_text_style.dart';
import 'package:bmi_calculator/app/views/result_view.dart';
import 'package:bmi_calculator/app/widgets/gender_widget.dart';
import 'package:bmi_calculator/app/widgets/weight_age_widget/weight_age_widget.dart';
import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  bool tustuOzgort = false;
  double humanTypedValue = 60;
  int weight = 45;
  int age = 20;
  Color male = AppColors.maincolor;
  Color female = AppColors.maincolor;

  void chooseGender(GenderEnum genderChoice) {
    if (genderChoice == GenderEnum.male) {
      setState(() {
        male = AppColors.blue;
        female = AppColors.maincolor;
      });
    } else if (genderChoice == GenderEnum.female) {
      setState(() {
        female = AppColors.female;
        male = AppColors.maincolor;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.secondarycolor,
      appBar: AppBar(
        centerTitle: true,
        elevation: 0.0,
        backgroundColor: AppColors.secondarycolor,
        title: Text('BMI CAlCULATOR', style: AppTextStyle.white22w500),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: GenderWidget(
                      onTap: () {
                        chooseGender(GenderEnum.male);
                      },
                      gender: Icons.male,
                      genderTitle: 'Male',
                      borderRadius: 20,
                      tus: male,
                    ),
                  ),
                  SizedBox(width: 30),
                  Expanded(
                    child: GenderWidget(
                      onTap: () {
                        chooseGender(GenderEnum.female);
                      },
                      gender: Icons.female,
                      genderTitle: 'Female',
                      tus: female,
                      borderRadius: 20,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: AppColors.maincolor),
                height: 170,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Height'.toUpperCase(),
                      style: AppTextStyle.white30,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        Text(
                          humanTypedValue.toStringAsFixed(0),
                          style: AppTextStyle.white40w700,
                        ),
                        Text(
                          'cm',
                          style: AppTextStyle.white22w500,
                        )
                      ],
                    ),
                    Slider(
                        max: 210,
                        min: 50,
                        activeColor: AppColors.female,
                        inactiveColor: Colors.grey,
                        value: humanTypedValue,
                        onChanged: (value) {
                          humanTypedValue = value;
                          setState(() {});
                        })
                  ],
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Row(
                children: [
                  Expanded(
                      child: WeightAgeWidget(
                    weightAge: ' weight',
                    text: weight.toString(),
                    minusknopka: () {
                      weight--;
                      setState(() {});
                    },
                    plusknopka: () {
                      weight++;
                      setState(() {});
                    },
                  )),
                  SizedBox(
                    width: 30,
                  ),
                  Expanded(
                      child: WeightAgeWidget(
                    weightAge: 'age',
                    text: age.toString(),
                    minusknopka: () {
                      age--;
                      setState(() {});
                    },
                    plusknopka: () {
                      age++;
                      setState(() {});
                    },
                  )),
                ],
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: calculate_widget(
        text: ('CALCULATOR'),
        bas: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => ResultView(
                        weightFirstView: weight,
                        heightFirstView: humanTypedValue,
                      )));
        },
      ),
    );
  }
}

class calculate_widget extends StatelessWidget {
  const calculate_widget({
    super.key,
    this.text,
    this.bas,
  });
  final String? text;
  final Function()? bas;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: bas,
      child: Container(
        width: double.infinity,
        height: 70,
        color: AppColors.female,
        child: Center(
          child: Text(
            text!,
            style: TextStyle(
              fontSize: 38,
              color: AppColors.white,
            ),
          ),
        ),
      ),
    );
  }
}
