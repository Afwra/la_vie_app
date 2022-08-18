class LoginModel{
  String? type;
  String? message;
  UserData? data;

  LoginModel(this.type, this.message, this.data);
  LoginModel.fromJson(Map<String,dynamic> json){
    type = json['type'];
    message = json['message'];
    data = UserData.fromJson(json['data']);
  }
}
class UserData{
  User? user;
  String? accessToken;
  String? refreshToken;

  UserData(this.user, this.accessToken, this.refreshToken);
  UserData.fromJson(Map<String,dynamic> json)
  {
    accessToken = json['accessToken'];
    refreshToken = json['refreshToken'];
    user = User.fromJson(json['user']);
  }
}
class User{
  String? userId;
  String? firstName;
  String? lastName;
  String? email;
  String? imageUrl;
  String? address;
  String? role;

  User(this.userId, this.firstName, this.lastName, this.email, this.imageUrl,
      this.address, this.role);
  User.fromJson(Map<String,dynamic> json){
    userId = json['userId'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    email = json['email'];
    imageUrl = json['imageUrl'];
    address = json['address'];
    role = json['role'];
  }
}