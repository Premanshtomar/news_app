import 'package:flutter/material.dart';
import 'package:news_app/values/text_styles.dart';

Widget customRichText(String text) {
  return RichText(
    text: TextSpan(
      text: text.substring(0, 1),
      style: AppTextStyles.appbarTextFirstStyle,
      children: [
        TextSpan(
          text: text.substring(1),
          style: AppTextStyles.appbarTextSecondStyle,
        ),
      ],
    ),
  );
}
