import 'package:class_assignment_2/src/firebase/user_auth_dao.dart';
import 'package:class_assignment_2/src/screens/login_screen_view.dart';
import 'package:flutter/material.dart';

class RegisterForm extends StatefulWidget {
  const RegisterForm({
    Key? key,
    required this.formKey,
    required this.emailController,
    required this.passwordController,
  }) : super(key: key);
  final formKey;
  final emailController;
  final passwordController;
  @override
  State<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  bool _obscureText = true;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget.formKey,
      child: Column(
        children: [
          TextFormField(
              validator: (String? value) {
                if (value == null || widget.emailController.text.isEmpty) {
                  return 'Email Required';
                } else {
                  return null;
                }
              },
              controller: widget.emailController,
              keyboardType: TextInputType.emailAddress,
              decoration: const InputDecoration(
                hintText: 'Your Email',
                counterText: ' ',
                filled: true,
                fillColor: Color.fromARGB(255, 209, 209, 209),
              )),
          const SizedBox(
            height: 30,
          ),
          TextFormField(
            obscureText: _obscureText,
            validator: (String? value) {
              if (value == null || widget.passwordController.text.isEmpty) {
                return 'Password Required';
              } else {
                return null;
              }
            },
            controller: widget.passwordController,
            keyboardType: TextInputType.visiblePassword,
            decoration: InputDecoration(
              hintText: 'Your Password',
              suffixIcon: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  IconButton(
                    splashRadius: 20,
                    onPressed: () {
                      setState(() {
                        _obscureText = !_obscureText;
                      });
                    },
                    icon: _obscureText
                        ? Icon(
                            Icons.visibility_off,
                            color: Colors.grey.shade800,
                            size: 20,
                          )
                        : Icon(
                            Icons.visibility,
                            color: Colors.grey.shade800,
                            size: 20,
                          ),
                  ),
                ],
              ),
              counterText: ' ',
              filled: true,
              fillColor: Color.fromARGB(255, 209, 209, 209),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          const SizedBox(height: 35),
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: 56,
            child: ElevatedButton(
              onPressed: () async {
                final navigator = Navigator.of(context);
                final validForm = widget.formKey.currentState!.validate();
                if (validForm) {
                  final output = await UserAuthDao().signUpUser(
                    email: widget.emailController.text,
                    password: widget.passwordController.text,
                  );
                  if (output == null) {
                    navigator.push(MaterialPageRoute(
                      builder: (context) => const LoginScreenView(),
                    ));
                  } else {
                    if (output != null) {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text('$output'),
                        duration: const Duration(
                          milliseconds: 2300,
                        ),
                        backgroundColor: Colors.red.shade500,
                      ));
                    }
                  }
                }
              },
              child: const Text(
                'Sign up',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
