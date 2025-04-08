import 'package:bmi_calculator/calculator.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'icon_details.dart';
import 'reusable_card.dart';
import 'constants.dart';
import 'result_page.dart';
import 'bottomButtonWidget.dart';
import 'calculator.dart';

class InputPage extends StatefulWidget {
  const InputPage({super.key});

  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  int selectedGender = 0; // 0 = none, 1 = male, 2 = female
  int height = 180;
  int weight = 65;

  int age = 20;

  void changeColor(int gender) {
    setState(() {
      selectedGender = gender;
    });
  }

  void genderChange() {
    if (selectedGender == kMale) {}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'BMI CALCULATOR',
          style: TextStyle(),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      changeColor(kMale);
                    },
                    child: ReusableCard(
                      cardChild: IconDetails(
                        icon: FontAwesomeIcons.mars,
                        label: 'MALE',
                      ),
                      kolor: selectedGender == kMale
                          ? kInactiveContainerColor
                          : kReusableCardColor,
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      changeColor(kFemale);
                    },
                    child: ReusableCard(
                      cardChild: IconDetails(
                        icon: FontAwesomeIcons.venus,
                        label: 'FEMALE',
                      ),
                      kolor: selectedGender == kFemale
                          ? kInactiveContainerColor
                          : kReusableCardColor,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ReusableCard(
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    'HEIGHT',
                    style: kTextStyle,
                    textAlign: TextAlign.center,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(
                        height.toString(),
                        style: kNumberstyle,
                      ),
                      Text('Cm'),
                    ],
                  ),
                  SliderTheme(
                    data: SliderThemeData(
                      thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15),
                      overlayShape: RoundSliderOverlayShape(overlayRadius: 25),
                    ),
                    child: Slider(
                      value: height.toDouble(),
                      min: 110,
                      max: 215,
                      activeColor: Color(0xFFEB1555),
                      inactiveColor: Color(0xFF8D8E98),
                      onChanged: (double newValue) {
                        setState(() {
                          height = newValue.round();
                        });
                      },
                    ),
                  ),
                ],
              ),
              kolor: kReusableCardColor,
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'WEIGHT',
                          style: kTextStyle,
                        ),
                        Text(
                          weight.toString(),
                          style: kNumberstyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIconButton(
                              icon: FontAwesomeIcons.minus,
                              onPressed: () {
                                setState(() {
                                  weight--;
                                });
                              },
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            RoundIconButton(
                              icon: FontAwesomeIcons.plus,
                              onPressed: () {
                                setState(() {
                                  weight++;
                                });
                              },
                            ),
                          ],
                        )
                      ],
                    ),
                    kolor: kReusableCardColor,
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'AGE',
                          style: kTextStyle,
                        ),
                        Text(
                          age.toString(),
                          style: kNumberstyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIconButton(
                                icon: FontAwesomeIcons.minus,
                                onPressed: () {
                                  setState(() {
                                    age--;
                                  });
                                }),
                            SizedBox(
                              width: 10,
                            ),
                            RoundIconButton(
                                icon: FontAwesomeIcons.plus,
                                onPressed: () {
                                  setState(() {
                                    age++;
                                  });
                                })
                          ],
                        )
                      ],
                    ),
                    kolor: kReusableCardColor,
                  ),
                ),
              ],
            ),
          ),
          BottomContainerWidget(
            ButtonName: 'CALCULATE',
            onpressed: (){

              Calculator calc=Calculator(weight: weight, height: height);
              Navigator.push(context, MaterialPageRoute(builder: (context)=>ResultPage(
                actualBMIresultvalue: calc.calculateBMI(),
                BMIResult: calc.getResult(),
                Interpretation: calc.getInterpretation(),
              )));
            },
          )
        ],
      ),
    );
  }
}



class RoundIconButton extends StatelessWidget {
  RoundIconButton({required this.icon, required this.onPressed});
  final IconData icon;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: Icon(icon),
      onPressed: onPressed,
      elevation: 6,
      shape: CircleBorder(),
      fillColor: Color(0xFF4C4F5E),
      constraints: BoxConstraints.tightFor(
        height: 56,
        width: 56,
      ),
    );
  }
}
