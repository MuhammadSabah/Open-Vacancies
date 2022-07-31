import 'package:class_assignment_2/src/firebase/auth_methods.dart';
import 'package:class_assignment_2/src/screens/home_screen_view.dart';
import 'package:flutter/material.dart';

class RegisterScreenView extends StatefulWidget {
  const RegisterScreenView({Key? key}) : super(key: key);
  @override
  State<RegisterScreenView> createState() => _RegisterScreenView();
}

class _RegisterScreenView extends State<RegisterScreenView> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              height: 40,
            ),
            const Text(
              'Register',
              style: TextStyle(
                fontSize: 35,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 35),
            Container(
              padding: const EdgeInsets.all(25),
              child: Column(
                children: [
                  TextFormField(
                      validator: (String? value) {
                        if (value == null || _emailController.text.isEmpty) {
                          return 'Email Required';
                        } else {
                          return null;
                        }
                      },
                      controller: _emailController,
                      decoration: const InputDecoration(
                        counterText: ' ',
                        filled: true,
                        fillColor: Color.fromARGB(255, 193, 193, 193),
                      )),
                  const SizedBox(
                    height: 30,
                  ),
                  TextFormField(
                    validator: (String? value) {
                      if (value == null || _emailController.text.isEmpty) {
                        return 'Password Required';
                      } else {
                        return null;
                      }
                    },
                    controller: _passwordController,
                    decoration: const InputDecoration(
                      counterText: ' ',
                      filled: true,
                      fillColor: Color.fromARGB(255, 193, 193, 193),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: const [
                      Text(
                        'FORGET PASSWORD',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 35),
                  InkWell(
                    onTap: () async {
                      final validForm = _formKey.currentState!.validate();
                      if (validForm) {
                        await AuthMethods().signUpUser(
                          email: _emailController.text,
                          password: _passwordController.text,
                        );
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => HomeScreenView(),
                            ));
                      }
                    },
                    child: Ink(
                      padding: const EdgeInsets.all(12),
                      color: Colors.grey,
                      child: const Text(
                        'Sign up',
                        style: TextStyle(
                          fontSize: 26,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
