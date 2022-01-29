class User{
  int? id;
  String? name = '';
  String? email = '';
  String? token = '';

  User({this.id, this.name, this.email, this.token});

  factory User.fromJson(Map json){
    return User(token: json['token']);
  }

  factory User.fromJson2(Map json){
    return User(id: json['id'], name: json['name'],email: json['email']);
  }
}