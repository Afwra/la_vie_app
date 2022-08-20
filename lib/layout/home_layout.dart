import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ionicons/ionicons.dart';
import 'package:la_vie_app/modules/user_info_screen/user_info_screen.dart';
import 'package:la_vie_app/shared/components/components.dart';
import 'package:la_vie_app/shared/cubit/app_cubit/cubit.dart';
import 'package:la_vie_app/shared/cubit/app_cubit/states.dart';

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
            body: Padding(
              padding: const EdgeInsets.all(15.0),
              child: cubit.screens[cubit.currentIndex],
            ),
            bottomNavigationBar: CurvedNavigationBar(
              items: [
                Icon(Ionicons.leaf_outline),
                Icon(Ionicons.scan),
                Icon(Ionicons.home_outline),
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
                if(index == 4){
                  return false;
                }
                return true;
              },
              buttonBackgroundColor: Colors.green,
              onTap: (index){
                cubit.changeNavIndex(index,context);
              },
              backgroundColor: Colors.white.withOpacity(0),
              color: Colors.white,
            ),
          );
        },
      ),
    );
  }
}
