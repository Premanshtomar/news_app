import 'package:flutter/material.dart';
import 'package:news_app/values/text_styles.dart';

Widget appbarRichText(String text,
    {double? size1, double? size2, bool lastColored = false}) {
  return RichText(
    text: TextSpan(
      text: text.substring(0, 1).toLowerCase(),
      style: AppTextStyles.appbarTextFirstStyle.copyWith(fontSize: size1),
      children: [
        TextSpan(
          text: text
              .substring(1, lastColored ? text.length - 1 : null)
              .toLowerCase(),
          style: AppTextStyles.appbarTextSecondStyle.copyWith(fontSize: size2),
        ),
        if (lastColored)
          TextSpan(
            text: text.substring(text.length - 1).toLowerCase(),
            style: AppTextStyles.appbarTextFirstStyle.copyWith(fontSize: size1),
          ),
      ],
    ),
  );
}
