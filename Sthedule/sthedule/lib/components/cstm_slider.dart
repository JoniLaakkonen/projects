import 'package:flutter/material.dart';

class CstmSlider extends StatelessWidget {
  final double value; // Current value of the slider
  final ValueChanged<double> onChanged; // Callback when the value changes
  final double min; // Minimum value of the slider
  final double max; // Maximum value of the slider
  final String label; // Label to show alongside the slider
  final Color activeColor; // Color when the slider is active
  final Color inactiveColor; // Color when the slider is inactive

  const CstmSlider({
    super.key,
    required this.value,
    required this.onChanged,
    this.min = 0.0, // Default minimum value
    this.max = 100.0, // Default maximum value
    required this.label,
    this.activeColor = Colors.blue, // Default active color
    this.inactiveColor = Colors.grey, // Default inactive color
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(label),
            Text(value.toStringAsFixed(1)), // Display the current value
          ],
        ),
        Slider(
          value: value,
          min: min,
          max: max,
          onChanged: onChanged,
          activeColor: activeColor,
          inactiveColor: inactiveColor,
          divisions: ((max - min) ~/ 1).toInt(), // Number of discrete divisions
        ),
      ],
    );
  }
}
