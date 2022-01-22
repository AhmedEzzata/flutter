import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  Home({Key? key}) : super(key: key);
  List<UserModel> data = [
    UserModel(
        image:
            'https://pyxis.nymag.com/v1/imgs/8a2/af6/746cee68d6644139f51e8f5165131541c2-hanes-t-shirt.2x.rsquare.w600.jpg',
        name: 'Man White T-shirt', description: 'Man White Regular fit',price: '200EG'),
    UserModel(
        image:
            'https://matalan-content.imgix.net/uploads/asset_file/asset_file/371049/1641458889.2249634-S2887220_C47Q_Alt1.jpg?ixlib=rails-2.1.4&cs=tinysrgb&auto=compress%2Cformat&fm=pjpg&w=260&s=d80ec29a9d1d59765d745afbe15b6e6a',
        name: 'Shirt Dress Short', description: 'Max printed A-line shirt',price: '260EG',),
    UserModel(
        image:
            'https://res.cloudinary.com/dppy0fyoh/image/upload/v1637066506/socks-merino-wool_vauun5.jpg',
        name: 'Three Men Socks', description: 'Solo Bundle OF Three',price: '72EG'),
    UserModel(
        image:
        'https://assets.ajio.com/medias/sys_master/root/hd4/h99/14092964397086/-1117Wx1400H-460455972-black-MODEL.jpg',
        name: 'Activ Round Toe', description: 'Activ Round  Toe',price: '600EG'),
    UserModel(
        image:
        'https://www.lg.com/it/images/tv/md07528457/gallery/lg-tv-OLED48A16LA-medium01.jpg',
        name: 'LG TV-32-inch', description: 'LG32LM630B-32-INCH',price: '4000EG'),
    UserModel(
        image:
        'https://pisces.bbystatic.com/image2/BestBuy_US/images/products/5763/5763401cv13d.jpg',
        name: 'Smart Display-55-i', description: 'Context LE-55sz101-55i',price: '72EG')


  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      child: GridView.count(
        crossAxisCount: 2,
        mainAxisSpacing: 2,
        childAspectRatio: (1 / 1.7),
        children:
            List.generate(data.length, (index) => buildUserItems(data[index])),
      ),
      color: Colors.grey,
    );
  }
}

Widget buildUserItems(UserModel model) => Padding(
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
                Icon(Icons.add_box_sharp, color: Colors.red),
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

class UserModel {
  String name;
  String image;
  String description;
  String price;

  UserModel(
      {required this.image, required this.name, required this.description,required this.price});
}
