import 'package:flutter/material.dart';

class CstmCheckbox extends StatelessWidget {
  final bool value;
  final ValueChanged<bool?> onChanged;
  final String label;
  final Color activeColor;
  final Color checkColor;

  const CstmCheckbox({
    super.key,
    required this.value,
    required this.onChanged,
    required this.label,
    this.activeColor = Colors.blue, // Default active color
    this.checkColor = Colors.white, // Default check color
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(
          value: value,
          onChanged: onChanged,
          activeColor: activeColor,
          checkColor: checkColor,
        ),
        Text(label),
      ],
    );
  }
}
