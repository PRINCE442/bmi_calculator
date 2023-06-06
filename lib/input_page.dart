import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:bmi_calculator/Reuseable_card.dart';
import 'package:bmi_calculator/icon_content.dart';
import 'package:bmi_calculator/Constants.dart';
import 'results_page.dart';
import 'Bottom_Button.dart';
import 'RoundIconButton.dart';
import 'calculator_brain.dart';


class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  GenderType selectedgender;
  int height = 190;
  int weight = 70;
  int age = 18;

  // Color Malecardcolour = InactivecardColour;
  // Color Femalecardcolour = InactivecardColour;

//void Updatecolour ( gender) {
// if (gender == GenderType.Male) {
//   if (Malecardcolour == InactivecardColour) {
//     Malecardcolour = ActivecardColour;
//     Femalecardcolour = InactivecardColour;
//   }else{
//     Malecardcolour = InactivecardColour;
//   }
// }
// if (gender == GenderType.Female){
//   if (Femalecardcolour == InactivecardColour) {
//     Femalecardcolour = ActivecardColour;
//     Malecardcolour = InactivecardColour;
//   }else{
//     Femalecardcolour = InactivecardColour;
//   }
// }

  // }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF0B1033),
        title: Center(child: Text('BMI CALCULATOR')),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
              child: Row(
            children: [
              Expanded(
                child: Reuseablecard(
                  onpress: () {
                    setState(() {
                      selectedgender = GenderType.Male;
                    });
                  },
                  colour: selectedgender == GenderType.Male
                      ? kActivecardColour
                      : kInactivecardColour,
                  cardChild: iconContent(
                    icon: FontAwesomeIcons.mars,
                    label: 'MALE',
                  ),
                ),
              ),
              Expanded(
                child: Reuseablecard(
                  onpress: () {
                    setState(() {
                      selectedgender = GenderType.Female;
                    });
                  },
                  colour: selectedgender == GenderType.Female
                      ? kActivecardColour
                      : kInactivecardColour,
                  cardChild: iconContent(
                    icon: FontAwesomeIcons.venus,
                    label: 'FEMALE',
                  ),
                ),
              ),
            ],
          )),
          Expanded(
            child: Reuseablecard(
              colour: kActivecardColour,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'HEIGHT',
                    style: kLabelTextstyle,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(
                        height.toString(),
                        style: kNumbertextstyle,
                      ),
                      Text(
                        'cm',
                        style: kLabelTextstyle,
                      )
                    ],
                  ),
                  SliderTheme(
                    data: SliderThemeData(
                      thumbColor: Color(0xFFEB1555),
                      activeTrackColor: Colors.white,
                      inactiveTrackColor: Colors.grey,
                      thumbShape:
                          RoundSliderThumbShape(enabledThumbRadius: 15.0),
                      overlayShape:
                          RoundSliderOverlayShape(overlayRadius: 30.0),
                      overlayColor: Color(0x29EB1555),
                    ),
                    child: Slider(
                        value: height.toDouble(),
                        min: 100.0,
                        max: 240.0,
                        onChanged: (double newValue) {
                          setState(() {
                            height = newValue.round();
                          });
                        }),
                  )
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: Reuseablecard(
                    colour: kActivecardColour,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'WEIGHT',
                          style: kLabelTextstyle,
                        ),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                weight.toString(),
                                style: kNumbertextstyle,
                              ),
                              Text(
                                'kg',
                                style: kLabelTextstyle,
                              ),
                            ]),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIconButton(
                              icon: FontAwesomeIcons.plus,
                              onpress: () {
                                setState(() {
                                  weight++;
                                });
                              },
                            ),
                            SizedBox(
                              width: 15.0,
                            ),
                            RoundIconButton(
                              icon: FontAwesomeIcons.minus,
                              onpress: () {
                                setState(() {
                                  weight--;
                                });
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Reuseablecard(
                    colour: kActivecardColour,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'AGE',
                          style: kLabelTextstyle,
                        ),
                        Text(
                          age.toString(),
                          style: kNumbertextstyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIconButton(
                              icon: FontAwesomeIcons.plus,
                              onpress: () {
                                setState(() {
                                  age++;
                                });
                              },
                            ),
                            SizedBox(
                              width: 15.0,
                            ),
                            RoundIconButton(
                              icon: FontAwesomeIcons.minus,
                              onpress: () {
                                setState(() {
                                  age--;
                                });
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          BottomButton(
            ButtonText: 'CALCULATE',
            onTap: () {
              CalculatorBrain calc = CalculatorBrain(
                height: height, weight: weight
              );

              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) {
                  return ResultsPage(
                    bmiInterpretation: calc.GetInterpretation(),
                    bmiResult: calc.CalculateBMI(),
                    resultText: calc.GetResults() ,
                  );
                }),
              );
            },
          ),
        ],
      ),
    );
  }
}


