import 'package:bmi_calculator/bmi_calculator_brain.dart';
import 'package:bmi_calculator/screens/results_page.dart';
import 'package:flutter/material.dart';

import '../components/icon_content.dart';
import '../components/increment_decrement_widget.dart';
import '../components/reusable_card.dart';
import '../constants.dart';

enum Gender { male, female }

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Color maleCardColour = kActiveCardColor;
  Color femaleCardColour = kInactiveCardColor;
  int personHeight = 160;
  int weight = 71;
  int age = 24;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Body Composition Tracker'),
        ),
        body: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    colour: maleCardColour,
                    child: const IconContent(
                      imagePath: 'images/male.png',
                      label: "MALE",
                    ),
                    onPressed: () {
                      setState(() {
                        setGenderSelected(Gender.male);
                      });
                    },
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    colour: femaleCardColour,
                    child: const IconContent(
                      imagePath: 'images/female.png',
                      label: "FEMALE",
                    ),
                    onPressed: () {
                      setState(() {
                        setGenderSelected(Gender.female);
                      });
                    },
                  ),
                ),
              ],
            ),
            buildHeightCard(),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  child: ReusableCard(
                    colour: kInactiveCardColor,
                    child: IncrementDecrementWidget(
                      title: "WEIGHT",
                      defaultValue: weight,
                      onIncrement: () {
                        setState(() {
                          ++weight;
                        });
                      },
                      onDecrement: () {
                        setState(() {
                          --weight;
                        });
                      },
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    colour: kInactiveCardColor,
                    child: IncrementDecrementWidget(
                      title: "AGE",
                      defaultValue: age,
                      onIncrement: () {
                        setState(() {
                          ++age;
                        });
                      },
                      onDecrement: () {
                        setState(() {
                          --age;
                        });
                      },
                    ),
                  ),
                ),
              ],
            ),
            GestureDetector(
              onTap: () {
                BmiCalculator bmiCalculator = BmiCalculator();
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ResultsPage(
                        bmi: bmiCalculator.getBmiFor(weight, personHeight),
                      ),
                    ));
              },
              child: Container(
                margin: const EdgeInsets.only(top: 10),
                color: Colors.pink,
                width: double.infinity,
                height: 150,
                child: const Center(
                  child: Text(
                    "CALCULATE",
                    style: kButtonTextStyle,
                  ),
                ),
              ),
            )
          ],
        ));
  }

  ReusableCard buildHeightCard() {
    return ReusableCard(
      colour: kInactiveCardColor,
      child: Column(
        children: [
          const Text(
            "HEIGHT",
            style: kInactiveTextStyle,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.baseline,
            textBaseline: TextBaseline.alphabetic,
            children: [
              Text(
                personHeight.toString(),
                style: kNumberTextStyle,
              ),
              const Text(
                "cm",
                style: kInactiveTextStyle,
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Slider(
            value: personHeight.toDouble(),
            min: 120.0,
            max: 220.0,
            onChanged: (double newValue) {
              setState(() {
                personHeight = newValue.round();
              });
            },
          ),
        ],
      ),
    );
  }

  void setGenderSelected(Gender gender) {
    if (gender == Gender.male) {
      maleCardColour = kActiveCardColor;
      femaleCardColour = kInactiveCardColor;
    } else {
      maleCardColour = kInactiveCardColor;
      femaleCardColour = kActiveCardColor;
    }
  }
}
