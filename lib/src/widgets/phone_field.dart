import 'package:flutter/material.dart';

class PhoneField extends StatefulWidget {
  const PhoneField({
    Key? key,
    required this.phoneController,
  }) : super(key: key);
  final phoneController;
  @override
  State<PhoneField> createState() => _PhoneFieldState();
}

class _PhoneFieldState extends State<PhoneField> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Phone",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w400,
          ),
        ),
        const SizedBox(height: 10),
        TextField(
          controller: widget.phoneController,
          keyboardType: TextInputType.phone,
          decoration: const InputDecoration(
            prefixIcon: Padding(
              padding: EdgeInsets.only(top: 12.0, left: 8),
              child: Text(
                '+964',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                ),
              ),
            ),
            counterText: ' ',
            filled: true,
            fillColor: Color.fromARGB(255, 209, 209, 209),
          ),
        ),
      ],
    );
  }
}
