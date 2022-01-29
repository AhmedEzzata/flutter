import 'package:flutter/material.dart';
import 'package:flutter_prjects/layouts/Home.dart';

import 'layouts/Categories.dart';
import 'Login.dart';
import 'Rigster.dart';
import 'navigation.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      debugShowCheckedModeBanner: false,
      //home:  Rigster(),
     //home:  Login(),
      //home:Categories(),
      //home:Home(),
      home:Navigation(),
    );
  }
}

