import 'package:flutter/material.dart';
import 'package:raro_budget/src/modules/home/widgets/custom_transaction_item/custom_transaction_item_widget.dart';
import 'package:raro_budget/src/shared/constants/app_colors.dart';
import 'package:raro_budget/src/shared/constants/app_text_styles.dart';
import 'package:raro_budget/src/shared/models/transaction_model.dart';

class CustomLastTransactions extends StatelessWidget {
  const CustomLastTransactions({
    Key? key,
    this.value,
    required this.listTransaction,
  }) : super(key: key);

  final List<TransactionModel> listTransaction;

  final String? value;

  @override
  Widget build(BuildContext context) {
    final bool sizeEmpty = listTransaction.isEmpty;
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
          child: Flex(
            direction: Axis.horizontal,
            children: [
              Flexible(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Últimas transações',
                      style: TextStyles.purple20w500Roboto,
                    ),
                    SizedBox(height: 8.0),
                    Text(
                      'R\$ ${value ?? '0.00'}',
                      style: TextStyles.black5424w400Roboto,
                    ),
                    SizedBox(height: 4.0),
                    Text(
                      sizeEmpty ? 'Nenhuma transação no momento' : 'No momento',
                      style: TextStyles.grey14w400Roboto,
                    ),
                    SizedBox(height: 24.0),
                    Visibility(
                      visible: !sizeEmpty,
                      child: Container(
                          height: 290,
                          child: ListView.builder(
                              itemCount: listTransaction.length,
                              itemBuilder: (contex, int index) {
                                return CustomTransactionItem(
                                    listTransaction[index].name,
                                    listTransaction[index].category,
                                    listTransaction[index].value,
                                    listTransaction[index].type,
                                    listTransaction[index].date,
                                    () {});
                              })),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
