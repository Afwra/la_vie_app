import 'package:flutter/material.dart';
import 'package:la_vie_app/shared/components/components.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              defaultSearchField(),
              const SizedBox(height: 20,),
              Row(
                children: [
                  const Icon(
                    Icons.watch_later_outlined,
                    color: Colors.grey,
                  ),
                  const SizedBox(width: 10,),
                  Expanded(child: Text('gardenia plant',style: TextStyle(color: Colors.grey),overflow: TextOverflow.ellipsis,maxLines: 2,)),
                  IconButton(onPressed: (){}, icon: const Icon(Icons.close,color: Colors.grey,)),
                ],
              ),
              const SizedBox(height: 10,),
              Row(
                children: [
                  const Icon(
                    Icons.watch_later_outlined,
                    color: Colors.grey,
                  ),
                  const SizedBox(width: 10,),
                  Text('gardenia plant',style: TextStyle(color: Colors.grey),),
                  const Spacer(),
                  IconButton(onPressed: (){}, icon: const Icon(Icons.close,color: Colors.grey,)),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
