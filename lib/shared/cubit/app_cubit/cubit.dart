import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:la_vie_app/models/forums_model.dart';
import 'package:la_vie_app/models/products_model.dart' as p;
import 'package:la_vie_app/modules/home_screen/home_screen.dart';
import 'package:la_vie_app/modules/login_register_screen/LoginScreen.dart';
import 'package:la_vie_app/modules/notifications_screen/notification_screen.dart';
import 'package:la_vie_app/modules/scan_screen/scan_screen.dart';
import 'package:la_vie_app/modules/user_info_screen/user_info_screen.dart';
import 'package:la_vie_app/shared/components/components.dart';
import 'package:la_vie_app/shared/constants.dart';
import 'package:la_vie_app/shared/cubit/app_cubit/states.dart';
import 'package:la_vie_app/shared/network/remote/dio_helper.dart';

import '../../../models/filter_model.dart';
import '../../../models/user_model.dart';
import '../../../modules/forums_screen/forums_screen.dart';

class AppCubit extends Cubit<AppStates>{
  AppCubit():super(InitialAppState());

  static AppCubit get(context) => BlocProvider.of(context);

  List<Widget> screens = [
    FormsScreen(),
    ScanScreen(),
    HomeScreen(),
    NotificationsScreen(),
    UserInfoScreen(),
  ];
  int currentIndex = 2;

  void changeNavIndex(int index,BuildContext context){
    if(index == 1){
      navigateTo(context, ScanScreen());
      currentIndex = 2;
    }else if(index == 4){
      navigateTo(context, UserInfoScreen());
      getUser();
      currentIndex = 2;
    }
    else{
      currentIndex = index;
    }
    emit(ChangeBotNavBarState());
  }

  bool isPlantsPressed = false;
  bool isSeedsPressed = false;
  bool isToolsPressed = false;
  bool isAllPressed = true;
  void changeFilters(int choice){
    if(choice == 0){
      isAllPressed = true;
      isPlantsPressed = isSeedsPressed = isToolsPressed = false;
    }else if(choice == 1){
      isPlantsPressed = true;
      isAllPressed = isSeedsPressed = isToolsPressed = false;
    }else if(choice == 2){
      isSeedsPressed = true;
      isAllPressed = isPlantsPressed = isToolsPressed = false;
    }else{
      isToolsPressed = true;
      isAllPressed = isSeedsPressed = isPlantsPressed = false;
    }
    emit(ChangeFiltersState());
  }

  FilterModel? filterModel;
  void getFilters(){
    DioHelper.getData(
      path: '/api/v1/products/filters',
      options: Options(
        headers:{
          'Authorization':'Bearer $accessToken'
        },
    ),
    ).then((value){
      filterModel = FilterModel.fromJson(value.data);
      debugPrint(filterModel!.message);
      emit(GetFiltersSuccessState());
    }).catchError((error){
        debugPrint(error.toString());
        emit(GetFiltersFailState());
    });
  }


  p.ProductsModel? productsModel;
  bool productsLoaded = false;
  List<p.Data> plants = [];
  List<p.Data> seeds =[];
  List<p.Data> tools =[];
  void getProducts({required BuildContext context}){
    productsLoaded = false;
    productsModel = null;
    emit(GetProductsLoadingState());
    DioHelper.getData(
      path: '/api/v1/products',
      options: Options(
          headers: {
            'Authorization': 'Bearer $accessToken'
          }
      ),
    ).then((value){
      if(value.statusCode == 200){

        productsModel = p.ProductsModel.fromJson(value.data);
        debugPrint(productsModel?.message);
        if(productsModel!.data!.isNotEmpty){
          productsLoaded = true;
          for (var element in productsModel!.data!) {
            if (element.type=='PLANT'){
              plants.add(element);
            }
            else if (element.type == 'SEED'){
              seeds.add(element);
            }
            else if (element.type == 'TOOL'){
              tools.add(element);
            }
          }
          debugPrint('plants = ${plants.length}');
          debugPrint('seeds = ${seeds.length}');
          debugPrint('tools = ${tools.length}');
        }else if(value.statusCode == 401){
          navigateToAndFinish(context, LoginScreen());
        }
      }
      emit(GetProductsSuccessState());
    }).catchError((error){
      debugPrint(error.toString());
      navigateTo(context, LoginScreen());
      emit(GetProductsErrorState());
    });
  }

  List<p.Data> searchResults =[];
  bool isSearchSubmitted = false;
  void searchProduct({required String searchName}){
    searchResults = [];
    for (var element in productsModel!.data!) {
      if(element.name.toString().toLowerCase() == searchName.toString().toLowerCase()){
        searchResults.add(element);
      }
    }
    emit(SearchProductsState());
  }

  // PlantsModel? plantsModel;
  // bool plantsLoaded = false;
  // void getPlants(){
  //   plantsLoaded = false;
  //   plantsModel = null;
  //   emit(GetPlantsLoadingState());
  //   DioHelper.getData(
  //     path: '/api/v1/plants',
  //     options: Options(
  //       headers: {
  //         'Authorization': 'Bearer $accessToken'
  //       }
  //     ),
  //   ).then((value){
  //     plantsModel = PlantsModel.fromJson(value.data);
  //     debugPrint(plantsModel!.message);
  //     if(plantsModel!.data!.isNotEmpty){
  //       plantsLoaded = true;
  //     }
  //     emit(GetPlantsSuccessState());
  //   }).catchError((error){
  //     debugPrint(error.toString());
  //     emit(GetPlantsErrorState());
  //   });
  // }
  //
  // ToolsModel? toolsModel;
  // bool toolsLoaded = false;
  // void getTools(){
  //   toolsLoaded = false;
  //   toolsModel = null;
  //   emit(GetToolsLoadingState());
  //   DioHelper.getData(
  //     path: '/api/v1/tools',
  //     options: Options(
  //         headers: {
  //           'Authorization': 'Bearer $accessToken'
  //         }
  //     ),
  //   ).then((value){
  //     toolsModel = ToolsModel.fromJson(value.data);
  //     debugPrint(plantsModel!.message);
  //     if(toolsModel!.data!.isNotEmpty){
  //       toolsLoaded = true;
  //     }
  //     emit(GetToolsSuccessState());
  //   }).catchError((error){
  //     debugPrint(error.toString());
  //     emit(GetToolsErrorState());
  //   });
  // }
  //
  // SeedsModel? seedsModel;
  // bool seedsLoaded = false;
  // void getSeeds(){
  //   seedsLoaded = false;
  //   seedsModel = null;
  //   emit(GetSeedsLoadingState());
  //   DioHelper.getData(
  //     path: '/api/v1/seeds',
  //     options: Options(
  //         headers: {
  //           'Authorization': 'Bearer $accessToken'
  //         }
  //     ),
  //   ).then((value){
  //     seedsModel = SeedsModel.fromJson(value.data);
  //     debugPrint(plantsModel!.message);
  //     if(seedsModel!.data!.isNotEmpty){
  //       seedsLoaded = true;
  //     }
  //     emit(GetSeedsSuccessState());
  //   }).catchError((error){
  //     debugPrint(error.toString());
  //     emit(GetSeedsErrorState());
  //   });
  // }

  UserModel? userModel;
  bool isUserLoaded = false;
  void getUser(){
    isUserLoaded = false;
    emit(GetUserLoadingState());
    DioHelper.getData(
      path: '/api/v1/user/me',
      options: Options(
          headers: {
            'Authorization': 'Bearer $accessToken'
          }
      ),
    ).then((value){
      userModel = UserModel.fromJson(value.data);
      debugPrint(userModel!.message);
      if(userModel?.data != null){
        isUserLoaded = true;
      }
      emit(GetUserSuccessState());
    }).catchError((error){
      debugPrint(error.toString());
      emit(GetUserErrorState());
    });
  }


  void changeUserName({required String name}){
    List<String>? tmp = name.trimLeft().split(' ');
    String? firstName ;

    String? lastName ;
    if(tmp.length ==1){
      firstName = tmp[0];
    }
    else{
      firstName = tmp[0];
      lastName = tmp[1];
    }

    emit(UpdateUserLoadingState());
    DioHelper.patchData(
      path: '/api/v1/user/me',
      options: Options(
        headers: {
          'Authorization':'Bearer $accessToken'
        }
      ),
      data: {
        "firstName": firstName,
        "lastName": lastName??userModel!.data!.lastName,
      }
    ).then((value){
      emit(UpdateUserSuccessState());
      showToast(msg: '${value.data['message']}',backGroundColor: Colors.green,textColor: Colors.white,gravity: ToastGravity.BOTTOM,toastLength: Toast.LENGTH_LONG);
      getUser();
    }).catchError((error){
      showToast(msg: error.toString(),backGroundColor: Colors.red,textColor: Colors.white,gravity: ToastGravity.CENTER,toastLength: Toast.LENGTH_LONG);

      emit(UpdateUserErrorState());
    });
  }
  void changeEmail({required String email}){
    emit(UpdateUserLoadingState());
    DioHelper.patchData(
        path: '/api/v1/user/me',
        options: Options(
            headers: {
              'Authorization':'Bearer $accessToken'
            }
        ),
        data: {
          "email": email,
        }
    ).then((value){
      emit(UpdateUserSuccessState());
      showToast(msg: '${value.data['message']}',backGroundColor: Colors.green,textColor: Colors.white,gravity: ToastGravity.BOTTOM,toastLength: Toast.LENGTH_LONG);
      getUser();
    }).catchError((error){
      showToast(msg: error.toString(),backGroundColor: Colors.red,textColor: Colors.white,gravity: ToastGravity.CENTER,toastLength: Toast.LENGTH_LONG);

      emit(UpdateUserErrorState());
    });
  }


  ForumsModel? forumsModel;
  bool isForumsLoaded = false;
  bool isAllForumsPressed = true;
  void getForums({Map<String,dynamic>? query}){
    isForumsLoaded = false;
    forumsModel = null;
    emit(GetForumsLoadingState());
    DioHelper.getData(
      path: isAllForumsPressed? '/api/v1/forums' : '/api/v1/forums/me',
      options: Options(
          headers: {
            'Authorization': 'Bearer $accessToken'
          }
      ),
      query: query
    ).then((value){
      if(value.data['type']=='Success'){
        isForumsLoaded = true;
        forumsModel = ForumsModel.fromJson(value.data);
        debugPrint(forumsModel!.message);
        emit(GetForumsSuccessState());
      }
    }).catchError((error){
      debugPrint(error.toString());
      emit(GetForumsErrorState());
    });
  }

  final ImagePicker _picker = ImagePicker();
  XFile? image;
  String? img64;
  void pickImage()async{
    image = await  _picker.pickImage(source: ImageSource.gallery);
    if(image == null){
      emit(GetImageErrorState());
    }
    else{
      final bytes = File(image!.path).readAsBytesSync();
      img64 = base64Encode(bytes);
      debugPrint(img64);
      emit(GetImageSuccessState());
    }

  }

  void postForum({required String title,required String description,required BuildContext context}){
    DioHelper.postData(
        path: '/api/v1/forums',
      data: {
        "title": title,
        "description": description,
        "imageBase64":'data:image/jpeg;base64,$img64'
      },
      options: Options(
        headers: {
          'Authorization':'Bearer $accessToken'
        }
      )

    ).then((value){
      showToast(msg: 'Posted Successfully',backGroundColor: Colors.green,textColor: Colors.white);
      Navigator.pop(context);
      emit(PostForumSuccessState());
    }).catchError((error){
      debugPrint(error.toString());
      emit(PostForumErrorState());
    });
  }
}