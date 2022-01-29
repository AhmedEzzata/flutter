import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_prjects/cubit/states.dart';
import 'package:flutter_prjects/models/category.dart';
import 'package:flutter_prjects/shared/components/API.dart';

import '../layouts/Cart.dart';
import '../layouts/Categories.dart';
import '../layouts/Home.dart';
import '../layouts/Menu.dart';

class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(AppInitialStates());

  static AppCubit get(context) => BlocProvider.of(context);
  int counter=1;
void minus(){
  counter--;
  emit(Appcounterminus());
}
void plus(){
  counter++;
  emit(Appcounterplus());
}

  List<Widget> screens = [
    Home(),
    Categories(),
    Cart(),
    Menu(),
  ];
  List <Category> Categorylist = [];

  int indexnum = 0;

  void changeIndex(index) {
    indexnum = index;
    emit(AppChangeButtom());
  }

  bool obscureText = true;

  void obscurechange(bool obscure) {
    obscureText = obscure;
    emit(AppChangeObscure());
  }

  // void getCategoryData() {
  //   emit(AppGetCategoryDataLoading());
  //   if (Categorylist.length == 0) {
  //     DioHelper.getData(
  //         url: 'api/categories',
  //         query: {
  //           '': '',
  //         }).then((value) {
  //       for (final catMap in value.data['categories']) {
  //         Category cat = Category.fromJson(catMap);
  //         Categorylist.add(cat);
  //       }
  //       print(Categorylist.toString());
  //       emit(AppGetCategoryDataSuccess());
  //     }).catchError((error) {
  //       print('Error getData: $error');
  //       emit(AppGetCategoryDataError(error));
  //     });
  //   } else {
  //     emit(AppGetCategoryDataSuccess());
  //   }
  // }

  void getCategoriesData() {
    emit(AppGetCategoryDataLoading());
    if (Categorylist.length == 0) {
      DioHelper.getData(url: 'api/categories', query: {
        '': '',
      }).then((value) {
        print(value.data);
        // for (final catMap in value.data['categories']) {
        //   Category cat = Category.fromJson(catMap);
        //   Categorylist.add(cat);
        // }
        // print(value.data.toString());
        // categories=value.data['categories'];
        //  print(categoriesList.toString());
        emit(AppGetCategoryDataSuccess());
      }).catchError((error) {
        print('Error getData : $error');
        emit(AppGetCategoryDataError(error));
      });
    } else {
      emit(AppGetCategoryDataSuccess());
    }
  }

}