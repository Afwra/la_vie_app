import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:ionicons/ionicons.dart';
import 'package:la_vie_app/shared/components/components.dart';
import 'package:la_vie_app/shared/cubit/app_cubit/cubit.dart';
import 'package:la_vie_app/shared/cubit/app_cubit/states.dart';

class NewPostScreen extends StatelessWidget {
  NewPostScreen({Key? key}) : super(key: key);

  var formKey = GlobalKey<FormState>();
  var titleController = TextEditingController();
  var descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit,AppStates>(
      listener: (context,state){},
      builder: (context,state){
        AppCubit cubit = AppCubit.get(context);
        return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            toolbarHeight: 90,
            leadingWidth: 60,
            centerTitle: true,
            backgroundColor: Colors.white,
            elevation: 0,
            leading: IconButton(
              icon: const Icon(Icons.arrow_back_ios,color: Colors.black,),
              onPressed: (){
                Navigator.pop(context);
              },
            ),
            title: const Text(
              'Create New Post',
              style: TextStyle(
                color: Colors.black,
                fontSize: 21,
                fontWeight: FontWeight.bold,
              ),
            ),
            titleSpacing: 0,

          ),
          body: Padding(
            padding: const EdgeInsets.all(29.0),
            child: SingleChildScrollView(
              child: Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: InkWell(
                        onTap: (){cubit.pickImage();},
                        child: Container(
                          height: 136,
                          width: 136,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                  color: Colors.green
                              ),
                            image: cubit.image == null?null : DecorationImage(
                              image: FileImage(File(cubit.image!.path)),
                              fit: BoxFit.cover
                            )
                          ),
                          child: cubit.image ==  null? Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: const [
                              Icon(Ionicons.add,color: Colors.green,size: 35,),
                              Text(
                                'Add Photo',
                                style: TextStyle(
                                    color: Colors.green,
                                    fontSize: 16
                                ),
                              )
                            ],
                          ) : null,
                        ),
                      ),
                    ),
                    const SizedBox(height: 15,),
                    Text(
                      'Title',
                      style: TextStyle(
                          fontSize: 14,
                          color: HexColor('##6F6F6F')
                      ),
                    ),
                    const SizedBox(height: 12,),
                    defaultSearchField(
                       controller: titleController,
                        validator: (value){
                         if(value!.isEmpty){
                           return 'Pls Enter Title';
                         }
                         return null;
                        },
                        prefixEnabled: false,
                        text: '',
                        fillColor: Colors.white,
                        borderSide: BorderSide(color: HexColor('##939393'))
                    ),
                    const SizedBox(height: 19,),
                    Text(
                      'Description',
                      style: TextStyle(
                          fontSize: 14,
                          color: HexColor('##6F6F6F')
                      ),
                    ),
                    const SizedBox(height: 12,),
                    defaultSearchField(
                      controller: descriptionController,
                      validator: (value){
                        if(value!.isEmpty){
                          return 'Pls Enter Description';
                        }
                        return null;
                      },
                      prefixEnabled: false,
                      text: '',
                      maxLines: 10,
                      contentPadding: const EdgeInsets.only(bottom: 10,left: 10,top: 10,right: 10),
                      fillColor: Colors.white,
                      borderSide: BorderSide(color: HexColor('##939393')),
                    ),
                    const SizedBox(height: 33,),
                    defaultButton(
                        text: 'Post',
                      onPressed: (){
                          if(formKey.currentState!.validate()){
                            cubit.postForum(title: titleController.text, description: descriptionController.text, context: context);
                          }
                      }
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
