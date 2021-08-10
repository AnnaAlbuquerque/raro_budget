import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:raro_budget/src/modules/home/home_controller.dart';
import 'package:raro_budget/src/shared/constants/app_text_styles.dart';
import 'package:raro_budget/src/shared/widgets/custom_appbar/custom_appbar.dart';
import 'package:raro_budget/src/shared/widgets/custom_button/custom_button_widget.dart';
import 'package:raro_budget/src/shared/constants/app_colors.dart';
import 'package:raro_budget/src/shared/constants/app_text_styles.dart';

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
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            Container(
              height: 120,
              child: DrawerHeader(
                padding: EdgeInsets.fromLTRB(24, 10, 0, 20),
                decoration: BoxDecoration(
                  gradient: AppColors.cyanToPurpleAppBar,
                ),
                child: Text(
                  "Olá, Jose",
                  style: TextStyles.white26w700Roboto,
                ),
              ),
            ),
            ListTile(
              dense: true,
              visualDensity: VisualDensity(vertical: -4, horizontal: 0),
              contentPadding: EdgeInsets.fromLTRB(24, 0, 0, 0),
              title: const Text(
                'Perfil',
                style: TextStyles.black5414w500Roboto,
              ),
            ),
            ListTile(
              dense: true,
              visualDensity: VisualDensity(vertical: -2, horizontal: 0),
              contentPadding: EdgeInsets.fromLTRB(24, 0, 0, 0),
              title: const Text(
                'Cadastro',
                style: TextStyles.black8716w500Roboto,
              ),
              onTap: () {},
            ),
            Divider(
              height: 20,
              thickness: 2,
              color: AppColors.grey88,
            ),
            ListTile(
              dense: true,
              visualDensity: VisualDensity(vertical: -4, horizontal: 0),
              contentPadding: EdgeInsets.fromLTRB(24, 0, 0, 0),
              title: const Text(
                'Conta',
                style: TextStyles.black5414w500Roboto,
              ),
            ),
            ListTile(
              dense: true,
              visualDensity: VisualDensity(vertical: -2, horizontal: 0),
              contentPadding: EdgeInsets.fromLTRB(24, 0, 0, 0),
              title: const Text(
                'Gerenciar cartões',
                style: TextStyles.black8716w500Roboto,
              ),
              onTap: () {},
            ),
            ListTile(
              dense: true,
              visualDensity: VisualDensity(vertical: -2, horizontal: 0),
              contentPadding: EdgeInsets.fromLTRB(24, 0, 0, 0),
              title: const Text(
                'Investimentos',
                style: TextStyles.black8716w500Roboto,
              ),
              onTap: () {},
            ),
            Divider(
              height: 20,
              thickness: 2,
              color: AppColors.grey88,
            ),
            ListTile(
              dense: true,
              visualDensity: VisualDensity(vertical: -2, horizontal: 0),
              contentPadding: EdgeInsets.fromLTRB(24, 0, 0, 0),
              title: const Text(
                'Segurança',
                style: TextStyles.black5414w500Roboto,
              ),
            ),
            ListTile(
              dense: true,
              visualDensity: VisualDensity(vertical: -2, horizontal: 0),
              contentPadding: EdgeInsets.fromLTRB(24, 0, 0, 0),
              title: const Text(
                'Alterar senha',
                style: TextStyles.black8716w500Roboto,
              ),
              onTap: () {},
            ),
            Divider(
              height: 20,
              thickness: 2,
              color: AppColors.grey88,
            ),
            ListTile(
              contentPadding: EdgeInsets.fromLTRB(24, 0, 0, 0),
              dense: true,
              visualDensity: VisualDensity(vertical: -2, horizontal: 0),
              title: const Text(
                'Ajuda',
                style: TextStyles.black8716w500Roboto,
              ),
              onTap: () {},
            ),
            Divider(
              color: AppColors.white,
              height: MediaQuery.of(context).size.height / 3,
            ),
            Divider(
              height: 20,
              thickness: 2,
              color: AppColors.grey88,
            ),
            ListTile(
              dense: true,
              visualDensity: VisualDensity(vertical: -4, horizontal: 0),
              title: Container(
                alignment: Alignment.center,
                child: const Text(
                  'Sair',
                  style: TextStyles.chambray16w400Roboto,
                ),
              ),
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}
