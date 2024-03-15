import 'package:flutter/material.dart';

class ReusableCard extends StatelessWidget {
  final Color? colour;
  final Widget? child;
  final Function()? onPressed;

  const ReusableCard({required this.colour, this.child, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        padding: const EdgeInsets.all(8),
        margin: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: colour,
          borderRadius: BorderRadius.circular(12),
        ),
        child: child,
      ),
    );
  }
}
