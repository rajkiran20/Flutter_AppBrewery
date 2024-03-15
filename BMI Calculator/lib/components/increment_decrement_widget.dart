import 'package:bmi_calculator/constants.dart';
import 'package:flutter/material.dart';

import 'custom_fab.dart';

class IncrementDecrementWidget extends StatefulWidget {
  final String title;
  final int defaultValue;
  final Function()? onIncrement;
  final Function()? onDecrement;

  IncrementDecrementWidget({
    super.key,
    required this.title,
    required this.defaultValue,
    required this.onIncrement,
    required this.onDecrement,
  });

  @override
  State<IncrementDecrementWidget> createState() =>
      _IncrementDecrementWidgetState();
}

class _IncrementDecrementWidgetState extends State<IncrementDecrementWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          widget.title,
          style: kInactiveTextStyle,
        ),
        Text(
          widget.defaultValue.toString(),
          style: kNumberTextStyle,
        ),
        Row(
          children: [
            Expanded(
              child: CustomFab(
                iconData: Icons.add,
                onPressed: widget.onIncrement,
              ),
            ),
            Expanded(
              child: CustomFab(
                iconData: Icons.remove,
                onPressed: widget.onDecrement,
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 10,
        ),
      ],
    );
  }
}
