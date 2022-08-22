import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:ionicons/ionicons.dart';
import 'package:la_vie_app/models/cart_model.dart';
import 'package:la_vie_app/shared/components/components.dart';
import 'package:la_vie_app/shared/cubit/app_cubit/cubit.dart';
import 'package:la_vie_app/shared/cubit/app_cubit/states.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit,AppStates>(
      listener: (context,state){},
      builder: (context,state){
        AppCubit cubit = AppCubit.get(context);
        return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            title: const Text(
              'My Cart',
              style: TextStyle(
                  color: Colors.black
              ),
            ),
            backgroundColor: Colors.white,
            elevation: 0,
            centerTitle: true,
            leading: IconButton(icon:const Icon( Ionicons.arrow_back_outline,color: Colors.black,),onPressed: (){Navigator.pop(context);},),
          ),
          body: Padding(
            padding: const EdgeInsets.all(29.0),
            child: ConditionalBuilder(
                condition: cubit.cart.isNotEmpty,
                builder: (context) => Column(
                  children: [
                    Expanded(
                      child: ListView.separated(
                          itemBuilder: (context,index) => buildCartItem(cubit.cart[index],context),
                          separatorBuilder: (context,index)=>  const SizedBox(height: 20,),
                          itemCount: cubit.cart.length
                      ),
                    ),
                    const SizedBox(height: 30,),
                    Row(
                      children: [
                        Text(
                          'Total',
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                              color: Colors.black.withOpacity(0.75)
                          ),
                        ),
                        const Spacer(),
                        Text(
                          '${cubit.totalCartPrice} EGP',
                          style: TextStyle(
                              color: HexColor('#1ABC00'),
                              fontWeight: FontWeight.w600,
                              fontSize: 17
                          ),
                        )
                      ],
                    ),
                    const SizedBox(height: 27,),
                    defaultButton(text: 'Checkout')
                  ],
                ),
                fallback: (context)=> Column(
                  children: [
                    defaultEmptyScreen(title: 'Your Cart Is Empty'),
                  ],
                ),
            ),
          ),
        );
      },
    );
  }

  Widget buildCartItem(CartModel data,BuildContext context) => SizedBox(
    height: 170,
    width: double.infinity,
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
                      image: data.image == ''
                          ? const NetworkImage(
                          'https://upload.wikimedia.org/wikipedia/commons/thumb/6/65/No-Image-Placeholder.svg/1665px-No-Image-Placeholder.svg.png')
                          : NetworkImage(
                          'https://lavie.orangedigitalcenteregypt.com${data.image}'),
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
                    '${data.name}',
                    style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 16,),
                  Text(
                    '${data.price} EGP',
                    style: const TextStyle(
                      color: Colors.green,
                    ),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                  const SizedBox(height: 19,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,

                    children: [
                      SizedBox(
                        width:125,
                        child: Center(
                          child: Card(
                            shadowColor: Colors.white,
                            child: Row(
                              children: [
                                IconButton(
                                    onPressed: (){
                                      if(data.count! > 1){
                                        AppCubit.get(context).decrementCartCounter(data: data);
                                      }
                                    },
                                    icon: const Icon(Ionicons.remove,color: Colors.green,size: 16,)
                                ),
                                Expanded(
                                  child: Text('${data.count}',style:const TextStyle(
                                    fontSize: 14,
                                    color: Colors.black,
                                  ),maxLines: 1,overflow: TextOverflow.ellipsis,),
                                ),
                                IconButton(
                                    onPressed: (){
                                      AppCubit.get(context).incrementCartCounter(data: data);
                                    },
                                    icon: const Icon(Ionicons.add,color: Colors.green,size: 16,)
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),

                      const Spacer(),
                      IconButton(
                          onPressed: (){
                            AppCubit.get(context).deleteFromCart(model: data);
                          },
                          icon: const Icon(Ionicons.trash_bin_outline,color: Colors.green,size: 25,)
                      ),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    ),
  );
}
