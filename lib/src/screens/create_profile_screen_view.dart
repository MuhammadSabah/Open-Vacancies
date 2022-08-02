import 'package:class_assignment_2/src/firebase/user_profile_dao.dart';
import 'package:class_assignment_2/src/firebase/user_auth_dao.dart';
import 'package:class_assignment_2/src/models/user_model.dart';
import 'package:class_assignment_2/src/screens/open_vacancies_screen.dart';
import 'package:class_assignment_2/src/widgets/city_drop_down.dart';
import 'package:class_assignment_2/src/widgets/create_profile_button.dart';
import 'package:class_assignment_2/src/widgets/bottom_radio_button.dart';
import 'package:class_assignment_2/src/widgets/create_profile_form.dart';
import 'package:class_assignment_2/src/widgets/job_category_drop_down.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class CreateProfileScreenView extends StatefulWidget {
  const CreateProfileScreenView({Key? key}) : super(key: key);
  @override
  State<CreateProfileScreenView> createState() => _CreateProfileScreenView();
}

class _CreateProfileScreenView extends State<CreateProfileScreenView> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  String cityValue = '';
  String categoryValue = '';
  String? radioGroupValue = 'employed';
  List<String> categoryList = [
    'Developer',
    'Designer',
    'Manager',
    'Cashier',
    'Accountant',
  ];
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
        leading: IconButton(
          onPressed: () {
            setState(() {
              UserAuthDao().logOutUser();
            });
            Navigator.of(context).pop();
          },
          icon: const Icon(Icons.arrow_back),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            CreateProfileForm(
              formKey: _formKey,
              nameController: _nameController,
              phoneController: _phoneController,
            ),
            CityDropDown(
              cities: cities,
              cityValue: cityValue,
            ),
            JobCategoryDropDown(
              categoryList: categoryList,
              categoryValue: categoryValue,
            ),
            BottomRadioButton(
              radioGroupValue: radioGroupValue,
            ),
            CreateProfileButton(
              onPressed: () {
                UserModel userModel = UserModel(
                  name: _nameController.text,
                  uid: FirebaseAuth.instance.currentUser!.uid,
                  phone: _phoneController.text,
                  city: cityValue,
                  jobCategory: categoryValue,
                  personWorkStatus: radioGroupValue!,
                );
                final validForm = _formKey.currentState!.validate();
                if (validForm) {
                  UserProfileDao().saveUser(userModel);
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const OpenVacanciesScreen(),
                    ),
                  );
                }
                // profileDao.profileClicked();
              },
            ),
          ],
        ),
      ),
    );
  }
}
