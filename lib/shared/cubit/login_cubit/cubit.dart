import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:la_vie_app/models/login_model.dart';
import 'package:la_vie_app/shared/cubit/login_cubit/states.dart';
import 'package:la_vie_app/shared/network/remote/dio_helper.dart';


class LoginCubit extends Cubit<LoginStates>{
  LoginCubit():super(InitialLoginState());

  static LoginCubit get(context) => BlocProvider.of(context);

//afwra@gmail.com
  //Afwra123456789

  LoginModel? loginModel;
  void userLogin({required String email,required String password}){
    emit(LoginLoadingState());
    DioHelper.postData(path: '/api/v1/auth/signin',data: {
      'email':email,
      'password':password
    }).then((value){
      loginModel = LoginModel.fromJson(value.data);
      debugPrint('${loginModel!.message}');
      debugPrint('${loginModel!.data!.user!.userId}');
      emit(LoginSuccessState(loginModel));
    }).catchError((error){
      emit(LoginErrorState(error.toString()));
    });
  }
  void userRegister({required String firstName,required String lastName,required String email,required String password}){
    emit(RegisterLoadingState());
    DioHelper.postData(
      path: '/api/v1/auth/signup',
      data: {
        'firstName':firstName,
        'lastName':lastName,
        'email':email,
        'password':password
      }
    ).then((value){
      loginModel = LoginModel.fromJson(value.data);
      debugPrint(loginModel!.message);
      debugPrint(loginModel!.data!.user!.email);
      emit(RegisterSuccessState(loginModel));
    }).catchError((error){
      emit(RegisterErrorState(error.toString()));
    });
  }
  void facebookLogin()async{
    emit(FacebookLoginLoadingState());
    final result = await FacebookAuth.i.login(
      permissions: ['public_profile','email'],
    );
    if(result.status == LoginStatus.success){
      final userData = await FacebookAuth.i.getUserData();
      // AccessToken? token = result.accessToken;
      debugPrint('Facebook Access token = ${userData['picture']['data']['url']}');
      debugPrint('Facebook Access token = ${userData['name']}');
      debugPrint('Facebook Access token = ${userData['email']}');
      DioHelper.getData(
          path: '/api/v1/auth/facebook',
        query: {
          'id':userData['id'],
          'email': userData['email'],
          'firstName': userData['name'],
          'lastName': userData['name'],
          'picture': userData['picture']['data']['url'].toString()
        }
      ).then((value){
        print('value is${value.data.toString()}');
        loginModel = LoginModel.fromJson(value.data);
        debugPrint(loginModel!.message);
        debugPrint(loginModel!.data!.user!.firstName);
        emit(FacebookLoginSuccessState(loginModel));
      }).catchError((error){
        emit(FacebookLoginErrorState(error.toString()));
        debugPrint(error.toString());
      });
    }
  }
  void googleLogin(){
    emit(GoogleLoginLoadingState());
    GoogleSignIn().signIn().then((account){
      account!.authentication.then((value){
        debugPrint('google access token ${account.id}');
        DioHelper.postData(
            path: '/api/v1/auth/google',
          query: {
              'id' : account.id.toString(),
              'firstName' : 'ahmed',
              'lastName' : 'gamal',
              'email': account.email.toString(),
              'picture' : account.photoUrl.toString()
          }
        ).then((value){
          loginModel = LoginModel.fromJson(value.data);
          debugPrint(loginModel!.message);
          emit(GoogleLoginSuccessState(loginModel));

        }).catchError((error){
          debugPrint(error.toString());
          emit(GoogleLoginErrorState(error.toString()));
        });
      });
    }).catchError((error){
      emit(GoogleLoginErrorState(error.toString()));
    });



  }

}