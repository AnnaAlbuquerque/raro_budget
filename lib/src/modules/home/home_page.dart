import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:raro_budget/src/modules/home/home_controller.dart';
import 'package:raro_budget/src/shared/constants/app_text_styles.dart';
import 'package:raro_budget/src/shared/widgets/custom_appbar/custom_appbar.dart';
import 'package:raro_budget/src/shared/widgets/custom_button/custom_button_widget.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: "Olá, ${store.user.name}",
        prefSize: 80,
        iconDataLeft: Icons.menu,
      ),
      body: store.error
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
          : Container(),
    );
  }
}
