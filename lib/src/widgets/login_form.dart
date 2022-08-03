import 'package:class_assignment_2/src/firebase/user_auth_dao.dart';
import 'package:class_assignment_2/src/screens/loading_screen.dart';
import 'package:flutter/material.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({
    Key? key,
  }) : super(key: key);

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  bool _obscureText = true;
  @override
  Widget build(BuildContext context) {
    return Form(
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
              if (value == null || _passwordController.text.isEmpty) {
                return 'Password Required';
              } else {
                return null;
              }
            },
            controller: _passwordController,
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
              fillColor: const Color.fromARGB(255, 209, 209, 209),
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
                final validForm = _formKey.currentState!.validate();
                if (validForm) {
                  final output = await UserAuthDao().logInUser(
                    email: _emailController.text,
                    password: _passwordController.text,
                  );
                  // If there were no errors
                  if (output == null) {
                    navigator.push(MaterialPageRoute(
                      builder: (context) => const LoadingScreen(),
                    ));
                  }
                  {
                    if (output != null) {
                      // If there were errors
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text(output),
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
                'Log in',
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
