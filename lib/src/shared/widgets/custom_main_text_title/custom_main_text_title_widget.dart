import 'package:flutter/material.dart';
import '../../constants/app_text_styles.dart';

class CustomMainTextTitle extends StatelessWidget {
  final String titleFirstLine;
  final String? titleSecondLine;
  final String? subtitle;
  final bool newUser;

  const CustomMainTextTitle({
    Key? key,
    required this.titleFirstLine,
    required this.newUser,
    this.titleSecondLine,
    this.subtitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool titleSecondLineVisible = true;
    bool subtitleVisible = true;

    if (titleSecondLine == null) {
      titleSecondLineVisible = false;
    }

    if (subtitle == null) {
      subtitleVisible = false;
    }

    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            titleFirstLine,
            style: TextStyles.cyan48w400Roboto,
          ),
          Visibility(
            visible: titleSecondLineVisible,
            child: Text(
              titleSecondLineVisible ? titleSecondLine as String : "",
              style: TextStyles.cyan48w400Roboto,
            ),
          ),
          Visibility(
            visible: subtitleVisible,
            child: Text(
              subtitleVisible ? subtitle as String : "",
              style: TextStyles.purple20w500Roboto,
            ),
          ),
          SizedBox(height: 8.0),
          Visibility(
              visible: newUser,
              child: Row(children: [
                Text(
                  "Novo usuário? ",
                  style: TextStyles.black5416w400Roboto,
                ),
                GestureDetector(
                  onTap: () {},
                  child: Text(
                    "Crie uma conta",
                    style: TextStyles.purple16w400Roboto,
                  ),
                )
              ])),
        ],
      ),
    );
  }
}
