import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:ionicons/ionicons.dart';
import 'package:la_vie_app/models/forums_model.dart';
import 'package:la_vie_app/modules/blogs_screen/blogs_screen.dart';
import 'package:la_vie_app/modules/forums_screen/new_post_screen.dart';
import 'package:la_vie_app/modules/forums_screen/single_forum_screen.dart';
import 'package:la_vie_app/shared/components/components.dart';
import 'package:la_vie_app/shared/cubit/app_cubit/cubit.dart';
import 'package:la_vie_app/shared/cubit/app_cubit/states.dart';

class FormsScreen extends StatelessWidget {
  var searchController = TextEditingController();

  FormsScreen({Key? key}) : super(key: key);

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
              'Discussion Forums',
              style: TextStyle(
                color: Colors.black,
                fontSize: 21,
                fontWeight: FontWeight.bold,
              ),
            ),
            titleSpacing: 0,

          ),
          body: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              children: [
                defaultSearchField(
                  maxLines: 1,
                  controller: searchController,
                  onSubmit: (value){
                    cubit.getForums(
                        query: {
                          'search':value
                        }
                    );
                  },

                ),
                const SizedBox(height: 15,),
                Row(
                  children: [
                    defaultButton(
                        text: 'All Forums',
                        width: 111,
                        onPressed: (){
                          cubit.isAllForumsPressed = true;
                          cubit.getForums();
                        },
                        fontSize: 12,
                        backgroundColor: cubit.isAllForumsPressed?Colors.green:Colors.white,
                        border: cubit.isAllForumsPressed? null : Border.all(color: Colors.black.withOpacity(0.33)),
                        textColor: cubit.isAllForumsPressed?null:HexColor('#979797')
                    ),
                    const SizedBox(width: 10,),
                    defaultButton(
                      text: 'My Forums',
                      width: 111,
                      fontSize: 12,
                      onPressed: (){
                        cubit.isAllForumsPressed = false;
                        cubit.getForums();
                      },
                      backgroundColor: cubit.isAllForumsPressed?Colors.white:Colors.green,
                      border: cubit.isAllForumsPressed? Border.all(color: Colors.black.withOpacity(0.33)):null ,
                      textColor: cubit.isAllForumsPressed?HexColor('#979797'): null,

                    ),
                    const SizedBox(width: 10,),
                    defaultButton(
                      text: 'Blogs',
                      width: 111,
                      fontSize: 12,
                      onPressed: (){
                        cubit.getBlogs();
                        navigateTo(context, BlogsScreen());
                      },
                      backgroundColor: Colors.white,
                      border: Border.all(color: Colors.black.withOpacity(0.33)) ,
                      textColor: HexColor('#979797'),

                    ),
                  ],
                ),
                const SizedBox(height: 22,),
                ConditionalBuilder(
                  condition: cubit.isForumsLoaded,
                  builder: (context) =>Expanded(
                    child : ListView.separated(
                        itemBuilder: (context,index)=>forumBuilder(cubit.forumsModel!.data![index],context),
                        separatorBuilder: (context,index)=>const SizedBox(height: 40,),
                        itemCount: cubit.forumsModel!.data!.length
                    ),
                  ),
                  fallback: (context) => const Expanded(child: Center(child: CircularProgressIndicator())),
                )
                // Card(
                //
                //   shape: Border(
                //       bottom: BorderSide.none,
                //       top: BorderSide(style: BorderStyle.solid,color: Colors.black.withOpacity(0.1)),
                //       left: BorderSide(style: BorderStyle.solid,color: Colors.black.withOpacity(0.1)),
                //     right: BorderSide(style: BorderStyle.solid,color: Colors.black.withOpacity(0.1)),
                //   ),
                //   margin: EdgeInsets.zero,
                //   child: Column(
                //     crossAxisAlignment: CrossAxisAlignment.start,
                //     children: [
                //       Padding(
                //         padding: const EdgeInsets.only(left: 15,top: 15,right: 15),
                //         child: Row(
                //           children: [
                //             CircleAvatar(
                //               backgroundImage: AssetImage('assets/images/person.png'),
                //               backgroundColor: Colors.white,
                //               radius: 30,
                //             ),
                //             const SizedBox(width: 12,),
                //             Expanded(
                //               child: Column(
                //                 crossAxisAlignment: CrossAxisAlignment.start,
                //                 children: [
                //                   Text(
                //                     'Mayar Mohamed',
                //                     style:const TextStyle(
                //                       color: Colors.black,
                //                       fontSize: 16,
                //                       fontWeight: FontWeight.bold,
                //                     ) ,
                //                     overflow: TextOverflow.ellipsis,
                //                     maxLines: 1,
                //                   ),
                //                   const SizedBox(height: 10,),
                //                   Text(
                //                       'a month ago',
                //                     style:TextStyle(
                //                       color: HexColor('#979797'),
                //                       fontSize: 12,
                //                     ) ,
                //                   ),
                //
                //                 ],
                //               ),
                //             )
                //           ],
                //         ),
                //       ),
                //       const SizedBox(height: 24,),
                //       Padding(
                //         padding: const EdgeInsets.only(left: 8),
                //         child: Text(
                //           'How To Treat Plants',
                //           style: TextStyle(
                //             color: HexColor('#1ABC00'),
                //             fontSize: 20,
                //             fontWeight: FontWeight.bold,
                //           ),
                //           maxLines: 1,
                //           overflow: TextOverflow.ellipsis,
                //         ),
                //       ),
                //       const SizedBox(height: 26,),
                //       Padding(
                //         padding: const EdgeInsets.only(left: 13),
                //         child: Text(
                //             'It is a long established fact that a reader will be distracted ',
                //           style: TextStyle(
                //             color: HexColor('#8F8D8D'),
                //             fontSize: 14,
                //           ),
                //         ),
                //       ),
                //       const SizedBox(height: 24,),
                //
                //
                //
                //     ],
                //   ),
                // ),
                // Container(
                //   width: double.infinity,
                //   height: 150,
                //   decoration: BoxDecoration(
                //       image: DecorationImage(
                //           image: AssetImage('assets/images/form.png'),
                //           fit: BoxFit.cover
                //       )
                //   ),
                // ),
                // const SizedBox(height: 15,),
                // Row(
                //   children: [
                //     IconButton(onPressed: (){}, icon: Icon(Ionicons.thumbs_up_outline,color: Colors.black.withOpacity(0.6),)),
                //     const SizedBox(width: 1,),
                //     Text('0 Likes',style: TextStyle(color: Colors.black.withOpacity(0.6)),),
                //     const SizedBox(width: 50,),
                //     Text('2 Replies',style: TextStyle(color: Colors.black.withOpacity(0.6)),),
                //
                //   ],
                // )
              ],
            ),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: (){
              navigateTo(context, NewPostScreen());
            },
            child: const Icon(
              Ionicons.add,
              color: Colors.white,
            ),
          ),
        );
      },
    );
  }
  Widget forumBuilder(Data data,BuildContext context)=>InkWell(
    onTap: (){
      AppCubit.get(context).getForumById(id: (data.forumId)!);
      navigateTo(context, SingleForumScreen());
    },
    child: Column(
      children: [
        Card(

          shape: Border(
            bottom: BorderSide.none,
            top: BorderSide(style: BorderStyle.solid,color: Colors.black.withOpacity(0.1)),
            left: BorderSide(style: BorderStyle.solid,color: Colors.black.withOpacity(0.1)),
            right: BorderSide(style: BorderStyle.solid,color: Colors.black.withOpacity(0.1)),
          ),
          margin: EdgeInsets.zero,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 15,top: 15,right: 15),
                child: Row(
                  children: [
                    CircleAvatar(
                      backgroundImage:
                      NetworkImage(data.user!.imageUrl==''?'https://media.istockphoto.com/vectors/default-image-icon-vector-missing-picture-page-for-website-design-or-vector-id1357365823?k=20&m=1357365823&s=612x612&w=0&h=ZH0MQpeUoSHM3G2AWzc8KkGYRg4uP_kuu0Za8GFxdFc=':'${data.user!.imageUrl}'),
                      backgroundColor: Colors.white,
                      radius: 30,
                    ),
                    const SizedBox(width: 12,),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '${data.user!.firstName} ${data.user!.lastName}',
                            style:const TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ) ,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                          ),
                          const SizedBox(height: 10,),
                          Text(
                            'a month ago',
                            style:TextStyle(
                              color: HexColor('#979797'),
                              fontSize: 12,
                            ) ,
                          ),

                        ],
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(height: 24,),
              Padding(
                padding: const EdgeInsets.only(left: 8),
                child: Text(
                  '${data.title}',
                  style: TextStyle(
                    color: HexColor('#1ABC00'),
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              const SizedBox(height: 26,),
              Padding(
                padding: const EdgeInsets.only(left: 13),
                child: Text(
                  '${data.description}',
                  style: TextStyle(
                    color: HexColor('#8F8D8D'),
                    fontSize: 14,
                  ),
                ),
              ),
              const SizedBox(height: 24,),



            ],
          ),
        ),
        if(data.imageUrl!=null)
          Container(
          width: double.infinity,
          height: 150,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage('https://lavie.orangedigitalcenteregypt.com${data.imageUrl}'),
                  fit: BoxFit.cover
              )
          ),
        ),
        const SizedBox(height: 15,),
        Row(
          children: [
            IconButton(onPressed: (){}, icon: Icon(Ionicons.thumbs_up_outline,color: Colors.black.withOpacity(0.6),)),
            const SizedBox(width: 1,),
            Text(
              '${data.forumLikes!.isEmpty?'0':data.forumLikes!.length}  Likes',
              style: TextStyle(color: Colors.black.withOpacity(0.6)),
            ),
            const SizedBox(width: 50,),
            Text(
              '${data.forumComments!.isEmpty?'0':data.forumComments!.length}   Replies',
              style: TextStyle(color: Colors.black.withOpacity(0.6)),
            ),

          ],
        )
      ],
    ),
  );
}

