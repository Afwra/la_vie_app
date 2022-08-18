import 'package:la_vie_app/models/login_model.dart';

abstract class LoginStates{}

class InitialLoginState extends LoginStates{}
class LoginSuccessState extends LoginStates{
  LoginModel? loginModel;

  LoginSuccessState(this.loginModel);
}
class LoginLoadingState extends LoginStates{}
class LoginErrorState extends LoginStates{
  String error;

  LoginErrorState(this.error);
}

class RegisterSuccessState extends LoginStates{
  LoginModel? loginModel;

  RegisterSuccessState(this.loginModel);
}
class RegisterLoadingState extends LoginStates{}
class RegisterErrorState extends LoginStates{
  String error;

  RegisterErrorState(this.error);
}

class FacebookLoginSuccessState extends LoginStates{
  LoginModel? loginModel;

  FacebookLoginSuccessState(this.loginModel);
}
class FacebookLoginLoadingState extends LoginStates{}
class FacebookLoginErrorState extends LoginStates{
  String error;

  FacebookLoginErrorState(this.error);
}


class GoogleLoginSuccessState extends LoginStates{
  LoginModel? loginModel;

  GoogleLoginSuccessState(this.loginModel);
}
class GoogleLoginLoadingState extends LoginStates{}
class GoogleLoginErrorState extends LoginStates{
  String error;

  GoogleLoginErrorState(this.error);
}