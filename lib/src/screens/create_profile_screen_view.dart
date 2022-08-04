import 'package:class_assignment_2/src/firebase/user_profile_dao.dart';
import 'package:class_assignment_2/src/firebase/user_auth_dao.dart';
import 'package:class_assignment_2/src/models/user_model.dart';
import 'package:class_assignment_2/src/screens/login_screen_view.dart';
import 'package:class_assignment_2/src/screens/open_vacancies_screen.dart';
import 'package:class_assignment_2/src/widgets/create_profile_button.dart';
import 'package:class_assignment_2/src/widgets/create_profile_form.dart';
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
  String radioGroupValue = 'employed';
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
  String nameValue = '';

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
        title: Text('Create Profile'.toUpperCase()),
        leading: IconButton(
          onPressed: () {
            UserAuthDao().logOutUser();
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => const LoginScreenView(),
                ));
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
            _buildCityDropDown(),
            _buildCategoryDropDown(),
            _buildRadioButtons(),
            CreateProfileButton(
              onPressed: () {
                UserModel userModel = UserModel(
                  name: _nameController.text,
                  uid: FirebaseAuth.instance.currentUser!.uid,
                  phone: _phoneController.text,
                  city: cityValue,
                  jobCategory: categoryValue,
                  personWorkStatus: radioGroupValue,
                );
                final validForm = _formKey.currentState!.validate();
                if (validForm) {
                  nameValue = _nameController.text;
                  print('NAME VALUE: $nameValue');
                  UserProfileDao().saveUser(userModel);
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          OpenVacanciesScreen(userName: nameValue),
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

  Widget _buildCityDropDown() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'City'.toString(),
          style: const TextStyle(
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
                  child: DropdownButton<String>(
                    iconEnabledColor: Colors.red.shade700,
                    iconDisabledColor: Colors.red.shade700,
                    items: cities.map((city) {
                      return DropdownMenuItem<String>(
                          value: city,
                          child: Text(
                            city.toString(),
                          ));
                    }).toList(),
                    onChanged: (val) {
                      if (val is String) {
                        setState(() {
                          cityValue = val;
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

  Widget _buildCategoryDropDown() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Job Category'.toString(),
          style: const TextStyle(
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
                  child: DropdownButton<String>(
                    iconEnabledColor: Colors.red.shade700,
                    iconDisabledColor: Colors.red.shade700,
                    items: categoryList.map((item) {
                      return DropdownMenuItem<String>(
                          value: item,
                          child: Text(
                            item.toString(),
                          ));
                    }).toList(),
                    onChanged: (val) {
                      if (val is String) {
                        setState(() {
                          categoryValue = val;
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

  Widget _buildRadioButtons() {
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
                radioGroupValue = value!;
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
                radioGroupValue = value!;
              });
            },
          ),
        ),
      ],
    );
  }
}
