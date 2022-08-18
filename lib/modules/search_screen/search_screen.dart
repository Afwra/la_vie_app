import 'package:flutter/material.dart';
import 'package:la_vie_app/shared/components/components.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            defaultSearchField(),
          ],
        ),
      ),
    );
  }
}
