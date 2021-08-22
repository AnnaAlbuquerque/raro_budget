import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'package:raro_budget/src/shared/constants/app_colors.dart';
import 'package:raro_budget/src/shared/constants/app_text_styles.dart';
import 'package:raro_budget/src/shared/widgets/custom_drop_down_button/custom_drop_down.dart';

import '../custom_progress_bar/custom_progress_bar.dart';

class CustomCard extends StatefulWidget {
  final Function()? onTape;
  final AnimationController? animationController;
  final Widget dropDown;

  const CustomCard({
    Key? key,
    this.onTape,
    this.animationController,
    required this.dropDown,
  }) : super(key: key);

  @override
  _CustomCardState createState() => _CustomCardState();
}

class _CustomCardState extends State<CustomCard> {
  @override
  Widget build(BuildContext context) {
    String entrada = '8.000,00';
    String saida = '5.000,00';
    String total = '3.000,00';
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
                  "R\$ $total",
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
                    'R\$ $saida',
                    style: TextStyles.black5414w400Roboto,
                  ),
                ],
              ),
            ),
            CustomProgressBar(
              currentValue: 70,
              progressColor: AppColors.cyan,
            ),
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
                    'R\$ $entrada',
                    style: TextStyles.black5414w400Roboto,
                  ),
                ],
              ),
            ),
            CustomProgressBar(
              currentValue: 100,
              progressColor: AppColors.yellow,
            ),
          ],
        ),
      ),
    );
  }
}
