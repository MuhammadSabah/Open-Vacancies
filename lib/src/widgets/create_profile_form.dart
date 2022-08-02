import 'package:flutter/material.dart';

class CreateProfileForm extends StatelessWidget {
  const CreateProfileForm({
    Key? key,
    required this.nameController,
    required this.phoneController,
    required this.formKey,
  }) : super(key: key);
  final nameController;
  final phoneController;
  final formKey;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        children: [
          Column(
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
                  if (value == null || nameController.text.isEmpty) {
                    return 'Name field is empty';
                  }
                },
                controller: nameController,
                decoration: const InputDecoration(
                  counterText: ' ',
                  filled: true,
                  fillColor: Color.fromARGB(255, 209, 209, 209),
                ),
              ),
            ],
          ),
          Column(
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
              TextFormField(
                validator: (String? value) {
                  if (value == null || phoneController.text.isEmpty) {
                    return 'Phone field is empty';
                  }
                },
                controller: phoneController,
                keyboardType: TextInputType.phone,
                decoration: const InputDecoration(
                  prefixIcon: Padding(
                    padding: EdgeInsets.only(top: 11.0, left: 8, right: 8),
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
          ),
        ],
      ),
    );
  }
}
