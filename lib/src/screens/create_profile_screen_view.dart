import 'package:class_assignment_2/src/firebase/create_profile_dao.dart';
import 'package:class_assignment_2/src/models/user_model.dart';
import 'package:class_assignment_2/src/widgets/bottom_create_bottun.dart';
import 'package:class_assignment_2/src/widgets/bottom_radio_button.dart';
import 'package:class_assignment_2/src/widgets/name_field.dart';
import 'package:class_assignment_2/src/widgets/phone_field.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class CreateProfileScreenView extends StatefulWidget {
  const CreateProfileScreenView({Key? key}) : super(key: key);
  @override
  State<CreateProfileScreenView> createState() => _CreateProfileScreenView();
}

class _CreateProfileScreenView extends State<CreateProfileScreenView> {
  TextEditingController _nameController = TextEditingController();
  TextEditingController _phoneController = TextEditingController();
  String cityValue = '';
  String categoryValue = '';
  String? radioGroupValue = 'employed';
  List<String> categoryList = ['Developer', 'Designer'];
  List<String> cities = [
    'Erbil',
    'Sulaymaniyah',
    'Duhok',
    'Kirkuk',
    'Halabja',
  ];

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
            _buildCityDropDown(),
            _buildJobCategoryDropDown(),
            BottomRadioButton(radioGroupValue: radioGroupValue),
            BottomCreateButton(
              onPressed: () {
                UserModel userModel = UserModel(
                  name: _nameController.text,
                  uid: FirebaseAuth.instance.currentUser!.uid,
                  phone: _phoneController.text,
                  city: cityValue,
                  jobCategory: categoryValue,
                  personWorkStatus: radioGroupValue!,
                );
                CreateProfileDao().saveUser(userModel);
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCityDropDown() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "City",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w400,
          ),
        ),
        const SizedBox(height: 10),
        Align(
          alignment: Alignment.centerLeft,
          child: Container(
            width: MediaQuery.of(context).size.width,
            decoration: const BoxDecoration(
              color: Color.fromARGB(255, 209, 209, 209),
            ),
            child: Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 16.0),
                    child: Text(
                      cityValue.toString(),
                      style: const TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 12.0),
                  child: DropdownButton(
                    iconEnabledColor: Colors.red.shade700,
                    iconDisabledColor: Colors.red.shade700,
                    items: cities.map((city) {
                      return DropdownMenuItem(
                          value: city,
                          child: Text(
                            city.toString(),
                          ));
                    }).toList(),
                    onChanged: (value) {
                      if (value is String) {
                        setState(() {
                          cityValue = value;
                        });
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 20),
      ],
    );
  }

  Widget _buildJobCategoryDropDown() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Job Category",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w400,
          ),
        ),
        const SizedBox(height: 10),
        Align(
          alignment: Alignment.centerLeft,
          child: Container(
            width: MediaQuery.of(context).size.width,
            decoration: const BoxDecoration(
              color: Color.fromARGB(255, 209, 209, 209),
            ),
            child: Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 16.0),
                    child: Text(
                      categoryValue.toString(),
                      style: const TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 12.0),
                  child: DropdownButton(
                    iconEnabledColor: Colors.red.shade700,
                    iconDisabledColor: Colors.red.shade700,
                    items: categoryList.map((category) {
                      return DropdownMenuItem(
                          value: category,
                          child: Text(
                            category.toString(),
                          ));
                    }).toList(),
                    onChanged: (value) {
                      if (value is String) {
                        setState(() {
                          categoryValue = value;
                        });
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 20),
      ],
    );
  }
}
