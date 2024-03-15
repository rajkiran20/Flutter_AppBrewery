import 'package:bmi_calculator/constants.dart';
import 'package:flutter/material.dart';

class IconContent extends StatelessWidget {
  final String imagePath;
  final String label;

  const IconContent({required this.imagePath, required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image(image: AssetImage(imagePath ?? "")),
        const SizedBox(
          height: 20,
        ),
        Text(
          label ?? "",
          textAlign: TextAlign.center,
          style: kActiveTextStyle,
        ),
      ],
    );
  }
}
