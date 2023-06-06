import 'package:flutter/material.dart';
import 'package:bmi_calculator/Constants.dart';

class iconContent extends StatelessWidget {
  iconContent({@required this.icon, this.label });
  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          size: 80.0,
        ),
        SizedBox(
          height: 18.0,
        ),
        Text(
          label,
          style: kLabelTextstyle,
        ),
      ],
    );
  }
}