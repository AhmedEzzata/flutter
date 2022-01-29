//import 'dart:html';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_prjects/layouts/Cart.dart';
import 'package:flutter_prjects/layouts/Categories.dart';
import 'package:flutter_prjects/layouts/Home.dart';
import 'package:flutter_prjects/layouts/Menu.dart';
import 'package:flutter_prjects/cubit/cubit.dart';
import 'package:flutter_prjects/cubit/states.dart';

class Navigation extends StatelessWidget{
  Navigation({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context)=> AppCubit()..getCategoriesData(),
      child: BlocConsumer<AppCubit,AppStates>(
       listener: (BuildContext context, AppStates state){},
        builder: (BuildContext context, AppStates state){
         AppCubit cubit=  AppCubit.get(context);
         return  Scaffold(
           body: cubit.screens[cubit.indexnum],
           bottomNavigationBar: BottomNavigationBar(
             type: BottomNavigationBarType.fixed,
             elevation: 15.0,
             currentIndex: cubit.indexnum,
             onTap: (index) {
               cubit.changeIndex(index);
               // setState(() {
               // cubit.changeIndex(index);
               // });
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
