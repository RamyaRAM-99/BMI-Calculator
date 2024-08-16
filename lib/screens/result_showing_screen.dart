import 'package:bmi_app/constants/constants.dart';
import 'package:bmi_app/widgets/reusablecard_content.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:bmi_app/logic/calculate_logic.dart';
import '../widgets/bottom_button.dart';

class ResultShowingPage extends StatelessWidget {
   ResultShowingPage({this.resultBMII, this.resultText, this.resultInterpretation});

  final String? resultBMII;
  final String? resultText;
  final String? resultInterpretation;

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
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Container(
              padding: EdgeInsets.only(left: 16),
              child: Text(
                'Result ',
                style: kResultPageTitleTextStyle,

              ),
            ),
          ),
          Expanded(
            flex: 12,
            child: ReusableCard(
                colour: kActiveCardColour,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(resultText.toString().toUpperCase(), style: kResultTextStyle,),
                    Text(resultBMII.toString(), style: kBMITextStyle),
                    Text(resultInterpretation.toString(), style:kBodyTextStyle, textAlign: TextAlign.center),
                  ],
                )),
          ),
          BottomButtonWidget(buttonText: 'RE-CALCULATE', onTap: () {
            Navigator.pop(context);
          },)
        ],
      ),
    );
  }
}
