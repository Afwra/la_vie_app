import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:ionicons/ionicons.dart';
import 'package:la_vie_app/shared/components/components.dart';
import 'package:la_vie_app/shared/cubit/app_cubit/cubit.dart';
import 'package:la_vie_app/shared/cubit/app_cubit/states.dart';

class UserInfoScreen extends StatelessWidget {
  var scaffoldKey = GlobalKey<ScaffoldState>();
  var emailFormKey = GlobalKey<FormState>();
  var nameFormKey = GlobalKey<FormState>();
  var emailController = TextEditingController();
  var nameController = TextEditingController();

  UserInfoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit,AppStates>(
      listener: (context,state){},
      builder: (context,state){
        AppCubit cubit = AppCubit.get(context);
        return SafeArea(
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: Colors.black.withOpacity(0.3),
            body: ConditionalBuilder(
              condition: cubit.isUserLoaded,
              builder: (context) =>Column(
                children: [
                  Container(
                    color: Colors.black.withOpacity(0.3),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            IconButton(
                              onPressed: (){
                                Navigator.pop(context);
                              },
                              icon: const Icon(Ionicons.arrow_back,color: Colors.white,),
                            ),
                            const Spacer(),
                            IconButton(
                                onPressed: (){},
                                icon: const Icon(Icons.menu,color: Colors.white,)
                            ),
                          ],
                        ),
                        const SizedBox(height: 20,),
                        CircleAvatar(
                          radius: 64,
                          backgroundImage: NetworkImage(cubit.userModel!.data!.imageUrl??'https://upload.wikimedia.org/wikipedia/commons/thumb/6/65/No-Image-Placeholder.svg/1665px-No-Image-Placeholder.svg.png'),

                        ),
                        const SizedBox(height: 10,),
                        Text('${cubit.userModel!.data!.firstName} ${cubit.userModel!.data!.lastName}',
                          style: const TextStyle(
                            fontSize: 24,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 20,),

                      ],
                    ),
                  ),
                  Expanded(
                    child: Container(
                      padding:const EdgeInsets.all(24),
                      decoration: const BoxDecoration(
                          borderRadius: BorderRadiusDirectional.only(topStart: Radius.circular(10),topEnd: Radius.circular(10)),
                          color: Colors.white
                      ),
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                  color: HexColor('#F3FEF1')
                              ),
                              padding: const EdgeInsets.symmetric(horizontal: 15),
                              height: 80,
                              child: Row(
                                children: [
                                  const Icon(Icons.control_point,color: Colors.green,),
                                  const SizedBox(width: 10,),
                                  Text('You Have ${cubit.userModel!.data!.userPoints??'0'} Points'),
                                  const Spacer(),
                                  const Icon(Icons.arrow_forward),
                                ],
                              ),
                            ),
                            const SizedBox(height: 24,),
                            const Text(
                              'Edit Profile',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 23,),
                            Container(
                              decoration: BoxDecoration(
                                color: HexColor('#FFFFFF'),
                                boxShadow: const [BoxShadow(blurRadius: 2,color: Colors.black)],
                                borderRadius: BorderRadius.circular(10),
                              ),

                              padding: const EdgeInsets.symmetric(horizontal: 15),
                              height: 80,
                              child: MaterialButton(
                                onPressed: (){
                                  scaffoldKey.currentState!.showBottomSheet((context){
                                    return defaultBottomSheetForm(
                                      formKey: nameFormKey,
                                      text: 'Enter Name',
                                      controller: nameController,
                                      validator: (value){
                                        if(value!.isEmpty){
                                          return 'pls enter name';
                                        }
                                        return null;
                                      },
                                      onPressed: (){
                                        if(nameFormKey.currentState!.validate()){
                                          cubit.changeUserName(name: nameController.text);
                                          Navigator.pop(context);
                                        }
                                      },
                                    );
                                  });
                                },
                                child: Row(
                                  children:const [
                                    Icon(Icons.swap_horiz_outlined),
                                    SizedBox(width: 10,),
                                    Text('Change Name'),
                                    Spacer(),
                                    Icon(Icons.arrow_forward),
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(height: 26,),
                            Container(
                              decoration: BoxDecoration(
                                color: HexColor('#FFFFFF'),
                                boxShadow: const [BoxShadow(blurRadius: 2,color: Colors.black)],
                                borderRadius: BorderRadius.circular(10),
                              ),

                              padding: const EdgeInsets.symmetric(horizontal: 15),
                              height: 80,
                              child: MaterialButton(
                                onPressed: (){
                                  scaffoldKey.currentState!.showBottomSheet((context){
                                    return defaultBottomSheetForm(
                                      controller: emailController,
                                      text: 'Enter Email',
                                      formKey: emailFormKey,
                                      validator: (value){
                                        if(value!.isEmpty){
                                          return 'pls enter email';
                                        }
                                        return null;
                                      },
                                      onPressed: (){
                                        if(emailFormKey.currentState!.validate()){
                                          cubit.changeEmail(email: emailController.text);
                                          Navigator.pop(context);
                                        }
                                      }

                                    );
                                  },
                                    backgroundColor: Colors.white.withOpacity(0.5),
                                    elevation: 1,
                                    enableDrag: true,
                                  );
                                },
                                child: Row(
                                  children: const [
                                    Icon(Icons.swap_horiz_outlined),
                                    SizedBox(width: 10,),
                                    Text('Change Email'),
                                    Spacer(),
                                    Icon(Icons.arrow_forward),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
              fallback: (context) => const Center(child: CircularProgressIndicator()),
            ),
          ),
        );
      },
    );
  }
  Widget defaultBottomSheetForm({GlobalKey? formKey,String? text,TextEditingController? controller,void Function()? onPressed,String? Function(String?)? validator})=>Padding(
    padding: const EdgeInsets.all(8.0),
    child: Form(
      key: formKey,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          defaultSearchField(
            text: text,
            prefix: Ionicons.mail_open_outline,
            fillColor: Colors.white,
            controller: controller,
            validator: validator,
          ),
          const SizedBox(height: 20,),
          defaultButton(
              text: 'Submit',
              onPressed: onPressed
          )
        ],
      ),
    ),
  );
}
