import 'package:bmi_app/screens/result_showing_screen.dart';
import 'package:bmi_app/widgets/round_icon_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:bmi_app/widgets/gender_icon_content.dart';
import 'package:bmi_app/widgets/reusablecard_content.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:bmi_app/constants/constants.dart';
import 'package:bmi_app/logic/calculate_logic.dart';

import '../widgets/bottom_button.dart';

enum Gender { male, female }

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  Gender? selectedGender;
  int userHeight = 180;
  int userWeight = 70;
  int userAge = 20;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF0A0E21),
        title: Text(
          'BMI CALCULATOR',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    onPress: () {
                      setState(() {
                        selectedGender = Gender.male;
                      });
                    },
                    colour: selectedGender == Gender.male
                        ? kActiveCardColour
                        : kInactiveCardColour,
                    cardChild: IconContent(
                      iconToShow: FontAwesomeIcons.male,
                      labelToShow: 'MALE',
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    onPress: () {
                      setState(() {
                        selectedGender = Gender.female;
                      });
                    },
                    colour: selectedGender == Gender.female
                        ? kActiveCardColour
                        : kInactiveCardColour,
                    cardChild: IconContent(
                      iconToShow: FontAwesomeIcons.female,
                      labelToShow: 'FEMALE',
                    ),
                  ),
                )
              ],
            ),
          ),

          Expanded(
            child: ReusableCard(
              colour: kActiveCardColour,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'HEIGHT',
                    style: kLabelTextStyle,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(userHeight.toString(), style: kNumberTextStyle),
                      SizedBox(
                        width: 5,
                      ),
                      Text('cm', style: kLabelTextStyle)
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      inactiveTrackColor: Color(0xFF8D8E98),
                      activeTrackColor: Colors.white,
                      thumbColor: Color(0xFFEB1555),
                      overlayColor: Color(0x29EB1555),
                      thumbShape:
                      RoundSliderThumbShape(enabledThumbRadius: 15.0),
                      overlayShape:
                      RoundSliderOverlayShape(overlayRadius: 30.0),
                    ),
                    child: Slider(
                      value: userHeight.toDouble(),
                      min: 120.0,
                      max: 220.0,
                      onChanged: (double newValue) {
                        setState(() {
                          userHeight = newValue.round();
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    colour: kActiveCardColour,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "WEIGHT",
                          style: kLabelTextStyle,
                        ),
                        Text(
                          userWeight.toString(),
                          style: kNumberTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIconBtn(
                                icon: FontAwesomeIcons.minus,
                                userOnPress: () {
                                  setState(() {
                                    userWeight--;
                                  });
                                }),
                            SizedBox(width: 10),
                            RoundIconBtn(
                                icon: FontAwesomeIcons.plus,
                                userOnPress: () {
                                  setState(() {
                                    userWeight++;
                                  });
                                }),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                Expanded(
                    child: ReusableCard(
                  colour: kActiveCardColour,
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "AGE",
                        style: kLabelTextStyle,
                      ),
                      Text(
                        userAge.toString(),
                        style: kNumberTextStyle,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          RoundIconBtn(
                            icon: FontAwesomeIcons.minus,
                            userOnPress: () {
                              setState(() {
                                userAge--;
                              });
                            },
                          ),
                          SizedBox(width: 10),
                          RoundIconBtn(
                              icon: FontAwesomeIcons.plus,
                              userOnPress: () {
                                setState(() {
                                  userAge++;
                                });
                              })
                        ],
                      )
                    ],
                  ),
                ))
              ],
            ),
          ),

          BottomButtonWidget(
            buttonText: "CALCULATE",
            onTap: () {
              CalculatingBMI cal = CalculatingBMI(
                  givenHeight: userHeight, givenWeight: userWeight);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ResultShowingPage(
                    resultBMII: cal.getCalculatedBMIResult(),
                    resultText: cal.getTextResult(),
                    resultInterpretation: cal.getInterpretation(),
                  ),
                ),
              );
            },
          )
        ],
      ),
    );
  }
}
