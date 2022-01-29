import 'package:flutter/material.dart';
import 'package:flutter_prjects/models/category.dart';
import 'package:flutter_prjects/models/product.dart';

Widget buildProductItems(Product model) => Padding(
  padding: const EdgeInsets.all(8.0),
  child: Container(
    color: Colors.white,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image(
          image: NetworkImage('${model.image}'),
          height: 200.0,
          width: 200.0,
          // fit: BoxFit.cover,
        ),
        Text('${model.name}',
            textAlign: TextAlign.start,
            style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
                color: Colors.black)),
        Text('${model.description}',
            textAlign: TextAlign.start,
            style: TextStyle(fontSize: 11.0, color: Colors.black)),
        Row(
          children: [
            IconButton(onPressed: (){}, icon:Icon(Icons.add_box_sharp, color: Colors.red) ),
            Spacer(),
            Text(
              '${model.price}',
              textAlign: TextAlign.start,
              style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.red),
            )
          ],
        ),
      ],
    ),
  ),
);

Widget buildCategoriesItems(Category model)=> Padding(
  padding: const EdgeInsets.all(5.0),
  child:Container(
    color: Colors.white,

    child: Stack(
      alignment:Alignment.center ,
      children: [
        Image(
          image: NetworkImage("${model.catImageURL}"),
          height:200.0,
          width: double.infinity,
          fit: BoxFit.fill,
        ),
        Container(

          color: Colors.grey.withOpacity(.7),
          child: Text(
              "${model.catName}",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize:20.0,
                  color: Colors.white)
          ),
        ),


      ],
    ),
  ) ,
);
// Widget buildCarItems(){
//   return SafeArea(
//     child: Padding(
//       padding: const EdgeInsets.all(20.0),
//       child: Row(
//         mainAxisSize: MainAxisSize.min,
//         children: [
//           Container(
//             width: 120,
//             height: 120,
//             decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(10.0),
//                 image: DecorationImage(
//                   image: NetworkImage(
//                       'https://res.cloudinary.com/sjm/image/upload/v1588341750/fashion/pv3lspn6jw8hqceaebj7.jpg'),
//                   fit: BoxFit.cover,
//                 )),
//           ),
//           SizedBox(
//             width: 20.0,
//           ),
//           Expanded(
//             child: Container(
//               child: Column(
//                 mainAxisSize: MainAxisSize.min,
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 mainAxisAlignment: MainAxisAlignment.start,
//                 children: [
//                   Text('Title',
//                       style: TextStyle(
//                         fontSize: 18.0,
//                         fontWeight: FontWeight.w600,
//                       )),
//                   Text(
//                     'Man White T-shirt',
//                     maxLines: 2,
//                     overflow: TextOverflow.ellipsis,
//                     style: TextStyle(
//                       color: Colors.grey,
//                     ),
//                   ),
//                   Row(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         Text(
//                           '200 EG',
//                           textAlign: TextAlign.start,
//                           style: TextStyle(
//                               fontSize: 18.0,
//                               fontWeight: FontWeight.bold,
//                               color: Colors.red),
//                         ),
//                         // SizedBox(
//                         //   width: 20.0,
//                         // ),
//                         IconButton(
//                             onPressed: () {
//                               AppCubit.get(context).minus();
//                             },
//                             icon: Icon(
//                               Icons.indeterminate_check_box_rounded,
//                               color: Colors.red,
//                               size: 20,
//                             )),
//                         // SizedBox(
//                         //   width: 10.0,
//                         // ),
//                         Text(
//                           '${AppCubit.get(context).counter}',
//                           style: TextStyle(
//                               fontSize: 20,
//                               fontWeight: FontWeight.bold),
//                         ),
//                         // SizedBox(
//                         //   width: 10.0,
//                         // ),
//                         IconButton(
//                             onPressed: () {
//                               AppCubit.get(context).plus();
//                             },
//                             icon: Icon(
//                               Icons.add_box_sharp,
//                               color: Colors.red,
//                               size: 20,
//                             )),
//                       ])
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//     ),
//   );
// }