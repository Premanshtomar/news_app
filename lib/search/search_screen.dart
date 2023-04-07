import 'package:flutter/material.dart';
import 'package:news_app/values/colors.dart';

class SearchNews extends StatelessWidget {
  const SearchNews({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: SizedBox(
            height: kToolbarHeight - 10,
            child: TextField(
              autofocus: true,
              decoration: InputDecoration(
                  contentPadding: const EdgeInsets.all(10.0),
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: AppColors.amber),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
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
                hintText: 'Type to Search...',
              ),
            ),
          ),
        ),
      ),
    );
  }
}
