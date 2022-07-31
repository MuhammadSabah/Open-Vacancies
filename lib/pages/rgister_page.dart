import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Register',
              style: TextStyle(
                fontSize: 30,
                color: Colors.blue
              ),
            ),
            const SizedBox(height: 100,),
            //Username TextField
           const TextField(
            decoration: InputDecoration(
            border: OutlineInputBorder(),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.blue)
            ),
            hintText: 'Username'
            ),
           ),
           const SizedBox(height: 44,),
           //Password TextField 
           const TextField(
            obscureText: true,
            decoration:  InputDecoration(
            border: OutlineInputBorder(),
            enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.blue),),
            hintText: 'Paswword'
            ),
           ),
            const SizedBox(height: 40,),
            //Button
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.blue
              ),
              onPressed: (){
                // Navigator.push()
              },
              child: const Padding(
                padding: EdgeInsets.all(15),
                child: Text('Sign Up'),
              ),
            ),
          ],
          ),
        ),
      ),
    );
  }
}
  