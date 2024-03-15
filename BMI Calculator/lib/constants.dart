import 'package:flutter/material.dart';

const kInactiveCardColor = Color(0xFF1D1E33);
const kActiveCardColor = Color(0xFF111328);
const kSliderInactiveColor = Color(0xFF8D8E98);
const kSliderActiveColor = Colors.white;
const kSliderThumbColor = Colors.pinkAccent;

const kActiveTextStyle = TextStyle(
  color: Colors.white,
  fontSize: 20,
  fontWeight: FontWeight.bold,
);

const kInactiveTextStyle = TextStyle(
  color: Color(0x88FFFFFF),
  fontSize: 20,
  fontWeight: FontWeight.bold,
);

const kNumberTextStyle = TextStyle(
  color: Colors.white,
  fontSize: 64,
  fontWeight: FontWeight.bold,
);

const kButtonTextStyle = TextStyle(
  color: Colors.white,
  fontSize: 40,
  fontWeight: FontWeight.bold,
);

const kFabConstraints = BoxConstraints(
  minHeight: 56,
  minWidth: 56,
);

enum Routes {
  home(route: "/"),
  results(route: "/results");

  const Routes({
    required this.route,
  });

  final String route;
}
