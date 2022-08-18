import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

class ScanScreen extends StatelessWidget {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  final  scaffoldKey = GlobalKey<ScaffoldState>();

  ScanScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        key: scaffoldKey,
        body: Column(
          children: [
            MaterialButton(
              color: Colors.green,
              onPressed: (){
                scaffoldKey.currentState!.showBottomSheet(
                  backgroundColor: Colors.grey.shade200,
                  (context) => Column(
                    children: [
                      Row(
                        children: [
                          Container(
                            height: 60,
                            width: 60,
                            decoration: const BoxDecoration(
                                color: Colors.grey
                            ),
                            child: Center(
                              child:Icon(Ionicons.sunny_outline,size: 32,),
                            ),
                          ),
                          Column(
                            children: [
                              Text('78',style: TextStyle(color: Colors.white,fontSize: 22),),
                              Text('Sunlight'),
                            ],
                          )
                        ],
                      )
                    ],
                  ),
                );

              },
              child: Text('press here'),
            ),
          ],
        ),
        // body: Column(
        //   children: [
        //     Expanded(
        //       flex: 5,
        //       child: QRView(
        //         key: qrKey,
        //         overlay: QrScannerOverlayShape(
        //           borderColor: Colors.white,
        //           borderLength: 20,
        //           borderWidth: 10
        //         ),
        //         onQRViewCreated: (value){
        //
        //         },
        //       ),
        //     ),
        //
        //   ],
        // ),
      ),
    );
  }
}
