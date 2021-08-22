import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:raro_budget/src/modules/home/home_main/home_controller.dart';
import 'package:raro_budget/src/modules/home/home_main/widgets/custom_card_dia_a_dia/custom_card_dia_a_dia.dart';
import 'package:raro_budget/src/modules/home/home_main/widgets/custom_general_balance/custom_general_balance_widget.dart';
import 'package:raro_budget/src/modules/home/home_main/widgets/custom_last_transactions/custom_last_transactions_widget.dart';
import 'package:raro_budget/src/modules/home/widgets/custom_drawer/custom_drawer_widget.dart';
import 'package:raro_budget/src/shared/constants/app_text_styles.dart';
import 'package:raro_budget/src/shared/models/transaction_model.dart';
import 'package:raro_budget/src/shared/widgets/custom_appbar/custom_appbar.dart';
import 'package:raro_budget/src/shared/widgets/custom_button/custom_button_widget.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomeController> {
  var keyDrawerHomePage = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    controller
        .getTotals(DateTime.now().month)
        .then((value) => print("TOTAL RECEIVED"));
    controller.homeRepository
        .getLastTransactions()
        .then((value) => print("Terminou"));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var name =
        controller.homeRepository.authController.userModel.name.split(" ");
    var balance =
        controller.homeRepository.authController.userModel.generalBalance;

    return Scaffold(
      key: keyDrawerHomePage,
      appBar: CustomAppBar(
        title: "Olá, ${name[0]}",
        iconDataLeft: Icons.menu,
        prefSize: 80,
        iconButtonOnPressed: () {
          {
            keyDrawerHomePage.currentState!.openDrawer();
          }
        },
      ),
      drawer: CustomDrawer(),
      body: 1 == 0 //store.error
          ? Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "Erro na conexão",
                    style: TextStyles.cyan48w400Roboto,
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  CustomButton(
                    useGradientBackground: true,
                    text: "TENTAR NOVAMENTE",
                  ),
                ],
              ),
            )
          : SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(15, 15, 15, 0),
                    child: CustomGeneralBalance(
                      balance: '$balance',
                    ),
                  ),
                  Observer(builder: (_) {
                    return CustomCard(
                      total: controller.totalIn - controller.totalOut,
                      totalIn: controller.totalIn,
                      totalOut: controller.totalOut,
                    );
                  }),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(15, 0, 15, 15),
                    child: FutureBuilder(
                      future: controller.getLastTransactions(),
                      builder: (context, snapshot) {
                        return CustomLastTransactions(
                          value: controller.totalLastTransactions
                              .toStringAsFixed(2),
                          listTransaction: controller.listTransaction,
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}
