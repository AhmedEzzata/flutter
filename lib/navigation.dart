import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_prjects/Cart.dart';
import 'package:flutter_prjects/Categories.dart';
import 'package:flutter_prjects/Home.dart';
import 'package:flutter_prjects/Menu.dart';

class Navigation extends StatefulWidget {
  Navigation({Key? key}) : super(key: key);

  @override
  State<Navigation> createState() => _NavigationState();
}

class _NavigationState extends State<Navigation> {
  List<Widget> screens = [
    Home(),
    Categories(),
    Cart(),
    Menu(),
  ];

  int indexnum = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[indexnum],
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
