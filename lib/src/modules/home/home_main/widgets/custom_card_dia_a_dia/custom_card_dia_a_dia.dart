import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'package:raro_budget/src/modules/home/home_main/widgets/custom_card_dia_a_dia/custom_progress_bar.dart';
import 'package:raro_budget/src/shared/constants/app_colors.dart';
import 'package:raro_budget/src/shared/constants/app_text_styles.dart';
import 'package:raro_budget/src/shared/widgets/custom_drop_down_button/custom_drop_down.dart';

class CustomCard extends StatefulWidget {
  final Function()? onTape;
  final AnimationController? animationController;
  final double totalIn;
  final double totalOut;
  final double total;
  final Widget progressBarIn;
  final Widget progressBarOut;
  final Widget dropDown;

  CustomCard({
    Key? key,
    this.animationController,
    this.onTape,
    required this.progressBarIn,
    required this.progressBarOut,
    required this.totalIn,
    required this.totalOut,
    required this.total,
    required this.dropDown,
  }) : super(key: key);

  @override
  _CustomCardState createState() => _CustomCardState();
}

class _CustomCardState extends State<CustomCard> {
  @override
  Widget build(BuildContext context) {
    return InkResponse(
      onTap: () {
        Modular.to.navigate("homefilled");
      },
      child: Container(
        padding: EdgeInsets.all(16.0),
        margin: EdgeInsets.all(16.0),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(7.0),
            color: AppColors.white,
            boxShadow: [
              BoxShadow(
                color: AppColors.black.withOpacity(0.12),
                offset: Offset(0.0, 1.0),
                blurRadius: 8.0,
              ),
              BoxShadow(
                color: AppColors.black.withOpacity(0.14),
                offset: Offset(0.0, 3.0),
                blurRadius: 4.0,
              ),
              BoxShadow(
                color: AppColors.black.withOpacity(0.2),
                offset: Offset(0.0, 3.0),
                blurRadius: 3.0,
                spreadRadius: -2.0,
              ),
            ]),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Saldo geral",
                  style: TextStyles.purple20w500Roboto,
                ),
                widget.dropDown,
              ],
            ),
            Column(
              children: [
                Text(
                  "R\$ ${widget.total.toStringAsFixed(2)}",
                  style: TextStyles.black24w400Roboto,
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 16, 0, 8),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Saídas',
                    style: TextStyles.black5414w400Roboto,
                  ),
                  Text(
                    'R\$ ${widget.totalOut.toStringAsFixed(2)}',
                    style: TextStyles.black5414w400Roboto,
                  ),
                ],
              ),
            ),
            widget.progressBarOut,
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 16, 0, 8),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Entradas',
                    style: TextStyles.black5414w400Roboto,
                  ),
                  Text(
                    'R\$ ${widget.totalIn.toStringAsFixed(2)}',
                    style: TextStyles.black5414w400Roboto,
                  ),
                ],
              ),
            ),
            widget.progressBarIn,
          ],
        ),
      ),
    );
  }
}
