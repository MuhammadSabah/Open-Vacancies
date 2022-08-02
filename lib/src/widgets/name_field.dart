import 'package:flutter/material.dart';

class NameField extends StatefulWidget {
  const NameField({
    Key? key,
    required this.nameController,
  }) : super(key: key);
  final nameController;
  @override
  State<NameField> createState() => _NameFieldState();
}

class _NameFieldState extends State<NameField> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Name",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w400,
          ),
        ),
        const SizedBox(height: 10),
        TextFormField(
          validator: (String? value) {
            if (value == null || widget.nameController.text.isEmpty) {
              return 'Name is required';
            }
          },
          controller: widget.nameController,
          decoration: const InputDecoration(
            counterText: ' ',
            filled: true,
            fillColor: Color.fromARGB(255, 209, 209, 209),
          ),
        ),
      ],
    );
  }
}
