import 'package:flutter/material.dart';
import 'package:news_app/home/models/headlines.dart';
import 'package:news_app/utils/date_formater/date_formater.dart';
import 'package:news_app/values/app_images.dart';
import 'package:news_app/values/colors.dart';
import 'package:news_app/values/routes.dart';
import 'package:news_app/values/text_styles.dart';

class NewsViewCard extends StatelessWidget {
  final Article article;

  const NewsViewCard({
    super.key,
    required this.article,
  });

  String getDate() {
    var dateGiven = article.publishedAt;
    DateTime date = dateFormatter(dateGiven!);
    String dateToShow = getDateFromDateTime(date);
    return dateToShow;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, AppRoutes.details, arguments: article);
        },
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: AppColors.white,
            boxShadow: [
              BoxShadow(
                color: AppColors.black.withOpacity(0.2),
                offset: const Offset(
                  0.0,
                  0.0,
                ),
                blurRadius: 8.0,
                spreadRadius: 0.0,
              ),
            ],
          ),
          width: MediaQuery.of(context).size.width,
          // height: MediaQuery.of(context).size.height * 0.45,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.2,
                decoration: BoxDecoration(
                  color: AppColors.black,
                  borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(12),
                    topLeft: Radius.circular(12),
                  ),
                  image: DecorationImage(
                    colorFilter: ColorFilter.mode(
                      AppColors.black.withOpacity(0.35),
                      BlendMode.multiply,
                    ),
                    image: NetworkImage(
                        article.urlToImage ?? AppNetworkImages.newsImage),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Stack(
                  children: [
                    Align(
                      alignment: Alignment.topLeft,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          vertical: 4,
                          horizontal: 8,
                        ),
                        margin: const EdgeInsets.only(top: 12),
                        decoration: BoxDecoration(
                          color: AppColors.black.withOpacity(0.4),
                          borderRadius: const BorderRadius.only(
                            topRight: Radius.circular(8),
                            bottomRight: Radius.circular(8),
                          ),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            if (article.source?.name != null &&
                                article.source!.name!.isNotEmpty)
                              Text(
                                article.source!.name!,
                                style: const TextStyle(
                                  fontSize: 16,
                                  color: AppColors.white,
                                ),
                              ),
                          ],
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(
                                vertical: 4, horizontal: 8),
                            margin: const EdgeInsets.only(bottom: 12),
                            decoration: BoxDecoration(
                              color: AppColors.black.withOpacity(0.4),
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(8),
                                bottomLeft: Radius.circular(8),
                              ),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                SizedBox(
                                    width: MediaQuery.of(context).size.width *
                                        0.001),
                                Text(getDate(), style: AppTextStyles.bodyText),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      article.title ?? '',
                      style: AppTextStyles.bodyText18BlackBold,
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 4),
                    Text(
                      article.description ?? '',
                      style: AppTextStyles.bodyTextTwoBlack,
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 2),
                    const Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        'read more..',
                        style: AppTextStyles.bodyTextTwoBlackBold,
                        textAlign: TextAlign.end,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
