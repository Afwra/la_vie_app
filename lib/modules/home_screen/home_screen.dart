import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ionicons/ionicons.dart';
import 'package:la_vie_app/modules/cart_screen/cart_screen.dart';
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
                          cubit.isSearchSubmitted = false;
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
                        onPressed: () {
                          cubit.getFromCart();
                          navigateTo(context, CartScreen());
                        },
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
                          cubit.getProducts(context: context);
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
                          // cubit.getPlants();
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
                          // cubit.getSeeds();
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
                          // cubit.getTools();
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
                    itemBuilder: (context,index)=>buildProductItem(cubit.productsModel!.data![index],context),
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                  ),
                  fallback: (context) =>const Center(child: CircularProgressIndicator()),
                ),
              if(cubit.isPlantsPressed)
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
                  itemCount: cubit.plants.length,
                  itemBuilder: (context,index)=>buildProductItem(cubit.plants[index],context),
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                ),
                fallback: (context) =>const Center(child: CircularProgressIndicator()),
              ),
              if(cubit.isToolsPressed)
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
                    itemCount: cubit.tools.length,
                    itemBuilder: (context,index)=>buildProductItem(cubit.tools[index],context),
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                  ),
                  fallback: (context) =>const Center(child: CircularProgressIndicator()),
                ),
              if(cubit.isSeedsPressed)
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
                    itemCount: cubit.seeds.length,
                    itemBuilder: (context,index)=>buildProductItem(cubit.seeds[index],context),
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
