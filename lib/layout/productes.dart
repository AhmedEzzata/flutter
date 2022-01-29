import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_project1/cubit/cubit.dart';
import 'package:flutter_project1/cubit/state.dart';
import 'package:flutter_project1/layout/sheard/components.dart';

import 'home.dart';

class ProductsScreen extends StatelessWidget {
  ProductsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return ConditionalBuilder(
          condition: state is! GetProductsDataLoading,
          builder: (context) => Container(
            color: Colors.grey[300],
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: GridView.count(
                //to animate the Scroll to be Bouncing
                physics: BouncingScrollPhysics(),
                crossAxisCount: 2,
                mainAxisSpacing: 10.0,
                crossAxisSpacing: 10.0,
                childAspectRatio: 1 / 1.80,
                children: List.generate(
                  AppCubit.get(context).productsList.length,
                      (index) => InkWell(
                      onTap: () {
                        print(
                            'Click ${AppCubit.get(context).productsList[index].id}');
                        navigateTo(
                          context,
                          ProductItemScreen(
                            product: AppCubit.get(context).productsList[index],
                          ),
                        );
                      },
                      child: buildProductItem(
                          AppCubit.get(context).productsList[index])),
                ),
              ),
            ),
          ),
          fallback: (context) => Center(child: CircularProgressIndicator()),
        );
      },
    );
  }
}
