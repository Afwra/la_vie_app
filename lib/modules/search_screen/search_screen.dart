import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ionicons/ionicons.dart';
import 'package:la_vie_app/models/product_search_history_model.dart';
import 'package:la_vie_app/shared/components/components.dart';
import 'package:la_vie_app/shared/cubit/app_cubit/cubit.dart';
import 'package:la_vie_app/shared/cubit/app_cubit/states.dart';

class SearchScreen extends StatelessWidget {
  var searchController = TextEditingController();

  SearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit,AppStates>(
      listener: (context,state){},
      builder: (context,state){
        AppCubit cubit = AppCubit.get(context);
        return SafeArea(
          child: Scaffold(
            body: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  defaultSearchField(
                      onSubmit: (value){
                        cubit.insertSearchHistory(text: value);
                        cubit.searchProduct(searchName: value);
                        cubit.isSearchSubmitted = true;
                      },
                      maxLines: 1,
                    controller: searchController,
                    suffix: const Icon(Ionicons.options_outline,color: Colors.green,)

                  ),
                  const SizedBox(height: 20,),
                  if(!cubit.isSearchSubmitted && cubit.searchHistory.isNotEmpty)
                    Expanded(
                      child: ListView.separated(
                          itemBuilder: (context,index)=>buildHistoryItem(cubit.searchHistory[index],context),
                          separatorBuilder: (context,index) => const SizedBox(height: 10,),
                          itemCount: cubit.searchHistory.length,
                      ),
                    ),
                  if(cubit.isSearchSubmitted)
                    Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      RichText(
                        maxLines: 1,
                        textAlign: TextAlign.start,
                        textDirection: TextDirection.ltr,
                        text: TextSpan(
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                            children: [
                              const TextSpan(text: 'Results For "'),
                              TextSpan(text: '${cubit.searchText}',style: const TextStyle(color: Colors.green)),
                              const TextSpan(text: '"'),
                            ]
                        ),

                      ),
                      const Spacer(),

                      Text(
                        '${cubit.searchResults.length} Found',
                        style: const TextStyle(
                          color: Colors.green,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                  if(cubit.isSearchSubmitted)
                    const SizedBox(height: 20,),
                  if(cubit.isSearchSubmitted)
                    ConditionalBuilder(
                      condition: cubit.searchResults.isNotEmpty,
                      builder: (context)=> Expanded(
                        child: GridView.builder(
                          clipBehavior: Clip.none,
                          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            childAspectRatio: 3/2,
                            mainAxisExtent: 250,
                            mainAxisSpacing: 50,
                            crossAxisSpacing: 10,

                          ),
                          padding: const EdgeInsets.all(8),
                          itemCount: cubit.searchResults.length,
                          itemBuilder: (context,index)=>buildProductItem(cubit.searchResults[index],context),
                          scrollDirection: Axis.vertical,
                        ),
                      ),
                      fallback: (context) => defaultEmptyScreen(title: 'Not Found'),
                  ),
                  // Row(
                  //   children: [
                  //     const Icon(
                  //       Icons.watch_later_outlined,
                  //       color: Colors.grey,
                  //     ),
                  //     const SizedBox(width: 10,),
                  //     Expanded(child: Text('gardenia plant',style: TextStyle(color: Colors.grey),overflow: TextOverflow.ellipsis,maxLines: 2,)),
                  //     IconButton(onPressed: (){}, icon: const Icon(Icons.close,color: Colors.grey,)),
                  //   ],
                  // ),
                  // const SizedBox(height: 10,),
                  // Row(
                  //   children: [
                  //     const Icon(
                  //       Icons.watch_later_outlined,
                  //       color: Colors.grey,
                  //     ),
                  //     const SizedBox(width: 10,),
                  //     Text('gardenia plant',style: TextStyle(color: Colors.grey),),
                  //     const Spacer(),
                  //     IconButton(onPressed: (){}, icon: const Icon(Icons.close,color: Colors.grey,)),
                  //   ],
                  // ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
  Widget buildHistoryItem(ProductSearchHistoryModel data,BuildContext context)=>InkWell(
    child: Row(
      children: [
        const Icon(
          Icons.watch_later_outlined,
          color: Colors.grey,
        ),
        const SizedBox(width: 10,),
        Expanded(child: Text('${data.text}',style: const TextStyle(color: Colors.grey),overflow: TextOverflow.ellipsis,maxLines: 2,)),
        IconButton(
            onPressed: (){
              AppCubit.get(context).deleteSearchHistory(id: (data.id)!);
            },
            icon: const Icon(Icons.close,color: Colors.grey,)),
      ],
    ),
    onTap: (){
      AppCubit.get(context).searchProduct(searchName: '${data.text}');
      AppCubit.get(context).isSearchSubmitted = true;
    },
  );
}
