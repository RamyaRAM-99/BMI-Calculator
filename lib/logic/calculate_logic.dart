import 'dart:math';

class CalculatingBMI {
  CalculatingBMI({required this.givenHeight, required this.givenWeight});
  final int givenHeight;
  final int givenWeight;
  double _userBMI=0;

  String getCalculatedBMIResult(){
    _userBMI = givenWeight / pow(givenHeight / 100, 2);
    return _userBMI.toStringAsFixed(1);
  }



  String getTextResult() {
    if (_userBMI >= 25) {
      return 'Overweight';
    } else if (_userBMI > 18.5) {
      return 'Normal';
    } else {
      return 'Underweight';
    }
  }

  String getInterpretation() {
    if (_userBMI >= 25) {
      return '''Time to run!  
      By maintaining a healthy weight, you lower your risk of developing serious health problems.''';
    } else if (_userBMI >= 18.5) {
      return '''Good job! 
      By maintaining a healthy weight, you lower your risk of developing serious health problems.''';
    } else {
      return '''Time to grab a bite. 
      By maintaining a healthy weight, you lower your risk of developing serious health problems''';
    }
  }
}
