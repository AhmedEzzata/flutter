import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Rigster.dart';

class Login extends StatefulWidget {
  Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  var emailcontroler = TextEditingController();

  var passcontroler = TextEditingController();

  var fromkey = GlobalKey<FormState>();

  bool obscureText = true;
int indexnum=0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: SingleChildScrollView(
                child: Form(
              key: fromkey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image(
                    image: NetworkImage(
                        "https://www.amit-learning.com/assets/logo.png"),
                    height: 250,
                    width: 250,
                  ),
                  TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'email is empty';
                      }
                      else if(!value.contains('@')){
                        return 'Valed Email';
                      }
                      return null;
                    },
                    controller: emailcontroler,
                    decoration: InputDecoration(
                      labelText: 'Enter Email',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(50)),
                    ),
                  ),
                  SizedBox(height: 30.0),
                  TextFormField(
                    maxLength: 8,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'pass is empty';

                      }

                      return null;
                    },
                    controller: passcontroler,
                    decoration: InputDecoration(
                      labelText: 'Enter Pass',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(50)),
                      suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            obscureText = !obscureText;
                          });
                          print('eye');
                        },
                        icon: obscureText?Icon(Icons.remove_red_eye_outlined):Icon(Icons.remove_red_eye),
                      ),
                    ),
                    obscureText: obscureText,
                  ),
                  SizedBox(height: 30.0),
                  Container(
                    width: 200,
                    child: MaterialButton(
                      onPressed: () {
                        if (fromkey.currentState!.validate()) {
                          print(emailcontroler.text);
                          print(passcontroler.text);
                        }
                        ;
                      },
                      child: Text('Login'),
                      color: Colors.red,
                      height: 40,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Rigster()),
                      );
                    },
                    child: Text('Go SignUp'),
                  ),
                ],
              ),
            ))),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        elevation: 15.0,
        currentIndex: indexnum,
        onTap: (index) {
          setState(() {
            indexnum = index;
          });
        },
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.category), label: 'Categories'),
          BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart_outlined), label: 'Cart'),
          BottomNavigationBarItem(icon: Icon(Icons.menu), label: 'Menu')
        ],
      ),
    );

  }
}
