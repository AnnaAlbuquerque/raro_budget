import 'package:flutter/material.dart';
import 'package:raro_budget/src/shared/constants/app_colors.dart';
import 'package:raro_budget/src/shared/constants/app_text_styles.dart';

class CustomAppBar extends StatelessWidget with PreferredSizeWidget {
  final String title;
  final double prefSize;
  final IconData? iconDataLeft;
  final IconData? iconDataRight;
  final String? button1;
  final String? button2;
  final String? button3;

  const CustomAppBar({
    Key? key,
    required this.title,
    required this.prefSize,
    this.iconDataLeft,
    this.button1,
    this.button2,
    this.button3,
    this.iconDataRight,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      flexibleSpace: Center(
        child: Container(
          decoration: BoxDecoration(
            gradient: AppColors.cyanToPurpleAppBar,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              iconDataLeft == null &&
                      iconDataRight == null &&
                      button1 == null &&
                      button2 == null &&
                      button3 == null
                  ? Container(
                      margin: EdgeInsets.fromLTRB(24, 48, 24, 24),
                      alignment: Alignment.centerLeft,
                      child: Text(
                        title,
                        style: TextStyles.white26w700Roboto,
                      ),
                    )
                  : Container(),
              iconDataLeft != null && iconDataRight != null && prefSize == 120
                  ? Column(
                      children: [
                        Container(
                          margin: EdgeInsets.fromLTRB(20, 20, 10, 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              IconButton(
                                onPressed: () {},
                                icon: Icon(
                                  iconDataLeft,
                                  color: AppColors.white,
                                ),
                              ),
                              Container(
                                child: Row(
                                  children: [
                                    Text(
                                      'Agosto',
                                      style: TextStyles.white14w500Roboto,
                                    ),
                                    IconButton(
                                      onPressed: () {},
                                      icon: Icon(
                                        iconDataRight,
                                        color: AppColors.white,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
                          child: Text(
                            title,
                            style: TextStyles.white26w700Roboto,
                          ),
                        ),
                      ],
                    )
                  : Container(),
              iconDataLeft != null && iconDataRight == null && prefSize == 60
                  ? Padding(
                      padding: const EdgeInsets.fromLTRB(20, 40, 20, 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(
                            onPressed: () {},
                            icon: Icon(
                              iconDataLeft,
                              color: AppColors.white,
                            ),
                          ),
                          Expanded(
                            flex: 5,
                            child: Text(
                              title,
                              textAlign: TextAlign.center,
                              style: TextStyles.white24w400Roboto,
                            ),
                          ),
                          Spacer()
                        ],
                      ),
                    )
                  : Container(),
              iconDataLeft != null && iconDataRight == null && prefSize == 120
                  ? Padding(
                      padding: const EdgeInsets.fromLTRB(20, 40, 20, 20),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            alignment: Alignment.centerLeft,
                            child: IconButton(
                              onPressed: () {},
                              icon: Icon(
                                iconDataLeft,
                                color: AppColors.white,
                              ),
                            ),
                          ),
                          Container(
                            alignment: Alignment.center,
                            child: Text(
                              title,
                              style: TextStyles.white26w700Roboto,
                            ),
                          ),
                        ],
                      ),
                    )
                  : Container(),
              button1 != null && button2 != null && button3 != null
                  ? Container(
                      margin: const EdgeInsets.fromLTRB(30, 0, 30, 10),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TextButton(
                            onPressed: () {},
                            child: Text(
                              '$button1',
                              style: TextStyles.white16w400Roboto,
                            ),
                          ),
                          Container(
                            color: AppColors.white,
                            height: 22,
                            width: 2,
                          ),
                          TextButton(
                            onPressed: () {},
                            child: Text(
                              '$button2',
                              style: TextStyles.white16w400Roboto,
                            ),
                          ),
                          Container(
                            color: AppColors.white,
                            height: 22,
                            width: 2,
                          ),
                          TextButton(
                            onPressed: () {},
                            child: Text(
                              '$button3',
                              style: TextStyles.white16w400Roboto,
                            ),
                          ),
                        ],
                      ),
                    )
                  : Container(),
            ],
          ),
        ),
      ),
      actions: [],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(prefSize);
}