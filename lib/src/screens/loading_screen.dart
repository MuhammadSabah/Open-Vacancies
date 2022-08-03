import 'package:class_assignment_2/src/firebase/user_profile_dao.dart';
import 'package:class_assignment_2/src/screens/create_profile_screen_view.dart';
import 'package:class_assignment_2/src/screens/open_vacancies_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({Key? key}) : super(key: key);

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();
    navigationResult();
  }

  Future<bool> userCreateAccountStatus() async {
    return await Provider.of<UserProfileDao>(context, listen: false)
            .didUserCreateProfileBefore() ??
        false;
  }

  void navigationResult() async {
    final navigator = Navigator.of(context);
    bool result = await userCreateAccountStatus();
    if (result) {
      navigator.push(MaterialPageRoute(
        builder: (context) => const OpenVacanciesScreen(),
      ));
    } else {
      navigator.push(MaterialPageRoute(
        builder: (context) => const CreateProfileScreenView(),
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
