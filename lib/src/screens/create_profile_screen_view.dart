import 'package:flutter/material.dart';

class CreateProfileScreenView extends StatefulWidget {
  const CreateProfileScreenView({Key? key}) : super(key: key);
  @override
  State<CreateProfileScreenView> createState() => _CreateProfileScreenView();
}

class _CreateProfileScreenView extends State<CreateProfileScreenView> {
  TextEditingController controllerTextField = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: const [
            SizedBox(
              height: 40,
            ),
            Text(
              'OPEN VACANCIES',
              style: TextStyle(
                fontSize: 35,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
