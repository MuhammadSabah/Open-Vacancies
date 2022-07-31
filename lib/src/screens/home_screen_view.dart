import 'package:flutter/material.dart';

class HomeScreenView extends StatefulWidget {
  const HomeScreenView({Key? key}) : super(key: key);
  @override
  State<HomeScreenView> createState() => _HomeScreenView();
}

class _HomeScreenView extends State<HomeScreenView> {
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
