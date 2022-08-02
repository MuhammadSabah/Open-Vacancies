import 'package:flutter/material.dart';

class CreateProfileButton extends StatelessWidget {
  const CreateProfileButton({
    Key? key,
    required this.onPressed,
  }) : super(key: key);
  final Function() onPressed;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 14),
        SizedBox(
          width: 180,
          height: 52,
          child: ElevatedButton(
            onPressed: onPressed,
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
