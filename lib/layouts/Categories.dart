import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_prjects/cubit/cubit.dart';
import 'package:flutter_prjects/cubit/states.dart';
import 'package:flutter_prjects/shared/components/components.dart';

import '../models/category.dart';

class Categories extends StatelessWidget {
  Categories({Key? key}) : super(key: key);
  // List<Category> data = [
  // //   Category(
  // //       id: 1,
  // //       image:
  // //           'https://res.cloudinary.com/sjm/image/upload/v1588341750/fashion/pv3lspn6jw8hqceaebj7.jpg',
  // //       name: 'Fashion'),
  // //   Category(
  // //       id: 2,
  // //       image:
  // //           'https://ecommerce.ccc2020.fr/wp-content/uploads/2020/10/electronic-gadgets.jpeg',
  // //       name: 'Electronics'),
  // //   Category(
  // //       id: 3,
  // //       image:
  // //           'https://imagesvc.meredithcorp.io/v3/mm/image?url=https%3A%2F%2Fstatic.onecms.io%2Fwp-content%2Fuploads%2Fsites%2F37%2F2020%2F09%2F11%2Fbeauty-awards-body.jpg',
  // //       name: 'Bady Products'),
  // //   Category(
  // //       id: 4,
  // //       image:
  // //           'https://img1.10bestmedia.com/Images/Photos/385821/The-Fresh-Market_54_990x660.jpg',
  // //       name: 'Supermarket'),
  // //   Category(
  // //       id: 5,
  // //       image:
  // //           'https://fdn.gsmarena.com/imgroot/news/19/12/phones-of-the-decade/-727w2/gsmarena_001.jpg',
  // //       name: 'Phones'),
  // //   Category(
  // //       id: 6,
  // //       image:
  // //           'https://www.luluhypermarket.com/medias/health-beauty-Facial-SkinCare-1065x474.jpg?context=bWFzdGVyfHJvb3R8MjU1NjY0fGltYWdlL2pwZWd8aDcwL2g1Ni8xMjE0MjAxODAwMjk3NHxmNjcyNjM5YWY2NWMxMDQyMTczOTE1YzFmMTI3ZTM2ZDE5MjcyMDQ2YzJmMzM2ZmE2YTA1MGUzNDkwYWM0NzRh',
  // //       name: 'Health & Beauty'),
  // // ];

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return Container(
          color: Colors.grey[300],
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: GridView.count(
                //to animate the Scroll to be Bouncing
                physics: BouncingScrollPhysics(),
                crossAxisCount: 2,
                mainAxisSpacing: 10.0,
                crossAxisSpacing: 10.0,
                childAspectRatio: 1 / 0.7,
                children: List.generate(
                  AppCubit.get(context).Categorylist.length,
                      (index) => buildCategoriesItems(
                      AppCubit.get(context).Categorylist[index]),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
