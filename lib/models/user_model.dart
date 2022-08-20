
class UserModel {
  UserModel({
      String? type, 
      String? message, 
      Data? data,}){
    _type = type;
    _message = message;
    _data = data;
}

  UserModel.fromJson(dynamic json) {
    _type = json['type'];
    _message = json['message'];
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
  String? _type;
  String? _message;
  Data? _data;
UserModel copyWith({  String? type,
  String? message,
  Data? data,
}) => UserModel(  type: type ?? _type,
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
      String? userId, 
      String? firstName, 
      String? lastName, 
      String? email, 
      String? imageUrl, 
      String? address, 
      String? userPoints, 
      List<String>? userNotification,}){
    _userId = userId;
    _firstName = firstName;
    _lastName = lastName;
    _email = email;
    _imageUrl = imageUrl;
    _address = address;
    _userPoints = userPoints;
    _userNotification = userNotification;
}

  Data.fromJson(dynamic json) {
    _userId = json['userId'];
    _firstName = json['firstName'];
    _lastName = json['lastName'];
    _email = json['email'];
    _imageUrl = json['imageUrl'];
    _address = json['address'];
    _userPoints = json['UserPoints'];
    _userNotification = json['UserNotification'] != null ? json['UserNotification'].cast<String>() : [];
  }
  String? _userId;
  String? _firstName;
  String? _lastName;
  String? _email;
  String? _imageUrl;
  String? _address;
  String? _userPoints;
  List<String>? _userNotification;
Data copyWith({  String? userId,
  String? firstName,
  String? lastName,
  String? email,
  String? imageUrl,
  String? address,
  String? userPoints,
  List<String>? userNotification,
}) => Data(  userId: userId ?? _userId,
  firstName: firstName ?? _firstName,
  lastName: lastName ?? _lastName,
  email: email ?? _email,
  imageUrl: imageUrl ?? _imageUrl,
  address: address ?? _address,
  userPoints: userPoints ?? _userPoints,
  userNotification: userNotification ?? _userNotification,
);
  String? get userId => _userId;
  String? get firstName => _firstName;
  String? get lastName => _lastName;
  String? get email => _email;
  String? get imageUrl => _imageUrl;
  String? get address => _address;
  String? get userPoints => _userPoints;
  List<String>? get userNotification => _userNotification;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['userId'] = _userId;
    map['firstName'] = _firstName;
    map['lastName'] = _lastName;
    map['email'] = _email;
    map['imageUrl'] = _imageUrl;
    map['address'] = _address;
    map['UserPoints'] = _userPoints;
    map['UserNotification'] = _userNotification;
    return map;
  }

}