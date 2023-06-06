import 'package:flutter/material.dart';
import 'package:bmi_calculator/Constants.dart';


class BottomButton extends StatelessWidget {
  BottomButton({@required this.ButtonText,  this.onTap});
  final Function onTap;
  final String ButtonText;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        color: kButtomContainerColour,
        margin: EdgeInsets.only(top: 10.0),
        width: double.infinity,
        padding: EdgeInsets.only(bottom: 20.0),
        height: kBottomContainerHeight,
        child: Center(
          child: Text(
            ButtonText,
            style: kLargeButtonTextStyle,
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
