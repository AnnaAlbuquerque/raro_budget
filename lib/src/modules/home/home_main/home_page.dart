import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:raro_budget/src/modules/home/home_main/custom_card_dia_a_dia/custom_card_dia_a_dia.dart';
import 'package:raro_budget/src/modules/home/home_main/custom_drawer/custom_drawer_widget.dart';
import 'package:raro_budget/src/modules/home/home_main/custom_general_balance/custom_general_balance_widget.dart';
import 'package:raro_budget/src/modules/home/home_main/home_controller.dart';

import 'package:raro_budget/src/modules/home/widgets/custom_last_transactions/custom_last_transactions_widget.dart';
import 'package:raro_budget/src/shared/constants/app_text_styles.dart';
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
  Widget build(BuildContext context) {
    return Scaffold(
      key: keyDrawerHomePage,
      appBar: CustomAppBar(
        title: "Olá, ${'store.user.name'}",
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
                      balance: 'store.balance',
                    ),
                  ),
                  CustomCard(),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(15, 0, 15, 15),
                    child: CustomLastTransactions(),
                  ),
                ],
              ),
            ),
    );
  }
}
