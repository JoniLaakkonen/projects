import 'package:flutter/material.dart';

class TextfieldLogin extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final int normalBorder;
  final int focusedBorder;
  final int fillColor;
  final bool isFilled;
  final String hintText;


  const TextfieldLogin({
    super.key,
    required this.controller,
    required this.label,
    required this.normalBorder,
    required this.focusedBorder,
    required this.fillColor,
    required this.isFilled,
    required this.hintText,
  });

  @override
  Widget build(BuildContext context){
    return Padding(padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          labelText: '',
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Color(normalBorder)),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Color(focusedBorder)),
          ),
          fillColor: Color(fillColor),
          filled: isFilled,
          hintText: hintText,
        ),
      ),
    );
  }
}