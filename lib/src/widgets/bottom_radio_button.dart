import 'package:flutter/material.dart';

class BottomRadioButton extends StatefulWidget {
  const BottomRadioButton({Key? key}) : super(key: key);

  @override
  State<BottomRadioButton> createState() => _BottomRadioButtonState();
}

class _BottomRadioButtonState extends State<BottomRadioButton> {
  String? radioGroupValue = 'employed';
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ListTile(
          title: const Text(
            'Employed',
          ),
          leading: Radio(
            activeColor: Colors.red.shade600,
            value: 'employed',
            groupValue: radioGroupValue,
            onChanged: (String? value) {
              setState(() {
                radioGroupValue = value;
              });
            },
          ),
        ),
        ListTile(
          title: const Text(
            'Unemployed',
          ),
          leading: Radio(
            activeColor: Colors.red.shade600,
            value: 'unemployed',
            groupValue: radioGroupValue,
            onChanged: (String? value) {
              setState(() {
                radioGroupValue = value;
              });
            },
          ),
        ),
      ],
    );
  }
}
