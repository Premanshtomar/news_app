import 'package:flutter/material.dart';
import 'package:news_app/utils/constants.dart';
import 'package:news_app/values/text_styles.dart';
import 'package:news_app/widgets/rich_text_widget.dart';

class InfoScreen extends StatelessWidget {
  const InfoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: appbarRichText('info'),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(),
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
