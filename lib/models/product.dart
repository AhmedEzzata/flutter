class Product {
  String name;
  String image;
  String description;
  String price;

  Product(
      {required this.image, required this.name, required this.description,required this.price});
  factory Product.fromJson(Map jason){
    return Product(image: jason['image'], name: jason['name'], description: jason['description'], price: jason['price']);
  }
}
