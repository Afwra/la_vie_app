import 'package:dio/dio.dart';

class DioHelper{
  static late Dio dio;
  static init(){
    dio = Dio(
      BaseOptions(
        baseUrl: 'https://lavie.orangedigitalcenteregypt.com',
        receiveDataWhenStatusError: true
      )
    );
  }

  static Future<Response> postData({required String path,dynamic data,Map<String,dynamic>? query,String? token,Options? options}){
    dio.options.headers={
      'content-type':'application/json',
      'Accept':'application/json'
    };
    return dio.post(
      path,
      data: data,
      queryParameters: query,
      options: options

    );
  }

  static Future<Response> getData({required String path,Map<String,dynamic>? query,Options? options}){
    dio.options.headers={
      'content-type':'application/json',
      'Accept':'application/json'
    };
    return dio.get(
      path,
      queryParameters: query,
      options: options,
    );

  }

  static Future<Response> patchData({required String path,Options? options,Map<String,dynamic>? data}){
    dio.options.headers={
      'content-type':'application/json',
      'Accept':'application/json'
    };
    return dio.patch(
        path,
      options: options,
      data: data,

    );
  }
}