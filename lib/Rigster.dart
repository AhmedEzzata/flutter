import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_prjects/Home.dart';
import 'package:flutter_prjects/Login.dart';

import 'Cart.dart';
import 'Categories.dart';
import 'Menu.dart';
class Rigster extends StatefulWidget {
   Rigster({Key? key}) : super(key: key);

  @override
  State<Rigster> createState() => _RigsterState();
}

class _RigsterState extends State<Rigster> {
  int indexnum=0;
   bool obscureText = true;
  var emailcontroler = TextEditingController();

  var passcontroler = TextEditingController();

  var fromkey = GlobalKey<FormState>();


   @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
          child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: SingleChildScrollView(

                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image(image: NetworkImage(
                            "https://www.amit-learning.com/assets/logo.png"),
                          height: 250,
                          width: 250,),

                        TextFormField(
                          decoration: InputDecoration(
                            labelText: 'Name',
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(50)),
                          ),
                        ),
                        SizedBox(
                            height: 30.0),
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
                          decoration: InputDecoration(
                            labelText: 'Email',
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(50)),
                          ),
                        ),
                        SizedBox(
                            height: 30.0),
                        TextFormField(
                          maxLength: 8,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'pass is empty';

                            }

                            return null;
                          },
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

                        SizedBox(
                            height: 30.0),
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
                           child: Text('SignUp'), color: Colors.red,height:40 ,),
                        ),
                        SizedBox(
                            height: 30.0),
                        Text('Have an Acount'),
                        TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: Text('GO Login'))


                      ]
                  ),
                ),


              ),
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
