import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_prjects/cubit/cubit.dart';
import 'package:flutter_prjects/cubit/states.dart';

import 'Rigster.dart';

class Login extends StatelessWidget {
  Login({Key? key}) : super(key: key);
  var emailcontroler = TextEditingController();

  var passcontroler = TextEditingController();

  var fromkey = GlobalKey<FormState>();

  int indexnum = 0;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppCubit(),
      child: BlocConsumer<AppCubit,AppStates>(
        listener: (context, state) {},
        builder: (context, state) {
          AppCubit cubit = AppCubit.get(context);
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
                              "https://1000logos.net/wp-content/uploads/2017/04/Color-Orange-Logo.jpg"),
                          height: 100,
                          width: 100,
                        ),
                        Image(
                          image: NetworkImage(
                              "https://www.amit-learning.com/assets/logo.png"),
                          height: 100,
                          width: 250,
                        ),
                        SizedBox(
                            height: 30.0),
                        TextFormField(
                          keyboardType: TextInputType.emailAddress,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'email is empty';
                            } else if (!value.contains('@')) {
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
                        SizedBox(height: 25.0),
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
                                cubit.obscurechange(!cubit.obscureText);
                                print('eye');
                              },
                              icon: cubit.obscureText
                                  ? Icon(Icons.remove_red_eye_outlined)
                                  : Icon(Icons.remove_red_eye),
                            ),
                          ),
                          obscureText: cubit.obscureText,
                        ),
                        SizedBox(height: 25.0),
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
                              MaterialPageRoute(
                                  builder: (context) => Rigster()),
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
                cubit.changeIndex(index);
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
        },
      ),
    );
  }
}
