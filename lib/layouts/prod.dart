import 'package:flutter/material.dart';
import 'package:flutter_prjects/cubit/cubit.dart';
class Home2 extends StatelessWidget {
  const Home2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
        child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Image(
              image: NetworkImage(
                  "https://1000logos.net/wp-content/uploads/2017/04/Color-Orange-Logo.jpg"),
              height: 100,
              width: 100,
            ),
            Text(
              'smartDisplay'
            ),
            Text(
              'context le-555fgggfghvh'
            ),
            Divider(height: 30,color: Colors.black,thickness: 30,),
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
        )
    )
        )
    );
  }
}
