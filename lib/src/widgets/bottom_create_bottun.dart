import 'package:flutter/material.dart';

class BottomCreateButton extends StatefulWidget {
  const BottomCreateButton({Key? key}) : super(key: key);

  @override
  State<BottomCreateButton> createState() => _BottomCreateButtonState();
}

class _BottomCreateButtonState extends State<BottomCreateButton> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 14),
        SizedBox(
          width: 180,
          height: 52,
          child: ElevatedButton(
            onPressed: () {
              () {};
            },
            child: const Text(
              'Create Profile',
              style: TextStyle(
                fontSize: 18,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
