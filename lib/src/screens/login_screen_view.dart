import 'package:class_assignment_2/src/firebase/auth_methods.dart';
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
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 40,
            ),
            const Text(
              'LOGIN',
              style: TextStyle(
                fontSize: 35,
                color: Colors.black,
              ),
            ),
            const SizedBox(
              height: 60,
            ),
            Container(
              padding: const EdgeInsets.all(25),
              child: Form(
                key: _formKey,
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
                          filled: true,
                          fillColor: Color.fromARGB(255, 193, 193, 193),
                        )),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      padding: const EdgeInsets.all(12),
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                        color: Colors.grey,
                      ),
                      child: ElevatedButton(
                        onPressed: () async {
                          final validForm = _formKey.currentState!.validate();
                          if (validForm) {
                            await AuthMethods().logInUser(
                              email: _emailController.text,
                              password: _passwordController.text,
                            );
                          }
                        },
                        child: Text(
                          'Log in',
                          style: TextStyle(
                            fontSize: 26,
                            color: Colors.black,
                          ),
                        ),
                        style: ElevatedButton.styleFrom(
                          primary: Colors.grey,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
