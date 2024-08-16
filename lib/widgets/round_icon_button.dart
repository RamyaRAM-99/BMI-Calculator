import 'package:flutter/material.dart';

class RoundIconBtn extends StatelessWidget {
  const RoundIconBtn({@required this.icon, @required this.userOnPress});

  final IconData? icon;
  final Function()? userOnPress;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      // shape: CircleBorder(),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0), // Set the corner radius here
      ),
      fillColor: Color(0xff4c4f5e),
      elevation: 0.0,
      child: Icon(icon),
      onPressed: userOnPress,
      constraints: BoxConstraints.tightFor(
      width: 56.0,
      height: 56.0,
    ),
    );
  }
}
