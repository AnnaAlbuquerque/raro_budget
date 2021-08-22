import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:raro_budget/src/modules/home/widgets/custom_drawer/custom_drawer_widget.dart';
import 'package:raro_budget/src/modules/home/widgets/custom_transaction_item/custom_transaction_item_widget.dart';
import 'package:raro_budget/src/modules/home/widgets/custom_transaction_item/modal_widget.dart';
import 'package:raro_budget/src/shared/constants/app_colors.dart';
import 'package:raro_budget/src/shared/constants/app_text_styles.dart';
import 'package:raro_budget/src/modules/home/home_filled/home_page_filled_controller.dart';
import 'package:raro_budget/src/shared/models/transaction_model.dart';
import 'package:raro_budget/src/shared/widgets/custom_appbar/custom_appbar.dart';
import 'package:raro_budget/src/shared/widgets/custom_button_logged/custom_button_logged_widget.dart';
import 'package:raro_budget/src/shared/widgets/custom_drop_down_button/custom_drop_down.dart';

class HomePageFilled extends StatefulWidget {
  const HomePageFilled({Key? key}) : super(key: key);

  @override
  _HomePageFilledState createState() => _HomePageFilledState();
}

class _HomePageFilledState
    extends ModularState<HomePageFilled, HomePageFilledController> {
  var keyDrawerHomeFilled = GlobalKey<ScaffoldState>();
  List<String> items = [
    'JANEIRO',
    'FEVEREIRO',
    'MARÇO',
    'ABRIL',
    'MAIO',
    'JUNHO',
    'JULHO',
    'AGOSTO',
    'SETEMBRO',
    'OUTUBRO',
    'NOVEMBRO',
    'DEZEMBRO'
  ];
  String? selectedItem = 'JANEIRO';

  @override
  void initState() {
    initializeDateFormatting('pt_BR', null);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: keyDrawerHomeFilled,
      appBar: CustomAppBar(
        currentMonth:
            int.tryParse(DateFormat.M('pt_BR').format(DateTime.now())),
        iconDataLeft: Icons.arrow_back,
        iconButtonOnPressed: () {
          Modular.to.popAndPushNamed('/home');
        },
        dropDown: CustomDropDownButton(
          iconData: Icons.keyboard_arrow_down_outlined,
          isTransparent: true,
          value: selectedItem,
          items: items
              .map(
                (i) => DropdownMenuItem(
                  value: i,
                  child: Text(
                    i,
                    style: TextStyles.white16w400Roboto,
                  ),
                ),
              )
              .toList(),
          onChanged: (String? value) {
            setState(() {
              selectedItem = value;
            });
          },
        ),
        title: 'title',
        prefSize: 145,
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
              height: MediaQuery.of(context).size.height / 1.2,
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
                    flex: 6,
                    child: Container(
                      child: FutureBuilder(
                          future: controller.getTransactionsWithType('entrada'),
                          builder: (context, snapshot) {
                            if (!snapshot.hasData &&
                                snapshot.connectionState ==
                                    ConnectionState.none) {
                              return Center(
                                child: CircularProgressIndicator(),
                              );
                            } else {
                              return ListView.builder(
                                itemCount: controller.listAllIn.length,
                                itemBuilder: (context, int index) {
                                  return CustomTransactionItem(
                                      controller.listAllIn[index].name,
                                      controller.listAllIn[index].category,
                                      controller.listAllIn[index].value,
                                      controller.listAllIn[index].type,
                                      controller.listAllIn[index].day,
                                      controller.listAllIn[index].month,
                                      controller.listAllIn[index].year, () {
                                    showModalBottomSheet(
                                        context: context,
                                        isDismissible: false,
                                        backgroundColor: Colors.transparent,
                                        builder: (context) => ModalWidget(
                                              'Você deseja realmente excluir esse arquivo?',
                                              ('${controller.listAllIn[index].category}'
                                                  ' '
                                                  '${controller.listAllIn[index].name}'),
                                              'Cancelar',
                                              'Ok',
                                              () {
                                                Modular.to.pop();
                                              },
                                              () {
                                                controller.deleteUser(
                                                  TransactionModel(
                                                      category: controller
                                                          .listAllIn[index]
                                                          .category,
                                                      value: controller
                                                          .listAllIn[index]
                                                          .value,
                                                      type: controller
                                                          .listAllIn[index]
                                                          .type,
                                                      name: controller
                                                          .listAllIn[index]
                                                          .name,
                                                      day: controller
                                                          .listAllIn[index].day,
                                                      month: controller
                                                          .listAllIn[index]
                                                          .month,
                                                      year: controller
                                                          .listAllIn[index]
                                                          .year),
                                                );
                                                Modular.to.pop();
                                              },
                                            ));
                                  });
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
                    flex: 6,
                    child: Container(
                      child: FutureBuilder(
                          future: controller.getTransactionsWithType('saida'),
                          builder: (context, snapshot) {
                            if (!snapshot.hasData &&
                                snapshot.connectionState ==
                                    ConnectionState.none) {
                              return Center(
                                child: CircularProgressIndicator(),
                              );
                            } else {
                              return ListView.builder(
                                itemCount: controller.listAllOut.length,
                                itemBuilder: (context, int index) {
                                  return CustomTransactionItem(
                                      controller.listAllOut[index].name,
                                      controller.listAllOut[index].category,
                                      controller.listAllOut[index].value,
                                      controller.listAllOut[index].type,
                                      controller.listAllOut[index].day,
                                      controller.listAllOut[index].month,
                                      controller.listAllOut[index].year, () {
                                    showModalBottomSheet(
                                        context: context,
                                        isDismissible: false,
                                        backgroundColor: Colors.transparent,
                                        builder: (context) => ModalWidget(
                                              'Você deseja realmente excluir esse arquivo?',
                                              ('${controller.listAllOut[index].category}'
                                                  ' '
                                                  '${controller.listAllOut[index].name}'),
                                              'Cancelar',
                                              'Ok',
                                              () {
                                                Modular.to.pop();
                                              },
                                              () {
                                                controller.deleteUser(
                                                  TransactionModel(
                                                      category: controller
                                                          .listAllOut[index]
                                                          .category,
                                                      value: controller
                                                          .listAllOut[index]
                                                          .value,
                                                      type: controller
                                                          .listAllOut[index]
                                                          .type,
                                                      name: controller
                                                          .listAllOut[index]
                                                          .name,
                                                      day: controller
                                                          .listAllOut[index]
                                                          .day,
                                                      month: controller
                                                          .listAllOut[index]
                                                          .month,
                                                      year: controller
                                                          .listAllOut[index]
                                                          .year),
                                                );
                                                Modular.to.pop();
                                              },
                                            ));
                                  });
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
                              "Total saídas",
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
                    flex: 6,
                    child: Container(
                      child: FutureBuilder(
                          future: controller.getTransactionsWithType('total'),
                          builder: (context, snapshot) {
                            if (!snapshot.hasData &&
                                snapshot.connectionState ==
                                    ConnectionState.none) {
                              return Center(
                                child: CircularProgressIndicator(),
                              );
                            } else {
                              return ListView.builder(
                                itemCount: controller.listAll.length,
                                itemBuilder: (context, int index) {
                                  return CustomTransactionItem(
                                      controller.listAll[index].name,
                                      controller.listAll[index].category,
                                      controller.listAll[index].value,
                                      controller.listAll[index].type,
                                      controller.listAll[index].day,
                                      controller.listAll[index].month,
                                      controller.listAll[index].year, () {
                                    showModalBottomSheet(
                                        context: context,
                                        isDismissible: false,
                                        backgroundColor: Colors.transparent,
                                        builder: (context) => ModalWidget(
                                              'Você deseja realmente excluir esse arquivo?',
                                              ('${controller.listAll[index].category}'
                                                  ' '
                                                  '${controller.listAll[index].name}'),
                                              'Cancelar',
                                              'Ok',
                                              () {
                                                Modular.to.pop();
                                              },
                                              () {
                                                controller.deleteUser(
                                                  TransactionModel(
                                                      category: controller
                                                          .listAll[index]
                                                          .category,
                                                      value: controller
                                                          .listAll[index].value,
                                                      type: controller
                                                          .listAll[index].type,
                                                      name: controller
                                                          .listAll[index].name,
                                                      day: controller
                                                          .listAll[index].day,
                                                      month: controller
                                                          .listAll[index].month,
                                                      year: controller
                                                          .listAll[index].year),
                                                );
                                                Modular.to.pop();
                                              },
                                            ));
                                  });
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
                              "Total",
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
      drawer: CustomDrawer(
        userName: '${'controller.userName'}',
        registrationOnTap: () async => {
          await Modular.to.pushNamed('/home/homeregistration'),
        },
        logoutOnTap: () async {
          await controller.logout();
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Observer(builder: (_) {
        return (controller.button1 == true ||
                controller.button2 == true && controller.button3 == false)
            ? CustomButtonLoggedFlow(
                useIconAdd: true,
                useGradientBackground: true,
                onTap: () {
                  if (controller.button1 == true &&
                      controller.button2 == false &&
                      controller.button3 == false) {
                    Modular.to.navigate('/home/homeinpage');
                  } else if (controller.button1 == false &&
                      controller.button2 == true &&
                      controller.button3 == false) {
                    Modular.to.navigate('/home/homeoutpage');
                  }
                },
              )
            : Container();
      }),
    );
  }
}
