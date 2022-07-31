import 'package:class_assignment_2/pages/Create_profile.dart';
import 'package:class_assignment_2/pages/rgister_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    routes: {
      '/':(context) => RegisterScreen(),
      '/SignUp':(context) => CreateProfileScreen(),
    },
    initialRoute: '/',
  ),
  );
}
