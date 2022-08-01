import 'package:flutter/material.dart';

class BottomRadioButton extends StatefulWidget {
  BottomRadioButton({Key? key, required this.radioGroupValue})
      : super(key: key);
  String? radioGroupValue;
  @override
  State<BottomRadioButton> createState() => _BottomRadioButtonState();
}

class _BottomRadioButtonState extends State<BottomRadioButton> {
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
            groupValue: widget.radioGroupValue,
            onChanged: (String? value) {
              setState(() {
                widget.radioGroupValue = value;
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
            groupValue: widget.radioGroupValue,
            onChanged: (String? value) {
              setState(() {
                widget.radioGroupValue = value;
              });
            },
          ),
        ),
      ],
    );
  }
}
