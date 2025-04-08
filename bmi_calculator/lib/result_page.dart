import 'package:bmi_calculator/constants.dart';
import 'package:bmi_calculator/input_page.dart';
import 'package:bmi_calculator/reusable_card.dart';
import 'package:flutter/material.dart';
import 'bottomButtonWidget.dart';

class ResultPage extends StatelessWidget {
  final String BMIResult;
  final String actualBMIresultvalue;
  final String Interpretation;
  ResultPage({required this.actualBMIresultvalue,required this.BMIResult,required this.Interpretation});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('BMI CALCULATOR'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
                child: Container(
                  padding: EdgeInsets.all(15),
                  alignment: Alignment.bottomLeft,
                  child: Text(
                                'Your Result',
                                style: kResultPageTitleTextStyle,
                              ),
                )),
            Expanded(
              flex: 5,
              child: ReusableCard(
                kolor: Color(0xFF1d1f33),
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,

                  children: [
                    Text(
                      BMIResult,
                      style: kNormalTextStyle,
                    ),
                    
                    Text(actualBMIresultvalue,style: klargeTextSize,),
                    
                    Text(Interpretation,style: kResultpageNormalTextStyle,textAlign: TextAlign.center,),
                  ],
                ),
              ),
            ),

            BottomContainerWidget(ButtonName: 'Re-Calculate', onpressed: Navigator.of(context).pop)
          ],
        ));
  }
}
