import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:ionicons/ionicons.dart';
import 'package:la_vie_app/shared/components/components.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
        child: Column(
          children: [
            // Container(
            //
            //   width: double.infinity,
            //   height: 200,
            //   decoration: BoxDecoration(
            //     color: Colors.white,
            //     boxShadow: [BoxShadow(blurRadius: 0.1)],
            //     borderRadius: BorderRadius.circular(10),
            //
            //   ),
            // ),
            Expanded(
              child: ListView.separated(
                  itemBuilder: (context,index) => SizedBox(
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
                              decoration: const BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage('assets/images/Rectangle.png')
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
                                    'Cactus Plant ldajfkldaskljdlfsaj',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18
                                    ),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  const SizedBox(height: 16,),
                                  Text(
                                    '200 EGP',
                                    style: TextStyle(
                                      color: Colors.green,
                                    ),
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 1,
                                  ),
                                  const SizedBox(height: 19,),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,

                                    children: [
                                      Container(
                                        width:125,
                                        child: Center(
                                          child: Card(
                                            shadowColor: Colors.white,
                                            child: Row(
                                              children: [
                                                IconButton(
                                                    onPressed: (){},
                                                    icon: Icon(Ionicons.remove,color: Colors.green,size: 16,)
                                                ),
                                                Expanded(
                                                  child: Text('1',style: TextStyle(
                                                    fontSize: 14,
                                                    color: Colors.black,
                                                  ),maxLines: 1,overflow: TextOverflow.ellipsis,),
                                                ),
                                                IconButton(
                                                    onPressed: (){},
                                                    icon: Icon(Ionicons.add,color: Colors.green,size: 16,)
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),

                                      const Spacer(),
                                      IconButton(
                                          onPressed: (){},
                                          icon: Icon(Ionicons.trash_bin_outline,color: Colors.green,size: 25,)
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
                  ),
                  separatorBuilder: (context,index)=>  const SizedBox(height: 20,),
                  itemCount: 10
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
                    '180000 EGP',
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
            // defaultEmptyScreen(title: 'Your Cart Is Empty'),
          ],
        ),
      ),
    );
  }
}
