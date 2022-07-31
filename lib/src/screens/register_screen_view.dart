import 'package:flutter/material.dart';

class RegisterScreenView extends StatefulWidget {
  const RegisterScreenView({Key? key}) : super(key: key);
  @override
  State<RegisterScreenView> createState() => _RegisterScreenView();
}

class _RegisterScreenView extends State<RegisterScreenView> {
  
  
  TextEditingController controllerPhoneNumber = TextEditingController();
  TextEditingController controllerPassword = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 40,),
            Text('Register',style: 
            TextStyle(fontSize: 35, color: Colors.black,)
            ,),
            SizedBox(height: 60,),
            Container(
              padding: EdgeInsets.all(25),
              child: Column(
                children: [
                   TextField(
                    
                      // changed this
                      controller: controllerPhoneNumber,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Color.fromARGB(255, 193, 193, 193),
                        
                        )
                    ),
                    SizedBox(height: 30,),
                    TextField(
                      
                        // changed this
                        controller: controllerPassword,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Color.fromARGB(255, 193, 193, 193),
                          
                          )
                      ),
                      SizedBox(height: 10,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text('FORGET PASSWORD',style: 
                            TextStyle(fontSize:16, color: Colors.black,)
                            ,),
                        ],
                      ),
                      Container(
                        padding: EdgeInsets.all(12),
                        color: Colors.grey,
                        child: ElevatedButton(
                          onPressed: () {},
                          child: Text('LOGIN',
                              style: TextStyle(fontSize:26, color: Colors.black,)),
                          style: ElevatedButton.styleFrom(
                            primary: Colors.grey,
                            
                           
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
