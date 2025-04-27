import 'package:flutter/material.dart';
import 'package:sthedule/components/cstm_checkbox.dart';
import 'package:sthedule/components/cstm_slider.dart';

class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool is12HourFormat = false; // State for the time format checkbox
  double sliderValue = 50.0; // Initial value for the slider

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Time Format',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            CstmCheckbox(
              value: is12HourFormat,
              onChanged: (bool? value) {
                setState(() {
                  is12HourFormat = value ?? false; // Update the state
                });
              },
              label: "Use 12-hour format",
            ),
            const SizedBox(height: 20),
            const Text(
              'Adjust Setting',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            CstmSlider(
              value: sliderValue,
              onChanged: (double newValue) {
                setState(() {
                  sliderValue = newValue; // Update the slider value
                });
              },
              min: 0.0,
              max: 100.0,
              label: "Adjust Value",
            ),
          ],
        ),
      ),
    );
  }
}
