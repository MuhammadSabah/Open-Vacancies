import 'package:class_assignment_2/src/firebase/auth_methods.dart';
import 'package:class_assignment_2/src/screens/home_screen_view.dart';
import 'package:flutter/material.dart';

class LoginScreenView extends StatefulWidget {
  const LoginScreenView({Key? key}) : super(key: key);
  @override
  State<LoginScreenView> createState() => _LoginScreenView();
}

class _LoginScreenView extends State<LoginScreenView> {
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
            Text(
              'Log in',
              style: TextStyle(
                fontSize: 36,
                color: Colors.grey.shade900,
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
                  const SizedBox(height: 35),
                  InkWell(
                    onTap: () async {
                      final validForm = _formKey.currentState!.validate();
                      if (validForm) {
                        final _output = await AuthMethods().signUpUser(
                          email: _emailController.text,
                          password: _passwordController.text,
                        );
                        if (_output == null) {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => HomeScreenView(),
                              ));
                        } else {
                          if (_output != null) {
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text('$_output'),
                              duration: const Duration(
                                milliseconds: 2300,
                              ),
                              backgroundColor: Colors.red.shade500,
                            ));
                          }
                        }
                      }
                    },
                    child: Ink(
                      width: MediaQuery.of(context).size.width,
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.all(
                          Radius.circular(10),
                        ),
                        color: Colors.green.shade400,
                      ),
                      child: const Text(
                        'Log in',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 26,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
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
