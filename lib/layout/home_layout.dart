import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:ionicons/ionicons.dart';
import 'package:la_vie_app/modules/user_info_screen/user_info_screen.dart';
import 'package:la_vie_app/shared/components/components.dart';
import 'package:la_vie_app/shared/cubit/app_cubit/cubit.dart';
import 'package:la_vie_app/shared/cubit/app_cubit/states.dart';

import '../modules/forums_screen/forums_screen.dart';

class HomeLayout extends StatelessWidget {
  const HomeLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocConsumer<AppCubit,AppStates>(
        listener: (context,state){},
        builder: (context,state){
          AppCubit cubit = AppCubit.get(context);
          return Scaffold(
            appBar: AppBar(
              toolbarHeight: 100,
              backgroundColor: Theme.of(context).scaffoldBackgroundColor,
              elevation: 0,
              title: Image.asset('assets/images/logo.png',height: 50),
              centerTitle: true,
            ),
            body: Padding(
              padding: const EdgeInsets.all(15.0),
              child: cubit.screens[cubit.currentIndex],
            ),
            bottomNavigationBar: CurvedNavigationBar(
              items: [
                IconButton(
                    onPressed: (){
                      cubit.getForums();
                      navigateTo(context, FormsScreen());
                    },
                    icon: Icon(Ionicons.leaf_outline)
                ),
                Icon(Ionicons.scan),
                Icon(Ionicons.home_outline,color: Colors.white,),
                Icon(Ionicons.notifications_outline),
                IconButton(
                    onPressed:(){
                      navigateTo(context, UserInfoScreen());
                      cubit.getUser();
                      },
                    icon: const Icon(Ionicons.person_outline)),
              ],
              index: cubit.currentIndex,
              letIndexChange: (index){
                if(index == 4 || index ==0){
                  return false;
                }
                return true;
              },
              buttonBackgroundColor: Colors.green,
              onTap: (index){
                cubit.changeNavIndex(index,context);
              },
              backgroundColor: Theme.of(context).scaffoldBackgroundColor,
              color: HexColor('##FFFFFF'),
            ),
          );
        },
      ),
    );
  }
}
