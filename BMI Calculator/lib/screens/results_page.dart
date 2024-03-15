import 'package:bmi_calculator/components/reusable_card.dart';
import 'package:bmi_calculator/constants.dart';
import 'package:flutter/material.dart';

class ResultsPage extends StatelessWidget {
  final double bmi;
  const ResultsPage({super.key, required this.bmi});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Body Composition Tracker"),
        ),
        body: Column(
          children: [
            const Text(
              "Your Result",
              style: kNumberTextStyle,
            ),
            Expanded(
              child: ReusableCard(
                colour: kInactiveCardColor,
                child: Center(
                  child: Column(
                    children: [
                    Text(
                      bmi.toStringAsFixed(1),
                      style: kNumberTextStyle,
                    ),
                    ],
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Container(
                margin: const EdgeInsets.only(top: 10),
                color: Colors.pink,
                width: double.infinity,
                height: 150,
                child: const Center(
                  child: Text(
                    "RE-CALCULATE",
                    style: kButtonTextStyle,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
