import 'package:bmi_calculator/constants.dart';
import 'package:flutter/material.dart';

class CustomFab extends StatelessWidget {
  final IconData iconData;
  final Function()? onPressed;

  const CustomFab({super.key, required this.iconData, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      shape: const CircleBorder(),
      fillColor: kActiveCardColor,
      elevation: 8,
      constraints: kFabConstraints,
      onPressed: onPressed,
      child: Icon(
        iconData,
        color: Colors.white,
      ),
    );
  }
}
