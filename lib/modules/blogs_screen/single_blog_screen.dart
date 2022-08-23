import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class SingleBlogScreen extends StatelessWidget {
  const SingleBlogScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 300,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/blog.png'),
                  fit: BoxFit.cover
                )
              ),
            ),
            const SizedBox(height: 40,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Text(
                  '5 Simple Tips to treat plants',
                style: TextStyle(
                  fontSize: 24,

                ),
              ),
            ),
            const SizedBox(height: 20,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30.0),
              child: Text(
                  'leaf, in botany, any usually flattened green outgrowth from the stem of ',
                style: TextStyle(
                  color: HexColor('#7D7B7B'),
                  fontSize: 16
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
