import 'package:flutter/material.dart';
import 'package:news_app/utils/constants.dart';
import 'package:news_app/values/colors.dart';
import 'package:news_app/values/text_styles.dart';
import 'package:news_app/widgets/rich_text_widget.dart';

class InfoScreen extends StatelessWidget {
  const InfoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: appbarRichText('info'),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            SizedBox(
              height: size.height * 0.03,
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.amberAccent.shade100,
                borderRadius: BorderRadius.circular(12),
              ),
              height: size.height * 0.2,
              width: size.width * 0.7,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(height: size.height * 0.015),
                  const Icon(
                    Icons.info_outline,
                    color: AppColors.black,
                  ),
                  SizedBox(height: size.height * 0.015),
                  RichText(
                    textAlign: TextAlign.center,
                    text: const TextSpan(
                      children: [
                        TextSpan(
                          text: 'Search Button in AppBar\n',
                          style: AppTextStyles.bodyTextBlackBold,
                        ),
                        TextSpan(
                          text: 'Search for query form the news.',
                          style: AppTextStyles.bodyTextBlack,
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.015,
                  ),
                  RichText(
                    textAlign: TextAlign.center,
                    text: const TextSpan(

                      children: [
                        TextSpan(
                          text: 'Floating Action Search Button\n',
                          style: AppTextStyles.bodyTextBlackBold,
                        ),
                        TextSpan(
                          text: 'Search for query within the page or list.',
                          style: AppTextStyles.bodyTextBlack,
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            appbarRichText('news.', size1: 66, size2: 44, lastColored: true),
            const Text('App Version: $kAppVersion'),
            const Text('Build Number: $kBuildNumber'),
            const Spacer(),
            Text(
              'Made with \u2665 by Premansh Tomar',
              style: AppTextStyles.bodyText18BlackBold.copyWith(
                fontFamily: 'dosis',
              ),
            ),
            const SizedBox(height: kToolbarHeight),
          ],
        ),
      ),
    );
  }
}
