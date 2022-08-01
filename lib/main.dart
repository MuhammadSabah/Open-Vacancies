import 'package:class_assignment_2/firebase_options.dart';
import 'package:class_assignment_2/src/firebase/firebase_methods.dart';
import 'package:class_assignment_2/src/screens/login_screen_view.dart';
import 'package:class_assignment_2/src/screens/open_vacancies_screen.dart';
import 'package:class_assignment_2/src/screens/register_screen_view.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData().copyWith(
        appBarTheme: const AppBarTheme(
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: Color.fromARGB(255, 209, 209, 209),
            statusBarIconBrightness: Brightness.dark,
            statusBarBrightness: Brightness.dark,
          ),
        ),
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.red,
          brightness: Brightness.light,
        ),
      ),
      debugShowCheckedModeBanner: false,
      home: Builder(
        builder: (context) {
          if (FirebaseMethods().isLoggedIn()) {
            return const OpenVacanciesScreen();
          } else {
            return const RegisterScreenView();
          }
        },
      ),
    );
  }
}
