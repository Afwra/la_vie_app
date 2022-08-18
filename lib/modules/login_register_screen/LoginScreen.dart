import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:la_vie_app/layout/home_layout.dart';
import 'package:la_vie_app/models/login_model.dart';
import 'package:la_vie_app/shared/components/components.dart';
import 'package:la_vie_app/shared/constants.dart';
import 'package:la_vie_app/shared/cubit/login_cubit/cubit.dart';
import 'package:la_vie_app/shared/cubit/login_cubit/states.dart';
import 'package:la_vie_app/shared/network/local/cache_helper.dart';

class LoginScreen extends StatelessWidget {
  var loginFormKey = GlobalKey<FormState>();
  var registerFormKey = GlobalKey<FormState>();
  var emailController = TextEditingController();
  var passController = TextEditingController();
  var firstNameController = TextEditingController();
  var lastNameController = TextEditingController();

  LoginScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit,LoginStates>(
      listener: (context,state){
        if(state is LoginSuccessState ){
          LoginModel? model = state.loginModel;
          accessToken = model!.data!.accessToken.toString();
          CacheHelper.putString(key: 'accessToken', value: model.data!.accessToken.toString());
          navigateToAndFinish(context, HomeLayout());
        }
        else if(state is RegisterSuccessState){
          LoginModel? model = state.loginModel;
          accessToken = model!.data!.accessToken.toString();
          CacheHelper.putString(key: 'accessToken', value: model.data!.accessToken.toString());
          navigateToAndFinish(context, HomeLayout());
        }
      },
      builder: (context,state){
        return SafeArea(
          child: Scaffold(
            body: Column(
              children: [
                Align(child: Image.asset('assets/images/leaf.png'),alignment: Alignment.topRight,heightFactor: 0.6,),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(25.0),
                    child: DefaultTabController(
                      length: 2,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Image.asset('assets/images/logo.png'),

                          const SizedBox(height: 40,),
                          const TabBar(
                              indicatorSize: TabBarIndicatorSize.label,
                              tabs:[
                                Tab(text: 'Login'),
                                Tab(text: 'Register',),
                              ]

                          ),
                          const SizedBox(height: 40,),
                          Expanded(
                            child: TabBarView(children: [
                              buildLogin(context,state),
                              buildRegister(context,state),
                            ]),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget buildLogin(BuildContext context,state)=>Form(
    key: loginFormKey,
    child: SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Email',style: TextStyle(color: Colors.grey),),
          const SizedBox(height: 5,),
          TextFormField(
            controller: emailController,
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
                borderSide: const BorderSide(color: Colors.grey)
              ),

              enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey)
              ),

            ),
            validator: (value){
              if(value!.isEmpty){
                return 'pls enter email';
              }
              return null;
            },

          ),
          const SizedBox(height: 40,),
          const Text('Password',style: TextStyle(color: Colors.grey),),
          const SizedBox(height: 5,),
          TextFormField(
            controller: passController,
            keyboardType: TextInputType.visiblePassword,
            obscureText: true,
            validator: (value){
              if(value!.isEmpty){
                return 'pls enter password';
              }
              return null;
            },
            decoration: InputDecoration(
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                    borderSide: const BorderSide(color: Colors.grey)
                ),
                enabledBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey)
                )

            ),
          ),
          const SizedBox(height: 40,),
          Container(
            height: 50,
              width: double.infinity,
              color: Colors.green,
              child: MaterialButton(
                onPressed: (){
                  if(loginFormKey.currentState!.validate()){
                    LoginCubit.get(context).userLogin(email: emailController.text, password: passController.text);
                  }
                },
                child:  ConditionalBuilder(
                  condition: state is !LoginLoadingState,
                  builder:(context)=> const Text('Login',style: TextStyle(color: Colors.white),),
                  fallback:(context) => const Center(child: CircularProgressIndicator(color: Colors.white,)),
              ),
              ),
          ),
          const SizedBox(height: 40,),
          Row(
            children: [
              Expanded(
                child: Container(
                  height: 1,
                  color: Colors.grey,
                ),
              ),
              const Padding(
                padding:  EdgeInsets.symmetric(horizontal: 5),
                child:  Text(
                  'or continue with',
                  style: TextStyle(color: Colors.grey),
                ),
              ),
              Expanded(
                child: Container(
                  height: 1,
                  color: Colors.grey,
                ),
              ),

            ],
          ),
          const SizedBox(height: 40,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                child: const CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 20,
                  backgroundImage: AssetImage('assets/images/google.png'),
                ),
                onTap: (){
                  LoginCubit.get(context).googleLogin();
                },
              ),
              const SizedBox(width: 10,),
              InkWell(
                child:const CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 20,
                  backgroundImage: AssetImage('assets/images/facebook.png'),
                ),
                onTap: (){
                   LoginCubit.get(context).facebookLogin();
                },
              ),
            ],
          )

        ],
      ),
    ),
  );
  Widget buildRegister(BuildContext context,state)=>Form(
    key: registerFormKey,
    child: SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('First Name',style: TextStyle(color: Colors.grey),),
          const SizedBox(height: 5,),
          TextFormField(
            controller: firstNameController,
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                    borderSide: const BorderSide(color: Colors.grey)
                ),

                enabledBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey)
                )

            ),
            validator: (value){
              if(value!.isEmpty){
                return 'pls enter first name';
              }
              return null;
            },

          ),
          const SizedBox(height: 40,),
          const Text('Last Name',style: TextStyle(color: Colors.grey),),
          const SizedBox(height: 5,),
          TextFormField(
            controller: lastNameController,
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                    borderSide: const BorderSide(color: Colors.grey)
                ),

                enabledBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey)
                )

            ),
            validator: (value){
              if(value!.isEmpty){
                return 'pls enter last name';
              }
              return null;
            },

          ),
          const SizedBox(height: 40,),
          const Text('Email',style: TextStyle(color: Colors.grey),),
          const SizedBox(height: 5,),
          TextFormField(
            controller: emailController,
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
                borderSide: const BorderSide(color: Colors.grey)
              ),

              enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey)
              )

            ),
            validator: (value){
              if(value!.isEmpty){
                return 'pls enter email';
              }
              return null;
            },

          ),
          const SizedBox(height: 40,),
          const Text('Password',style: TextStyle(color: Colors.grey),),
          const SizedBox(height: 5,),
          TextFormField(
            controller: passController,
            keyboardType: TextInputType.visiblePassword,
            decoration: InputDecoration(
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                    borderSide: const BorderSide(color: Colors.grey)
                ),
                enabledBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey)
                )

            ),
            validator: (value){
              if(value!.isEmpty){
                return 'pls enter password';
              }
              return null;
            },
          ),
          const SizedBox(height: 40,),
          Container(
            height: 50,
              width: double.infinity,
              color: Colors.green,
              child: MaterialButton(
                onPressed: (){
                  if(registerFormKey.currentState!.validate()){
                    LoginCubit.get(context).userRegister(
                        firstName: firstNameController.text,
                        lastName: lastNameController.text,
                        email: emailController.text,
                        password: passController.text
                    );
                  }

                },
                child: ConditionalBuilder(
                  condition: state is !RegisterLoadingState,
                    builder: (context) => const Text('Register',style: TextStyle(color: Colors.white),),
                  fallback: (context) => const Center(child: CircularProgressIndicator()),
                ),
              ),
          ),


        ],
      ),
    ),
  );
}
