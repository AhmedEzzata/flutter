
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_prjects/cubit/cubit.dart';
import 'package:flutter_prjects/cubit/states.dart';

class Cart extends StatelessWidget {
  Cart({Key? key}) : super(key: key);

  // @override
  // void initState() {
  // // TODO: implement initState
  // super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
        listener: (BuildContext context, AppStates state) {},
        builder: (BuildContext context, AppStates state) {
          AppCubit cubit = AppCubit.get(context);
          return SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    width: 120,
                    height: 120,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        image: DecorationImage(
                          image: NetworkImage(
                              'https://res.cloudinary.com/sjm/image/upload/v1588341750/fashion/pv3lspn6jw8hqceaebj7.jpg'),
                          fit: BoxFit.cover,
                        )),
                  ),
                  SizedBox(
                    width: 20.0,
                  ),
                  Expanded(
                    child: Container(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text('Title',
                              style: TextStyle(
                                fontSize: 18.0,
                                fontWeight: FontWeight.w600,
                              )),
                          Text(
                            'Man White T-shirt',
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              color: Colors.grey,
                            ),
                          ),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  '200 EG',
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
                                      fontSize: 18.0,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.red),
                                ),
                                // SizedBox(
                                //   width: 20.0,
                                // ),
                                IconButton(
                                    onPressed: () {
                                      AppCubit.get(context).minus();
                                    },
                                    icon: Icon(
                                      Icons.indeterminate_check_box_rounded,
                                      color: Colors.red,
                                      size: 20,
                                    )),
                                // SizedBox(
                                //   width: 10.0,
                                // ),
                                Text(
                                  '${AppCubit.get(context).counter}',
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                                // SizedBox(
                                //   width: 10.0,
                                // ),
                                IconButton(
                                    onPressed: () {
                                      AppCubit.get(context).plus();
                                    },
                                    icon: Icon(
                                      Icons.add_box_sharp,
                                      color: Colors.red,
                                      size: 20,
                                    )),
                              ])
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }
}
