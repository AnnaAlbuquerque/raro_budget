import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:raro_budget/src/modules/home/pages/home_page_filled_controller.dart';
import 'package:raro_budget/src/modules/home/widgets/custom_transaction_item/custom_transaction_item_widget.dart';
import 'package:raro_budget/src/shared/constants/app_colors.dart';
import 'package:raro_budget/src/shared/constants/app_text_styles.dart';
import 'package:raro_budget/src/shared/widgets/custom_appbar/custom_appbar.dart';
import 'package:raro_budget/src/shared/widgets/custom_button_logged/custom_button_logged_widget.dart';

class HomePageFilled extends StatefulWidget {
  const HomePageFilled({Key? key}) : super(key: key);

  @override
  _HomePageFilledState createState() => _HomePageFilledState();
}

class _HomePageFilledState
    extends ModularState<HomePageFilled, HomePageFilledController> {
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
          if (controller.button1 == true &&
              controller.button2 == false &&
              controller.button3 == false) {
            return Container(
              padding: EdgeInsets.all(16),
              margin: EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 40.0),
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
              child: Column(
                children: [
                  Flexible(
                    flex: 10,
                    child: Container(
                      child: FutureBuilder(
                          future: controller.getTransactions(),
                          builder: (context, snapshot) {
                            if (!snapshot.hasData &&
                                snapshot.connectionState ==
                                    ConnectionState.none) {
                              return Center(
                                child: CircularProgressIndicator(),
                              );
                            } else {
                              return ListView.builder(
                                itemCount: controller.listaTodos.length,
                                itemBuilder: (context, int index) {
                                  return CustomTransactionItem(
                                    controller.listaTodos[index].name,
                                    controller.listaTodos[index].category,
                                    controller.listaTodos[index].value,
                                    controller.listaTodos[index].type,
                                    controller.listaTodos[index].date,
                                  );
                                },
                              );
                            }
                          }),
                    ),
                  ),
                  Flexible(
                    flex: 1,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
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
                            Observer(builder: (_) {
                              return Text(controller.value.toString(),
                                  style: TextStyles.green14w500Roboto);
                            }),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          } else if (controller.button1 == false &&
              controller.button2 == true &&
              controller.button3 == false) {
            return Container(
              padding: EdgeInsets.all(16),
              margin: EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 40.0),
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
              child: Column(
                children: [
                  Flexible(
                    flex: 10,
                    child: Container(
                      child: FutureBuilder(
                          future: controller.getTransactions(),
                          builder: (context, snapshot) {
                            if (!snapshot.hasData &&
                                snapshot.connectionState ==
                                    ConnectionState.none) {
                              return Center(
                                child: CircularProgressIndicator(),
                              );
                            } else {
                              return ListView.builder(
                                itemCount: controller.listaTodos.length,
                                itemBuilder: (context, int index) {
                                  return CustomTransactionItem(
                                    controller.listaTodos[index].name,
                                    controller.listaTodos[index].category,
                                    controller.listaTodos[index].value,
                                    controller.listaTodos[index].type,
                                    controller.listaTodos[index].date,
                                  );
                                },
                              );
                            }
                          }),
                    ),
                  ),
                  Flexible(
                    flex: 1,
                    child: Column(
                      children: [
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
                            Observer(builder: (_) {
                              return Text(controller.value.toString(),
                                  style: TextStyles.green14w500Roboto);
                            }),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          }
          if (controller.button1 == false &&
              controller.button2 == false &&
              controller.button3 == true) {
            return Container(
              padding: EdgeInsets.all(16),
              margin: EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 40.0),
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
              child: Column(
                children: [
                  Flexible(
                    flex: 10,
                    child: Container(
                      child: FutureBuilder(
                          future: controller.getTransactions(),
                          builder: (context, snapshot) {
                            if (!snapshot.hasData &&
                                snapshot.connectionState ==
                                    ConnectionState.none) {
                              return Center(
                                child: CircularProgressIndicator(),
                              );
                            } else {
                              return ListView.builder(
                                itemCount: controller.listaTodos.length,
                                itemBuilder: (context, int index) {
                                  return CustomTransactionItem(
                                    controller.listaTodos[index].name,
                                    controller.listaTodos[index].category,
                                    controller.listaTodos[index].value,
                                    controller.listaTodos[index].type,
                                    controller.listaTodos[index].date,
                                  );
                                },
                              );
                            }
                          }),
                    ),
                  ),
                  Flexible(
                    flex: 1,
                    child: Column(
                      children: [
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
                            Observer(builder: (_) {
                              return Text(controller.value.toString(),
                                  style: TextStyles.green14w500Roboto);
                            }),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          } else {
            return Container();
          }
        }),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: CustomButtonLoggedFlow(
        useIconAdd: true,
        useGradientBackground: true,
        onTap: () {},
      ),
    );
  }
}
