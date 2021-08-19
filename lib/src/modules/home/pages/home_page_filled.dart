import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:raro_budget/src/modules/home/pages/home_controller.dart';
import 'package:raro_budget/src/modules/home/widgets/custom_transaction_item/custom_transaction_item_widget.dart';
import 'package:raro_budget/src/shared/constants/app_colors.dart';
import 'package:raro_budget/src/shared/constants/app_text_styles.dart';
import 'package:raro_budget/src/shared/models/transaction_module.dart';
import 'package:raro_budget/src/shared/widgets/custom_appbar/custom_appbar.dart';

import 'package:raro_budget/src/shared/widgets/custom_button_logged/custom_button_logged_widget.dart';

class HomePageFilled extends StatefulWidget {
  const HomePageFilled({Key? key}) : super(key: key);

  @override
  _HomePageFilledState createState() => _HomePageFilledState();
}

class _HomePageFilledState
    extends ModularState<HomePageFilled, HomeController> {
  double total = -100;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        iconDataLeft: Icons.menu,
        iconDataRight: Icons.ac_unit,
        title: 'title',
        prefSize: 120,
        button1: 'Entradas',
        button2: 'Saidas',
        button3: 'Todos',
        b1onPressed: () {
          controller.changeScreen1('button1');
        },
        b2onPressed: () {
          controller.changeScreen1('button2');
        },
        b3onPressed: () {
          controller.changeScreen1('button3');
        },
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: AppColors.selagotowhite,
        ),
        child: Observer(builder: (_) {
          return Column(
            children: [
              controller.button1 == true &&
                      controller.button2 == false &&
                      controller.button3 == false
                  ? Container(
                      margin: EdgeInsets.all(16.0),
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
                            CustomTransactionItem(
                              isGradient: true,
                              title: 'Pix - Salário',
                              transferredValue: '25,00',
                              icon: 'assets/icons/meal_icon.png',
                              textstyle: TextStyles.purple16w500Roboto,
                            ),
                            SizedBox(
                                height:
                                    MediaQuery.of(context).size.height / 22),
                            CustomTransactionItem(
                              isGradient: true,
                              title: 'Ted - Churrasco',
                              transferredValue: '57,30',
                              icon: 'assets/icons/transport_icon.png',
                              textstyle: TextStyles.purple16w500Roboto,
                            ),
                            SizedBox(
                                height:
                                    MediaQuery.of(context).size.height / 22),
                            CustomTransactionItem(
                              isGradient: true,
                              title: 'Dinheiro - Dívida Ma..',
                              transferredValue: '316,00',
                              icon: 'assets/icons/education_icon.png',
                              textstyle: TextStyles.purple16w500Roboto,
                            ),
                            SizedBox(
                                height:
                                    MediaQuery.of(context).size.height / 22),
                            CustomTransactionItem(
                              isGradient: true,
                              title: 'Pix - Festa',
                              transferredValue: '57,30',
                              icon: 'assets/icons/transport_icon.png',
                              textstyle: TextStyles.purple16w500Roboto,
                            ),
                            SizedBox(
                                height:
                                    MediaQuery.of(context).size.height / 22),
                            CustomTransactionItem(
                              isGradient: true,
                              title: 'Pix',
                              transferredValue: '316,00',
                              icon: 'assets/icons/education_icon.png',
                              textstyle: TextStyles.purple16w500Roboto,
                            ),
                            Divider(
                              color: AppColors.white,
                              height: MediaQuery.of(context).size.height / 4.6,
                            ),
                            Divider(
                              height: 24,
                              thickness: 2,
                              color: AppColors.grey88,
                            ),
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Total entradas",
                                  style: TextStyles.purple16w500Roboto,
                                ),
                                Text("\$ 333333",
                                    style: TextStyles.green14w500Roboto),
                              ],
                            ),
                          ],
                        ),
                      ),
                    )
                  : Container(),
              controller.button1 == false &&
                      controller.button2 == true &&
                      controller.button3 == false
                  ? Container(
                      margin: EdgeInsets.all(16.0),
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
                            CustomTransactionItem(
                              date: DateTime.now(),
                              color: AppColors.yellow,
                              title: 'Refeições',
                              transferredValue: '25,00',
                              icon: 'assets/icons/meal_icon.png',
                              textstyle: TextStyles.purple16w500Roboto,
                            ),
                            SizedBox(
                                height:
                                    MediaQuery.of(context).size.height / 22),
                            CustomTransactionItem(
                              color: AppColors.green,
                              title: 'Transporte',
                              transferredValue: '57,30',
                              icon: 'assets/icons/transport_icon.png',
                              textstyle: TextStyles.purple16w500Roboto,
                            ),
                            SizedBox(
                                height:
                                    MediaQuery.of(context).size.height / 22),
                            CustomTransactionItem(
                              color: AppColors.lightBlue,
                              title: 'Educação',
                              transferredValue: '316,00',
                              icon: 'assets/icons/education_icon.png',
                              textstyle: TextStyles.purple16w500Roboto,
                            ),
                            SizedBox(
                                height:
                                    MediaQuery.of(context).size.height / 22),
                            CustomTransactionItem(
                              color: AppColors.green,
                              title: 'Transporte',
                              transferredValue: '57,30',
                              icon: 'assets/icons/transport_icon.png',
                              textstyle: TextStyles.purple16w500Roboto,
                            ),
                            SizedBox(
                                height:
                                    MediaQuery.of(context).size.height / 22),
                            CustomTransactionItem(
                              color: AppColors.lightBlue,
                              title: 'Educação',
                              transferredValue: '316,00',
                              icon: 'assets/icons/education_icon.png',
                              textstyle: TextStyles.purple16w500Roboto,
                            ),
                            Divider(
                              color: AppColors.white,
                              height: MediaQuery.of(context).size.height / 4.6,
                            ),
                            Divider(
                              height: 24,
                              thickness: 2,
                              color: AppColors.grey88,
                            ),
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Total saídas",
                                  style: TextStyles.purple16w500Roboto,
                                ),
                                Text("\$ -333333",
                                    style: TextStyles.red14w500Roboto),
                              ],
                            ),
                          ],
                        ),
                      ),
                    )
                  : Container(),
              controller.button1 == false &&
                      controller.button2 == false &&
                      controller.button3 == true
                  ? Container(
                      margin: EdgeInsets.all(16.0),
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
                            CustomTransactionItem(
                              color: AppColors.yellow,
                              title: 'Refeições',
                              transferredValue: '25,00',
                              icon: 'assets/icons/meal_icon.png',
                              textstyle: TextStyles.purple16w500Roboto,
                            ),
                            SizedBox(
                                height:
                                    MediaQuery.of(context).size.height / 22),
                            CustomTransactionItem(
                              color: AppColors.green,
                              title: 'Transporte',
                              transferredValue: '57,30',
                              icon: 'assets/icons/transport_icon.png',
                              textstyle: TextStyles.purple16w500Roboto,
                            ),
                            SizedBox(
                                height:
                                    MediaQuery.of(context).size.height / 22),
                            CustomTransactionItem(
                              color: AppColors.lightBlue,
                              title: 'Educação',
                              transferredValue: '316,00',
                              icon: 'assets/icons/education_icon.png',
                              textstyle: TextStyles.purple16w500Roboto,
                            ),
                            SizedBox(
                                height:
                                    MediaQuery.of(context).size.height / 22),
                            CustomTransactionItem(
                              color: AppColors.green,
                              title: 'Transporte',
                              transferredValue: '57,30',
                              icon: 'assets/icons/transport_icon.png',
                              textstyle: TextStyles.purple16w500Roboto,
                            ),
                            SizedBox(
                                height:
                                    MediaQuery.of(context).size.height / 22),
                            CustomTransactionItem(
                              color: AppColors.lightBlue,
                              title: 'Educação',
                              transferredValue: '316,00',
                              icon: 'assets/icons/education_icon.png',
                              textstyle: TextStyles.purple16w500Roboto,
                            ),
                            Divider(
                              color: AppColors.white,
                              height: MediaQuery.of(context).size.height / 4.6,
                            ),
                            Divider(
                              height: 24,
                              thickness: 2,
                              color: AppColors.grey88,
                            ),
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Total",
                                  style: TextStyles.purple16w500Roboto,
                                ),
                                Text(
                                  "R\$ $total",
                                  style: total < 0
                                      ? TextStyles.red14w500Roboto
                                      : TextStyles.green14w500Roboto,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    )
                  : Container(),
            ],
          );
        }),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: CustomButtonLoggedFlow(
        useIconAdd: true,
        useGradientBackground: true,
        onTap: () {
          controller.fire.insert(TransactionModule(
              category: 'pix',
              date: DateTime.now(),
              name: 'viagem',
              type: 'entrada',
              value: 300000.0));
        },
      ),
    );
  }
}
