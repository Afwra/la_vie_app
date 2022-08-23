import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:ionicons/ionicons.dart';
import 'package:la_vie_app/models/forums_model.dart';
import 'package:la_vie_app/shared/components/components.dart';
import 'package:la_vie_app/shared/cubit/app_cubit/cubit.dart';
import 'package:la_vie_app/shared/cubit/app_cubit/states.dart';

class SingleForumScreen extends StatelessWidget {
  var searchController = TextEditingController();
  Data? forumData;

  SingleForumScreen(this.forumData, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit,AppStates>(
      listener: (context,state){},
      builder: (context,state){
        // AppCubit cubit = AppCubit.get(context);
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
            elevation: 0,
          ),
          body:Padding(
            padding: const EdgeInsets.all(20.0),
            child: SingleChildScrollView(

              child: Column(
                children: [
                  buildForumItem(),
                  const SizedBox(height: 10,),
                  Row(
                    children: [
                      Expanded(
                        child: defaultSearchField(
                          text: 'Add a comment',
                          maxLines: 5,
                          minLines: 1,
                          prefixEnabled: false,
                        ),
                      ),
                      IconButton(onPressed: (){}, icon: const Icon(Ionicons.send_outline))
                    ],
                  ),
                  const SizedBox(height: 10,),
                  ConditionalBuilder(
                    condition: forumData!.forumComments!.isNotEmpty,
                    builder:(context)=> ListView.separated(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context,index)=> buildCommentItem((forumData!.forumComments![index])),
                      separatorBuilder: (context,index)=>const SizedBox(height: 10,),
                      itemCount: forumData!.forumComments!.length,
                    ),
                    fallback: (context)=>const SizedBox(),
                  ),

                ],
              ),
            ),
          ),

        );
      } ,
    );
  }
  Widget buildForumItem()=>Column(
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
                    backgroundImage: NetworkImage('https://media.istockphoto.com/vectors/default-image-icon-vector-missing-picture-page-for-website-design-or-vector-id1357365823?k=20&m=1357365823&s=612x612&w=0&h=ZH0MQpeUoSHM3G2AWzc8KkGYRg4uP_kuu0Za8GFxdFc='),
                    backgroundColor: Colors.white,
                    radius: 30,
                  ),
                  const SizedBox(width: 12,),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Mayar Mohamed',
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
                '${forumData!.title}',
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
                '${forumData!.description}',
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
      if(forumData!.imageUrl!=null)
        Container(
        width: double.infinity,
        height: 150,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: NetworkImage('https://lavie.orangedigitalcenteregypt.com${forumData!.imageUrl}'),
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
            '${forumData!.forumLikes!.isEmpty?'0':forumData!.forumLikes!.length} Likes',
            style: TextStyle(color: Colors.black.withOpacity(0.6)),
          ),
          const SizedBox(width: 50,),
          Text(
            '${forumData!.forumComments!.isEmpty?'0':forumData!.forumComments!.length}  Replies',
            style: TextStyle(color: Colors.black.withOpacity(0.6)),
          ),

        ],
      )
    ],
  );
  Widget buildCommentItem(ForumComments comment)=> Row(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      CircleAvatar(
        backgroundImage: AssetImage('assets/images/person.png'),
        radius: 25,
      ),
      const SizedBox(width: 20,),
      Expanded(
        child: Text(
          '${comment.comment}',
          maxLines: 5,
          overflow: TextOverflow.ellipsis,
        ),
      )
    ],
  );

}
