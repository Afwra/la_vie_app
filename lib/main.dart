import 'package:bloc/bloc.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:easy_splash_screen/easy_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:la_vie_app/layout/home_layout.dart';
import 'package:la_vie_app/modules/login_register_screen/LoginScreen.dart';
import 'package:la_vie_app/shared/bloc_observer.dart';
import 'package:la_vie_app/shared/constants.dart';
import 'package:la_vie_app/shared/cubit/app_cubit/cubit.dart';
import 'package:la_vie_app/shared/cubit/login_cubit/cubit.dart';
import 'package:la_vie_app/shared/network/local/cache_helper.dart';
import 'package:la_vie_app/shared/network/remote/dio_helper.dart';

void main()async{
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  DioHelper.init();
  await CacheHelper.init();

  accessToken = CacheHelper.getString(key: 'accessToken');
  bool loggedIn = false;
  if(accessToken!=null){
    loggedIn = true;
    debugPrint('access token = $accessToken');
  }
  runApp(MyApp(loggedIn));
}

class MyApp extends StatelessWidget {
  bool loggedIn;

  MyApp(this.loggedIn, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context)=>LoginCubit()),
        BlocProvider(create: (context)=>AppCubit()..getProducts(context: context)..createDatabase()),
      ],
      child: MaterialApp(
        home: EasySplashScreen(
          logo: Image.asset('assets/images/logo.png'),
          backgroundColor: Colors.white,
          loaderColor: Colors.green,
          showLoader: false,
          navigator: ConditionalBuilder(
            condition: loggedIn,
              builder:(context)=> HomeLayout(),
            fallback: (context) => LoginScreen(),
          ),
          durationInSeconds: 2,
        ),
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          tabBarTheme: const TabBarTheme(
            labelColor: Colors.green
          ),
          primarySwatch: Colors.green,

        ),
      ),
    );
  }
}
