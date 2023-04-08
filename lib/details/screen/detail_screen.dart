import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/details/bloc/details_cubit.dart';
import 'package:news_app/home/models/headlines.dart';
import 'package:news_app/utils/date_formater/date_formater.dart';
import 'package:news_app/utils/launch_url.dart';
import 'package:news_app/values/app_images.dart';
import 'package:news_app/values/colors.dart';
import 'package:news_app/values/text_styles.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Article article = ModalRoute.of(context)!.settings.arguments as Article;
    String getDate() {
      var dateGiven = article.publishedAt;
      DateTime date = dateFormatter(dateGiven!);
      String dateToShow = getDateFromDateTime(date);
      return dateToShow;
    }

    return BlocProvider(
      create: (context) => DetailsCubit(),
      child: BlocBuilder<DetailsCubit, DetailsState>(
        builder: (context, state) {
          var cubit = context.read<DetailsCubit>();
          return Scaffold(
            body: CustomScrollView(
              slivers: [
                SliverAppBar(
                  pinned: true,
                  iconTheme: IconThemeData(
                    color: state.isSliverExpanded
                        ? AppColors.white
                        : AppColors.black,
                  ),
                  systemOverlayStyle: state.isSliverExpanded
                      ? SystemUiOverlayStyle.light
                      : SystemUiOverlayStyle.dark,
                  // leading: Padding(
                  //   padding: const EdgeInsets.only(bottom: 16.0),
                  //   child: IconButton(
                  //     onPressed: () {
                  //       Navigator.pop(context);
                  //     },
                  //     icon: Icon(
                  //       Icons.arrow_back,
                  //       color: state.systemDark ? Colors.black : Colors.white,
                  //     ),
                  //   ),
                  // ),

                  expandedHeight: MediaQuery.of(context).size.height * 0.25,
                  flexibleSpace: FlexibleSpaceBar(
                    title: LayoutBuilder(
                      builder: (context, constraints) {
                        cubit.checkIfCompact(
                            constraints, MediaQuery.of(context).size.height);
                        return Align(
                          alignment: Alignment.bottomRight,
                          child: Padding(
                            padding: const EdgeInsets.only(right: 18.0),
                            child: Text(
                              article.source?.name ?? '',
                              style: TextStyle(
                                color: state.isSliverExpanded
                                    ? Colors.white
                                    : Colors.black,
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                    background: Image.network(
                      article.urlToImage ?? AppNetworkImages.newsImage,
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
                          margin: const EdgeInsets.fromLTRB(4, 10, 4, 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                article.title ?? '',
                                style: AppTextStyles.bodyText24BlackBold,
                              ),
                              Align(
                                alignment: Alignment.centerRight,
                                child: Padding(
                                  padding: const EdgeInsets.only(right: 10.0),
                                  child: Text(
                                    getDate(),
                                    textAlign: TextAlign.right,
                                    style: AppTextStyles.bodyText12Black
                                        .copyWith(color: AppColors.grey),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          margin: const EdgeInsets.fromLTRB(0, 8, 0, 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                article.description ?? '',
                                style: AppTextStyles.bodyTextTwoBlack,
                              ),
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.015,
                              ),
                              TextButton(
                                onPressed: () {
                                  launchURL(article.url!);
                                },
                                child: Text(
                                  article.url ?? '',
                                  style: AppTextStyles.bodyText12.copyWith(
                                    color: AppColors.amber,
                                  ),
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
      ),
    );
  }
}
