import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:ionicons/ionicons.dart';
import 'package:la_vie_app/modules/blogs_screen/single_blog_screen.dart';
import 'package:la_vie_app/shared/components/components.dart';
import 'package:la_vie_app/shared/cubit/app_cubit/cubit.dart';
import 'package:la_vie_app/shared/cubit/app_cubit/states.dart';

class BlogsScreen extends StatelessWidget {
  const BlogsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit,AppStates>(
      listener: (context,state){},
      builder: (context,state){
        AppCubit cubit = AppCubit.get(context);
        return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: Colors.white,
            leading: IconButton(
              onPressed: (){
                Navigator.pop(context);
              },
              icon: const Icon(Ionicons.arrow_back_outline,color: Colors.black,),
            ),
            title: const Text(
              'Blogs',
              style: TextStyle(
                  color: Colors.black
              ),
            ),
            centerTitle: true,
            elevation: 0,
          ),
          body: ConditionalBuilder(
            condition: cubit.isBlogsLoaded,
            builder:(context)=> Padding(
              padding: const EdgeInsets.all(25.0),
              child: Column(
                children: [
                  Expanded(
                    child: ListView.separated(
                        itemBuilder: (context,index)=>buildBlogItem(cubit.allBlogs[index],context),
                        separatorBuilder: (context,index)=>const SizedBox(height: 30,),
                        itemCount: cubit.allBlogs.length
                    ),
                  ),
                  // Expanded(
                  //   child: ListView.separated(
                  //       itemBuilder: (context,index)=>buildBlogItem(cubit.seedsBlog[index]),
                  //       separatorBuilder: (context,index)=>const SizedBox(height: 30,),
                  //       itemCount: cubit.seedsBlog.length
                  //   ),
                  // ),
                  // Expanded(
                  //   child: ListView.separated(
                  //       itemBuilder: (context,index)=>buildBlogItem(cubit.toolsBlog[index]),
                  //       separatorBuilder: (context,index)=>const SizedBox(height: 30,),
                  //       itemCount: cubit.toolsBlog.length
                  //   ),
                  // ),
                ],
              ),
            ),
            fallback: (context)=>const Center(child: CircularProgressIndicator()),
          ),
        );
      },
    );
  }

  Widget buildBlogItem(data,BuildContext context)=>SizedBox(
    height: 170,
    width: double.infinity,
    child: InkWell(
      onTap: (){
        navigateTo(context, SingleBlogScreen());
      },
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        color: Colors.white,
        elevation: 1,
        shadowColor: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(11.0),
          child: Row(
            children: [
              Container(
                height: double.infinity,
                width: 133,
                decoration:  BoxDecoration(
                    image: DecorationImage(
                      image: data.imageUrl == ''? const NetworkImage('https://thumbs.dreamstime.com/b/no-image-available-icon-flat-vector-no-image-available-icon-flat-vector-illustration-132482953.jpg') : NetworkImage('https://lavie.orangedigitalcenteregypt.com${data.imageUrl}'),
                      fit: BoxFit.cover
                    )
                ),
              ),
              const SizedBox(width: 15,),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                        '2 days ago',
                      style: TextStyle(
                        color: HexColor('#1ABC00'),
                        fontSize: 13
                      ),
                    ),
                    const SizedBox(height: 10,),
                    Text(
                      '${data.name}',
                      style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 15,),
                    Text(
                      '${data.description}',
                      style: TextStyle(
                        color: HexColor('#7D7B7B'),
                      ),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    ),
  );
}
