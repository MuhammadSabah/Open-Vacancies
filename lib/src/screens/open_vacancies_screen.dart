import 'package:class_assignment_2/src/firebase/auth_methods.dart';
import 'package:flutter/material.dart';

class OpenVacanciesScreen extends StatefulWidget {
  const OpenVacanciesScreen({Key? key}) : super(key: key);

  @override
  State<OpenVacanciesScreen> createState() => _OpenVacanciesScreenState();
}

class _OpenVacanciesScreenState extends State<OpenVacanciesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          FirebaseMethods().logOutUser();
        },
        child: Center(
          child: Text(
            'Log out',
            style: TextStyle(
              color: Colors.red.shade400,
              fontSize: 22,
            ),
          ),
        ),
      ),
    );
  }
}
