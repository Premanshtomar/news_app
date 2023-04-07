import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/splash/bloc/app_cubit.dart';
import 'package:news_app/values/routes.dart';
import 'package:news_app/widgets/rich_text_widget.dart';

class HeadlinesScreen extends StatelessWidget {
  static const route = '/headlines';

  const HeadlinesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubit, AppState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: appbarRichText('headlines'),
            actions: const [],
          ),
          body: ListView.builder(
            itemCount: 15,
            itemBuilder: (
              BuildContext context,
              int index,
            ) {
              return InkWell(
                // child: NewsViewCard(
                // ),
                onTap: () async {
                  Navigator.pushNamed(context, AppRoutes.details);
                },
              );
            },
          ),
        );
      },
    );
  }
}
