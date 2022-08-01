import 'package:class_assignment_2/firebase_options.dart';
import 'package:class_assignment_2/src/firebase/create_profile_dao.dart';
import 'package:class_assignment_2/src/firebase/user_dao.dart';
import 'package:class_assignment_2/src/screens/create_profile_screen_view.dart';
import 'package:class_assignment_2/src/screens/open_vacancies_screen.dart';

import 'package:class_assignment_2/src/screens/register_screen_view.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          lazy: false,
          create: (_) => UserDao(),
        )
      ],
      child: MaterialApp(
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
          home: Consumer<UserDao>(
            builder: (context, profileManager, child) {
              if (profileManager.isLoggedIn()) {
                if (profileManager.didCreateProfile == true) {
                  return const OpenVacanciesScreen();
                } else {
                  return const CreateProfileScreenView();
                }
              } else {
                return const RegisterScreenView();
              }
            },
          )),
    );
  }
}
