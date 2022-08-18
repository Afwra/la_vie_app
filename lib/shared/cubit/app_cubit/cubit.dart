import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:la_vie_app/models/products_model.dart';
import 'package:la_vie_app/models/seeds_model.dart';
import 'package:la_vie_app/modules/home_screen/home_screen.dart';
import 'package:la_vie_app/modules/leaf_screen/leaf_screen.dart';
import 'package:la_vie_app/modules/notifications_screen/notification_screen.dart';
import 'package:la_vie_app/modules/scan_screen/scan_screen.dart';
import 'package:la_vie_app/modules/user_info_screen/user_info_screen.dart';
import 'package:la_vie_app/shared/components/components.dart';
import 'package:la_vie_app/shared/constants.dart';
import 'package:la_vie_app/shared/cubit/app_cubit/states.dart';
import 'package:la_vie_app/shared/network/remote/dio_helper.dart';

import '../../../models/filter_model.dart';
import '../../../models/plants_model.dart';
import '../../../models/tools_model.dart';

class AppCubit extends Cubit<AppStates>{
  AppCubit():super(InitialAppState());

  static AppCubit get(context) => BlocProvider.of(context);

  List<Widget> screens = [
    LeafScreen(),
    ScanScreen(),
    HomeScreen(),
    NotificationsScreen(),
    UserInfoScreen(),
  ];
  int currentIndex = 2;

  void changeNavIndex(int index,BuildContext context){
    if(index == 1){
      navigateTo(context, ScanScreen());
    }else{
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


  ProductsModel? productsModel;
  bool productsLoaded = false;
  void getProducts(){
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
      productsModel = ProductsModel.fromJson(value.data);
      debugPrint(productsModel!.message);
      if(productsModel!.data!.isNotEmpty){
        productsLoaded = true;
      }
      emit(GetProductsSuccessState());
    }).catchError((error){
      debugPrint(error.toString());
      emit(GetProductsErrorState());
    });
  }

  PlantsModel? plantsModel;
  bool plantsLoaded = false;
  void getPlants(){
    plantsLoaded = false;
    plantsModel = null;
    emit(GetPlantsLoadingState());
    DioHelper.getData(
      path: '/api/v1/plants',
      options: Options(
        headers: {
          'Authorization': 'Bearer $accessToken'
        }
      ),
    ).then((value){
      plantsModel = PlantsModel.fromJson(value.data);
      debugPrint(plantsModel!.message);
      if(plantsModel!.data!.isNotEmpty){
        plantsLoaded = true;
      }
      emit(GetPlantsSuccessState());
    }).catchError((error){
      debugPrint(error.toString());
      emit(GetPlantsErrorState());
    });
  }

  ToolsModel? toolsModel;
  bool toolsLoaded = false;
  void getTools(){
    toolsLoaded = false;
    toolsModel = null;
    emit(GetToolsLoadingState());
    DioHelper.getData(
      path: '/api/v1/tools',
      options: Options(
          headers: {
            'Authorization': 'Bearer $accessToken'
          }
      ),
    ).then((value){
      toolsModel = ToolsModel.fromJson(value.data);
      debugPrint(plantsModel!.message);
      if(toolsModel!.data!.isNotEmpty){
        toolsLoaded = true;
      }
      emit(GetToolsSuccessState());
    }).catchError((error){
      debugPrint(error.toString());
      emit(GetToolsErrorState());
    });
  }

  SeedsModel? seedsModel;
  bool seedsLoaded = false;
  void getSeeds(){
    seedsLoaded = false;
    seedsModel = null;
    emit(GetSeedsLoadingState());
    DioHelper.getData(
      path: '/api/v1/seeds',
      options: Options(
          headers: {
            'Authorization': 'Bearer $accessToken'
          }
      ),
    ).then((value){
      seedsModel = SeedsModel.fromJson(value.data);
      debugPrint(plantsModel!.message);
      if(seedsModel!.data!.isNotEmpty){
        seedsLoaded = true;
      }
      emit(GetSeedsSuccessState());
    }).catchError((error){
      debugPrint(error.toString());
      emit(GetSeedsErrorState());
    });
  }
}