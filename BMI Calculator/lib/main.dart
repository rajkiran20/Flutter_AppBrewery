import 'package:bmi_calculator/constants.dart';
import 'package:flutter/material.dart';

import 'screens/input_page.dart';

void main() => runApp(BMICalculator());

class BMICalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        Routes.home.route: (context) => InputPage(),
      },
      theme: ThemeData(
          primaryColor: Color(0xFF0A0E21),
          appBarTheme: const AppBarTheme(
            backgroundColor: Color(0xFF0A0E21),
            titleTextStyle: TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          scaffoldBackgroundColor: Color(0xFF0A0E21),
          sliderTheme: SliderTheme.of(context).copyWith(
            activeTrackColor: kSliderActiveColor,
            inactiveTrackColor: kSliderInactiveColor,
            thumbColor: kSliderThumbColor,
            overlayShape: RoundSliderOverlayShape(overlayRadius: 30),
            overlayColor: Colors.pinkAccent.withOpacity(0.3),
            thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15),
          )),
    );
  }
}
