
import 'dart:math';
import 'package:flutter/material.dart';

class CalculatorBrain{
    CalculatorBrain({@required this.weight,  this.height, });
  final int height;
  final int weight;

   double _bmi ;

  String CalculateBMI () {
      _bmi = weight / pow(height/100, 2);
    return _bmi.toStringAsFixed(1);
  }
  String GetResults () {
    if (_bmi >= 25 )  {
      return 'OVERWEIGHT';
    }else if (_bmi >= 18.5) {
      return 'Normal';
    }else {
      return 'UNDERWEIGHT';
    }
     
  }
    
  
  String GetInterpretation () {
    if (_bmi >= 25) {
      return 'You have a higher than normal body weight. You should exercise more';
    }else if ( _bmi >= 18.5) {
      return 'You have a normal body weight. Good job!';
    }else {
      return  'Your BMI Result is quite low, You should eat more!';
    }
  }
}


// String calculateBMI (){
// _bmi = weight / pow( height/100, 2);
// return _bmi.toStringAsFixed(1);}
