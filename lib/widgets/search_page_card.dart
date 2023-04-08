import 'package:flutter/material.dart';
import 'package:news_app/home/models/headlines.dart';
import 'package:news_app/values/app_images.dart';
import 'package:news_app/values/colors.dart';
import 'package:news_app/values/routes.dart';
import 'package:news_app/values/text_styles.dart';

class SearchNewsCard extends StatelessWidget {
  final Article article;

  const SearchNewsCard({Key? key, required this.article}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(
          context,
          AppRoutes.details,
          arguments: article,
        );
      },
      child: Container(
        margin: const EdgeInsets.only(
          top: 12, left: 8, right: 8,
          // bottom: 16,
        ),
        decoration: BoxDecoration(
            color: AppColors.cremeColor,
            borderRadius: BorderRadius.circular(15)),
        width: MediaQuery.of(context).size.width * 0.16,
        height: MediaQuery.of(context).size.height * 0.16,
        child: Row(
          children: [
            Container(
              width: MediaQuery.of(context).size.width * 0.4,
              margin: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Image.network(
                article.urlToImage ?? AppNetworkImages.newsImage,
              ),
            ),
            Expanded(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  article.title ?? '',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: AppTextStyles.bodyText18BlackBold,
                ),
                Text(article.description ?? '',
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: AppTextStyles.bodyTextBlack),
                // const SizedBox(
                //   height: 14,
                // ),
              ],
            ))
          ],
        ),
      ),
    );
  }
}
