
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_project1/cubit/cubit.dart';
import 'package:flutter_project1/cubit/state.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({Key? key}) : super(key: key);

  //Define Controllers of Email and Password
  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var passController = TextEditingController();

  //Define Key of Form
  var keyForm = GlobalKey<FormState>();

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
                    key: keyForm,
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

                        TextFormField(
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "name is Empty";
                            }
                            return null;
                          },
                          controller: nameController,
                          keyboardType: TextInputType.name,
                          decoration: InputDecoration(
                            labelText: "Name",
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
                              return "Email is Empty";
                            }
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
                              return "Password is Empty";
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
                          child: MaterialButton(
                            onPressed: () {
                              if (keyForm.currentState!.validate()) {
                                print(emailController.text);
                                print(nameController.text);
                                print(passController.text);
                                AppCubit.get(context).userRegister(
                                    nameController.text,
                                    emailController.text,
                                    passController.text);
                              }
                              print(
                                  "Name : ${nameController.text}, Email : ${emailController.text}, Password : ${passController.text}");
                            },
                            child: Text(
                              "Sign Up",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            color: Colors.red,
                            textColor: Colors.white,
                          ),
                        ),
                        SizedBox(
                          height: 20.0,
                        ),
                        Text(
                          "Have an Account ",
                          style: TextStyle(
                            fontSize: 15.0,
                          ),
                        ),
                        TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: Text('GO Login')),
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
