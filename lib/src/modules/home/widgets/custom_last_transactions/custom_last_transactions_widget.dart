import 'package:flutter/material.dart';
import 'package:raro_budget/src/modules/home/widgets/custom_transaction_item/custom_transaction_item_widget.dart';
import 'package:raro_budget/src/shared/constants/app_colors.dart';
import 'package:raro_budget/src/shared/constants/app_text_styles.dart';

class CustomLastTransactions extends StatelessWidget {
  const CustomLastTransactions({
    Key? key,
    this.value,
  }) : super(key: key);

  final String? value;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
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
          padding: const EdgeInsets.only(
              left: 16.0, top: 9.0, right: 16.0, bottom: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'Últimas transações',
                        style: TextStyles.purple20w500Roboto,
                      ),
                      SizedBox(height: 8.0),
                      Text(
                        'R\$ ${value ?? '398,30'}',
                        style: TextStyles.black5424w400Roboto,
                      ),
                      SizedBox(height: 4.0),
                      Text(
                        'No momento',
                        style: TextStyles.grey14w400Roboto,
                      ),
                    ],
                  ),
                  InkWell(
                    onTap: () {},
                    child: Ink(
                        child:
                            Icon(Icons.chevron_right, color: AppColors.purple)),
                  ),
                ],
              ),
              SizedBox(height: 24.0),
              // CustomTransactionItem(
              //   color: AppColors.yellow,
              //   title: 'Refeições',
              //   transferredValue: '25,00',
              //   icon: 'assets/icons/meal_icon.png',
              //   textstyle: TextStyles.black8716w400Roboto,
              // ),
              // SizedBox(height: 24.0),
              // CustomTransactionItem(
              //   color: AppColors.green,
              //   title: 'Transporte',
              //   transferredValue: '57,30',
              //   icon: 'assets/icons/transport_icon.png',
              //   textstyle: TextStyles.black8716w400Roboto,
              // ),
              // SizedBox(height: 24.0),
              // CustomTransactionItem(
              //   color: AppColors.lightBlue,
              //   title: 'Educação',
              //   transferredValue: '316,00',
              //   icon: 'assets/icons/education_icon.png',
              //   textstyle: TextStyles.black8716w400Roboto,
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
