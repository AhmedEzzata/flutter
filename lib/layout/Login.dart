
import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_project1/cubit/cubit.dart';
import 'package:flutter_project1/cubit/state.dart';
import 'package:flutter_project1/layout/sheard/components.dart';

import 'Signup.dart';


class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);

  //Define Controllers of Email and Password
  var emailController = TextEditingController();
  var passController = TextEditingController();

  //Define Key of Form
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          body: SafeArea(
            child: Container(
              width: double.infinity,
              child: SingleChildScrollView(
                //to animate the Scroll to be Bouncing
                physics: BouncingScrollPhysics(),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Form(
                    key: formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image(
                          image: NetworkImage(
                              "https://1000logos.net/wp-content/uploads/2017/04/Color-Orange-Logo.jpg"),
                          height: 150,
                          width: 150,
                        ),
                        Image(
                          width: 250.0,
                          height: 150.0,
                          image: NetworkImage(
                              "https://www.amit-learning.com/assets/logo.png"),
                        ),
                        SizedBox(
                          height: 20.0,
                        ),
                        TextFormField(
                          //To prevent user to Enter any thing else Numbers and Characters and @ .
                          inputFormatters: <TextInputFormatter>[
                            FilteringTextInputFormatter.allow(
                              RegExp("[0-9a-zA-Z@a-zA-Z.a-zA-Z]"),
                            ),
                          ],
                          //to Validate Email input
                          validator: (value) {
                            if (value!.replaceAll(' ', '').isEmpty) {
                              return "Please, Enter Your Email";
                            }
                            //We Can validate all characters and ask the user to enter valid Email if he enter some characters not valid
                            // else if (value.contains('+')||value.contains('/')){
                            //   return "Please, Enter Valid Email";
                            // }
                            return null;
                          },
                          controller: emailController,
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                            labelText: "Email",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(50.0),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20.0,
                        ),
                        TextFormField(
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Please, Enter Your Password";
                            }
                            return null;
                          },
                          maxLength: 8,
                          controller: passController,
                          keyboardType: TextInputType.visiblePassword,
                          obscureText: AppCubit.get(context).passIcon,
                          decoration: InputDecoration(
                            labelText: "Password",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(50.0),
                            ),
                            suffixIcon: IconButton(
                              icon: AppCubit.get(context).passIcon
                                  ? Icon(Icons.remove_red_eye)
                                  : Icon(Icons.remove_red_eye_outlined),
                              onPressed: () {
                                AppCubit.get(context).passwordSuffixChanged(
                                    !AppCubit.get(context).passIcon);
                              },
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20.0,
                        ),
                        Container(
                          width: 200.0,
                          child: ConditionalBuilder(
                            condition: state is! LoginLoading,
                            builder: (context) => MaterialButton(
                              onPressed: () {
                                if (formKey.currentState!.validate()) {
                                  print(
                                    "Email : ${emailController.text} Password : ${passController.text}",
                                  );
                                  AppCubit.get(context).userLogin(emailController.text, passController.text);
                                }
                              },
                              child: Text(
                                "Login",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              color: Colors.red,
                              textColor: Colors.white,
                            ),
                            fallback: (context) => Center(child: CircularProgressIndicator()),
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SignUpScreen()),
                            );
                          },
                          child: Text('Go SignUp'),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
