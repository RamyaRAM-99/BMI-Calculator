import 'package:flutter/material.dart';
import 'package:bmi_app/constants/constants.dart';

class IconContent extends StatelessWidget {
  IconContent({this.iconToShow, this.labelToShow});

  final IconData ? iconToShow;
  final String ? labelToShow;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          iconToShow,
          size: 80.0,
        ),
        SizedBox(
          height: 15.0,
        ),
        Text(
          labelToShow ?? '',
          style: kLabelTextStyle,
        )
      ],
    );
  }
}
