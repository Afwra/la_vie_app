
class LoginModel {
  LoginModel({
      String? type, 
      String? message, 
      Data? data,}){
    _type = type;
    _message = message;
    _data = data;
}

  LoginModel.fromJson(dynamic json) {
    _type = json['type'];
    _message = json['message'];
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
  String? _type;
  String? _message;
  Data? _data;
LoginModel copyWith({  String? type,
  String? message,
  Data? data,
}) => LoginModel(  type: type ?? _type,
  message: message ?? _message,
  data: data ?? _data,
);
  String? get type => _type;
  String? get message => _message;
  Data? get data => _data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['type'] = _type;
    map['message'] = _message;
    if (_data != null) {
      map['data'] = _data?.toJson();
    }
    return map;
  }

}


class Data {
  Data({
      User? user, 
      String? accessToken, 
      String? refreshToken,}){
    _user = user;
    _accessToken = accessToken;
    _refreshToken = refreshToken;
}

  Data.fromJson(dynamic json) {
    _user = json['user'] != null ? User.fromJson(json['user']) : null;
    _accessToken = json['accessToken'];
    _refreshToken = json['refreshToken'];
  }
  User? _user;
  String? _accessToken;
  String? _refreshToken;
Data copyWith({  User? user,
  String? accessToken,
  String? refreshToken,
}) => Data(  user: user ?? _user,
  accessToken: accessToken ?? _accessToken,
  refreshToken: refreshToken ?? _refreshToken,
);
  User? get user => _user;
  String? get accessToken => _accessToken;
  String? get refreshToken => _refreshToken;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_user != null) {
      map['user'] = _user?.toJson();
    }
    map['accessToken'] = _accessToken;
    map['refreshToken'] = _refreshToken;
    return map;
  }

}


class User {
  User({
      String? userId, 
      String? firstName, 
      String? lastName, 
      String? email, 
      String? imageUrl, 
      dynamic address, 
      String? role,}){
    _userId = userId;
    _firstName = firstName;
    _lastName = lastName;
    _email = email;
    _imageUrl = imageUrl;
    _address = address;
    _role = role;
}

  User.fromJson(dynamic json) {
    _userId = json['userId'];
    _firstName = json['firstName'];
    _lastName = json['lastName'];
    _email = json['email'];
    _imageUrl = json['imageUrl'];
    _address = json['address'];
    _role = json['role'];
  }
  String? _userId;
  String? _firstName;
  String? _lastName;
  String? _email;
  String? _imageUrl;
  dynamic _address;
  String? _role;
User copyWith({  String? userId,
  String? firstName,
  String? lastName,
  String? email,
  String? imageUrl,
  dynamic address,
  String? role,
}) => User(  userId: userId ?? _userId,
  firstName: firstName ?? _firstName,
  lastName: lastName ?? _lastName,
  email: email ?? _email,
  imageUrl: imageUrl ?? _imageUrl,
  address: address ?? _address,
  role: role ?? _role,
);
  String? get userId => _userId;
  String? get firstName => _firstName;
  String? get lastName => _lastName;
  String? get email => _email;
  String? get imageUrl => _imageUrl;
  dynamic get address => _address;
  String? get role => _role;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['userId'] = _userId;
    map['firstName'] = _firstName;
    map['lastName'] = _lastName;
    map['email'] = _email;
    map['imageUrl'] = _imageUrl;
    map['address'] = _address;
    map['role'] = _role;
    return map;
  }

}