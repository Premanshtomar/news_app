import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/home/home_screen/home_screen.dart';
import 'package:news_app/splash/bloc/app_cubit.dart';
import 'package:news_app/values/app_images.dart';
import 'package:news_app/values/text_styles.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubit, AppState>(
      builder: (context, state) {
        var cubit = context.read<AppCubit>();
        return Scaffold(
          body: CustomScrollView(
            slivers: [
              SliverAppBar(
                backgroundColor: Colors.white,
                foregroundColor: Colors.black,
                pinned: true,
                systemOverlayStyle: state.systemDark
                    ? SystemUiOverlayStyle.dark
                    : SystemUiOverlayStyle.light,
                leading: Padding(
                  padding: const EdgeInsets.only(bottom: 16.0),
                  child: IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(
                      Icons.arrow_back,
                      color: state.systemDark ? Colors.black : Colors.white,
                    ),
                  ),
                ),

                // backgroundColor: Colors.red,
                expandedHeight: MediaQuery.of(context).size.height * 0.25,
                flexibleSpace: FlexibleSpaceBar(
                  title: LayoutBuilder(
                    builder: (context, constraints) {
                      var isCompact = constraints.maxHeight >
                          MediaQuery.of(context).size.height * 0.14;
                      WidgetsBinding.instance.addPostFrameCallback((_) {
                        if (isCompact) {
                          cubit.onSliverScrolledUp();
                        } else {
                          cubit.onSliverScrolledDown();
                        }
                      });
                      return Align(
                        alignment: Alignment.bottomRight,
                        child: Padding(
                          padding: const EdgeInsets.only(right: 18.0),
                          child: Text(
                            'Source',
                            style: TextStyle(
                              color: isCompact ? Colors.white : Colors.black,
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                  background: Image.network(
                    AppNetworkImages.newsImage,
                    fit: BoxFit.fill,
                    color: Colors.black.withOpacity(0.32),
                    colorBlendMode: BlendMode.darken,
                    // color: Colors.black.withOpacity(0.32),
                  ),
                ),
              ),
              SliverList(
                delegate: SliverChildBuilderDelegate((context, index) {
                  return Column(
                    children: [
                      Container(
                        margin: const EdgeInsets.fromLTRB(5, 10, 5, 10),
                        // color: Colors.red,
                        child: Text(
                          h1,
                          style: AppTextStyles.bodyText24BlackBold,
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.only(left: 10, right: 10),
                        // color: Colors.yellow,
                        margin: const EdgeInsets.fromLTRB(0, 8, 0, 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 16.0),
                              child: Text(
                                h2 +
                                    h2 +
                                    h2 +
                                    h2 +
                                    h2 +
                                    h2 +
                                    h2 +
                                    h2 +
                                    h2 +
                                    h2 +
                                    h2 +
                                    h2,
                                style: AppTextStyles.bodyText18Black,
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  );
                }, childCount: 1),
              )
            ],
          ),
        );
      },
    );
  }
}
