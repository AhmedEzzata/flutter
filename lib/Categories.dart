import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class Categories extends StatelessWidget {
   Categories({Key? key}) : super(key: key);
List <UserModel>data=[
  UserModel(image: 'https://res.cloudinary.com/sjm/image/upload/v1588341750/fashion/pv3lspn6jw8hqceaebj7.jpg'
      , name: 'Fashion'),
  UserModel(image: 'https://ecommerce.ccc2020.fr/wp-content/uploads/2020/10/electronic-gadgets.jpeg'
      , name: 'Electronics'),
  UserModel(image: 'https://imagesvc.meredithcorp.io/v3/mm/image?url=https%3A%2F%2Fstatic.onecms.io%2Fwp-content%2Fuploads%2Fsites%2F37%2F2020%2F09%2F11%2Fbeauty-awards-body.jpg'
      , name: 'Bady Products'),
  UserModel(image: 'https://img1.10bestmedia.com/Images/Photos/385821/The-Fresh-Market_54_990x660.jpg'
      , name: 'Supermarket'),
  UserModel(image: 'https://fdn.gsmarena.com/imgroot/news/19/12/phones-of-the-decade/-727w2/gsmarena_001.jpg'
      , name: 'Phones'),
  UserModel(image: 'https://www.luluhypermarket.com/medias/health-beauty-Facial-SkinCare-1065x474.jpg?context=bWFzdGVyfHJvb3R8MjU1NjY0fGltYWdlL2pwZWd8aDcwL2g1Ni8xMjE0MjAxODAwMjk3NHxmNjcyNjM5YWY2NWMxMDQyMTczOTE1YzFmMTI3ZTM2ZDE5MjcyMDQ2YzJmMzM2ZmE2YTA1MGUzNDkwYWM0NzRh'
      , name: 'Health & Beauty'),

];
  @override
  Widget build(BuildContext context) {
    return Container(
      child:GridView.count(crossAxisCount: 2,
        mainAxisSpacing:2 ,childAspectRatio: (1/1.2),
        children: List.generate(data.length, (index) => buildUserItems(data[index])),
      ),
      color: Colors.grey,
    );

  }
}
Widget buildUserItems(UserModel model)=> Padding(
padding: const EdgeInsets.all(5.0),
child:Container(
  color: Colors.white,

child: Stack(
alignment:Alignment.center ,
children: [
Image(
image: NetworkImage('${model.image}'),
height:200.0,
width: double.infinity,
fit: BoxFit.fill,
),
Container(

color: Colors.grey.withOpacity(.7),
child: Text(
'${model.name}',
textAlign: TextAlign.center,
style: TextStyle(fontSize:20.0,
color: Colors.white)
),
),


],
),
) ,
);
class UserModel{
  String name;
  String image;
  UserModel({required this.image,required this.name});
}