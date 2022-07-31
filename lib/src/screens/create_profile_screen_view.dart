import 'package:class_assignment_2/src/widgets/bottom_create_bottun.dart';
import 'package:class_assignment_2/src/widgets/bottom_radio_button.dart';
import 'package:class_assignment_2/src/widgets/city_drop_down.dart';
import 'package:class_assignment_2/src/widgets/job_category_drop_down.dart';
import 'package:class_assignment_2/src/widgets/name_field.dart';
import 'package:class_assignment_2/src/widgets/phone_field.dart';
import 'package:flutter/material.dart';

class CreateProfileScreenView extends StatefulWidget {
  const CreateProfileScreenView({Key? key}) : super(key: key);
  @override
  State<CreateProfileScreenView> createState() => _CreateProfileScreenView();
}

class _CreateProfileScreenView extends State<CreateProfileScreenView> {
  TextEditingController _nameController = TextEditingController();
  TextEditingController _phoneController = TextEditingController();
  @override
  void dispose() {
    super.dispose();
    _nameController.dispose();
    _phoneController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Create Profile'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            NameField(nameController: _nameController),
            PhoneField(phoneController: _phoneController),
            CityDropDown(),
            JobCategoryDropDown(),
            BottomRadioButton(),
            BottomCreateButton(),
          ],
        ),
      ),
    );
  }
}
