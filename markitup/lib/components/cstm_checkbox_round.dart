import 'package:flutter/material.dart';

class CstmCheckboxRound extends StatelessWidget {
  final bool value;
  final ValueChanged<bool?> onChanged;
  final Color activeColor;
  final Color checkColor;

  const CstmCheckboxRound({
    super.key,
    required this.value,
    required this.onChanged,
    this.activeColor = Colors.blue, // Default active color
    this.checkColor = Colors.white, // Default check color
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onChanged(!value); // Toggle value
      },
      child: Container(
        width: 30,
        height: 30,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
            color: value ? activeColor : Colors.grey, // Border color
            width: 2,
          ),
          color: value ? activeColor : Colors.transparent, // Background color
        ),
        child: value
            ? Icon(Icons.check, color: checkColor, size: 20) // Show check when selected
            : null, // Hide icon when unchecked
      ),
    );
  }
}
