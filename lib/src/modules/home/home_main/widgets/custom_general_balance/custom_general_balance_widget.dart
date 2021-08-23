import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:raro_budget/src/modules/home/home_main/widgets/custom_general_balance/custom_general_balance_widget_controller.dart';
import 'package:raro_budget/src/shared/constants/app_colors.dart';
import 'package:raro_budget/src/shared/constants/app_text_styles.dart';

class CustomGeneralBalance extends StatefulWidget {
  const CustomGeneralBalance({Key? key, required this.balance})
      : super(key: key);
  final double balance;
  @override
  _CustomGeneralBalanceState createState() => _CustomGeneralBalanceState();
}

class _CustomGeneralBalanceState extends State<CustomGeneralBalance> {
  final CustomGeneralBalanceWidgetController controller =
      CustomGeneralBalanceWidgetController();
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(7.0),
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
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
        child: Observer(builder: (_) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Saldo geral',
                    style: TextStyles.purple20w500Roboto,
                  ),
                  IconButton(
                    icon: Icon(
                      controller.balanceVisible
                          ? Icons.visibility
                          : Icons.visibility_off,
                      color: AppColors.purple,
                    ),
                    onPressed: () => controller.changeBalanceVisibility(),
                  ),
                ],
              ),
              Visibility(
                visible: controller.balanceVisible,
                child: Text(
                  'R\$ ${widget.balance.toStringAsFixed(2)}',
                  style: TextStyles.black24w400Roboto,
                ),
              ),
            ],
          );
        }),
      ),
    );
  }
}
