import 'package:flutter/material.dart';
import 'package:news_app/values/colors.dart';

class SearchNews extends StatelessWidget {
  const SearchNews({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: SizedBox(
          height: kToolbarHeight-10,
          child: TextField(
            autofocus: true,
            decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: AppColors.amber),
                  borderRadius: BorderRadius.circular(15),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: const BorderSide(color:AppColors.amber),
                ),
              suffixIcon: IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.search,
                  color: AppColors.black,
                ),
              ),
              // border: InputBorder.none,
              hintText: 'Type to Search...'
            ),
          ),
        ),
      ),
    );
  }
}
