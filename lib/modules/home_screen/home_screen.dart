import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ionicons/ionicons.dart';
import 'package:la_vie_app/modules/search_screen/search_screen.dart';
import 'package:la_vie_app/shared/components/components.dart';
import 'package:la_vie_app/shared/cubit/app_cubit/cubit.dart';
import 'package:la_vie_app/shared/cubit/app_cubit/states.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit,AppStates>(
      listener: (context,state){},
      builder: (context,state){
        AppCubit cubit = AppCubit.get(context);
        return SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                height: 60,
                child: Row(
                  children: [
                    Expanded(
                      child: defaultSearchField(
                        isReadOnly: true,
                        onTap: (){
                          navigateTo(context, SearchScreen());
                        }
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Container(
                      height: 60,
                      width: 60,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.green,
                      ),
                      child: MaterialButton(
                        child: const Icon(
                          Ionicons.cart_outline,
                          color: Colors.white,
                        ),
                        onPressed: () {},
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    Container(
                      height: 50,
                      width: 90,
                      decoration: BoxDecoration(
                        border: Border.all(color: cubit.isAllPressed? Colors.green : Colors.grey.shade200,),
                        color: Colors.grey.shade200,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: MaterialButton(

                        onPressed:(){
                          cubit.changeFilters(0);
                          cubit.getProducts();
                        } ,child: const Text('All'),),
                      //Center(child: Text('Plants',style: TextStyle(color:Colors.black),),),
                    ),
                    const SizedBox(width: 10,),
                    Container(
                      height: 50,
                      width: 90,
                      decoration: BoxDecoration(
                        border: Border.all(color: cubit.isPlantsPressed? Colors.green : Colors.grey.shade200,),
                        color: Colors.grey.shade200,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: MaterialButton(
                        onPressed:(){
                          cubit.changeFilters(1);
                          cubit.getPlants();
                        } ,child: const Text('Plants'),),
                      //Center(child: Text('Plants',style: TextStyle(color:Colors.black),),),
                    ),
                    const SizedBox(width: 10,),
                    Container(
                      height: 50,
                      width: 90,
                      decoration: BoxDecoration(
                        border: Border.all(color: cubit.isSeedsPressed? Colors.green : Colors.grey.shade200,),
                        color: Colors.grey.shade200,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: MaterialButton(
                        onPressed:(){
                          cubit.changeFilters(2);
                          cubit.getSeeds();
                        } ,child: const Text('Seeds'),),
                      //Center(child: Text('Plants',style: TextStyle(color:Colors.black),),),
                    ),
                    const SizedBox(width: 10,),
                    Container(
                      height: 50,
                      width: 90,
                      decoration: BoxDecoration(
                        border: Border.all(color: cubit.isToolsPressed? Colors.green : Colors.grey.shade200,),
                        color: Colors.grey.shade200,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: MaterialButton(

                        onPressed:(){
                          cubit.changeFilters(3);
                          cubit.getTools();
                        } ,child: const Text('Tools'),),
                      //Center(child: Text('Plants',style: TextStyle(color:Colors.black),),),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              if(cubit.isAllPressed)
                ConditionalBuilder(
                  condition: cubit.productsLoaded,
                  builder: (context) => GridView.builder(
                    clipBehavior: Clip.none,
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 3/2,
                      mainAxisExtent: 250,
                      mainAxisSpacing: 50,
                      crossAxisSpacing: 10,

                    ),
                    padding: const EdgeInsets.all(8),
                    itemCount: cubit.productsModel!.data!.length,
                    itemBuilder: (context,index)=>buildProductItem(cubit.productsModel!.data![index]),
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                  ),
                  fallback: (context) =>const Center(child: CircularProgressIndicator()),
                ),
              if(cubit.isPlantsPressed)
                ConditionalBuilder(
                condition: cubit.plantsLoaded,
                builder: (context) => GridView.builder(
                  clipBehavior: Clip.none,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 3/2,
                    mainAxisExtent: 250,
                    mainAxisSpacing: 50,
                    crossAxisSpacing: 10,

                  ),
                  padding: const EdgeInsets.all(8),
                  itemCount: cubit.plantsModel!.data!.length,
                  itemBuilder: (context,index)=>buildProductItem(cubit.plantsModel!.data![index]),
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                ),
                fallback: (context) =>const Center(child: CircularProgressIndicator()),
              ),
              if(cubit.isToolsPressed)
                ConditionalBuilder(
                  condition: cubit.toolsLoaded,
                  builder: (context) => GridView.builder(
                    clipBehavior: Clip.none,
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 3/2,
                      mainAxisExtent: 250,
                      mainAxisSpacing: 50,
                      crossAxisSpacing: 10,

                    ),
                    padding: const EdgeInsets.all(8),
                    itemCount: cubit.toolsModel!.data!.length,
                    itemBuilder: (context,index)=>buildProductItem(cubit.toolsModel!.data![index]),
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                  ),
                  fallback: (context) =>const Center(child: CircularProgressIndicator()),
                ),
              if(cubit.isSeedsPressed)
                ConditionalBuilder(
                  condition: cubit.seedsLoaded,
                  builder: (context) => GridView.builder(
                    clipBehavior: Clip.none,
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 3/2,
                      mainAxisExtent: 250,
                      mainAxisSpacing: 50,
                      crossAxisSpacing: 10,

                    ),
                    padding: EdgeInsets.all(8),
                    itemCount: cubit.seedsModel!.data!.length,
                    itemBuilder: (context,index)=>buildProductItem(cubit.seedsModel!.data![index]),
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                  ),
                  fallback: (context) =>const Center(child: CircularProgressIndicator()),
                ),

            ],
          ),
        );
      },
    );
  }

  Widget buildProductItem(data)=>SizedBox(
    height: 200,
    child: Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          height: 272,
          width: 200,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: const [
                BoxShadow(blurRadius: 0.5, color: Colors.grey)
              ]),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    IconButton(
                        onPressed: () {}, icon: const Icon(Ionicons.remove)),
                    const Text('1'),
                    IconButton(onPressed: () {}, icon: const Icon(Ionicons.add))
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(14.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${data.name}',
                      style: const TextStyle(fontSize: 15,fontWeight: FontWeight.bold),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text('20'),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      height: 40,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: MaterialButton(
                        child: const Text(
                          'Add to Cart',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.white,
                          ),
                        ),
                        onPressed: () {},
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
        Align(
          alignment: const Alignment(-1.2, -1.2),
          child: Image(
            image: data.imageUrl==''? const NetworkImage('https://upload.wikimedia.org/wikipedia/commons/thumb/6/65/No-Image-Placeholder.svg/1665px-No-Image-Placeholder.svg.png'):NetworkImage('https://lavie.orangedigitalcenteregypt.com${data.imageUrl}'),
            width: 90,
            height: 120,
            fit: BoxFit.fill,

          ),
        ),
      ],
    ),
  );
  // Widget buildFilters(FilterModel model) => Row(
  //       children: [
  //         Container(
  //           height: 50,
  //           width: 100,
  //           decoration: BoxDecoration(
  //             color: Colors.grey.shade200,
  //             borderRadius: BorderRadius.circular(10),
  //           ),
  //           child: Center(child: Text('${model.data!.plants}')),
  //         ),
  //       ],
  //     );
}
