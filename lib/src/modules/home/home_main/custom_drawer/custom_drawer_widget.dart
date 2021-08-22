import 'package:animated_card/animated_card.dart';
import 'package:flutter/material.dart';
import 'package:raro_budget/src/shared/constants/app_colors.dart';
import 'package:raro_budget/src/shared/constants/app_text_styles.dart';

class CustomDrawer extends StatefulWidget {
  const CustomDrawer({
    Key? key,
  }) : super(key: key);

  @override
  _CustomDrawerState createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  var _height = 300.0;
  var _opacity = 0.0;

  _changeheight() async {
    await Future.delayed(Duration(microseconds: 100));
    _height = 120;
    _opacity = 1.0;
    setState(() {});
  }

  @override
  void initState() {
    _changeheight();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          AnimatedContainer(
            duration: Duration(milliseconds: 300),
            height: _height,
            child: AnimatedOpacity(
              opacity: _opacity,
              duration: Duration(milliseconds: 800),
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
          ),
          AnimatedCard(
            direction: AnimatedCardDirection.right,
            child: ListTile(
              dense: true,
              visualDensity: VisualDensity(vertical: -4, horizontal: 0),
              contentPadding: EdgeInsets.fromLTRB(24, 0, 0, 0),
              title: const Text(
                'Perfil',
                style: TextStyles.black5414w500Roboto,
              ),
            ),
          ),
          AnimatedCard(
            direction: AnimatedCardDirection.right,
            child: ListTile(
              dense: true,
              visualDensity: VisualDensity(vertical: -2, horizontal: 0),
              contentPadding: EdgeInsets.fromLTRB(24, 0, 0, 0),
              title: const Text(
                'Cadastro',
                style: TextStyles.black8716w500Roboto,
              ),
              onTap: () {},
            ),
          ),
          AnimatedCard(
            child: Divider(
              height: 20,
              thickness: 2,
              color: AppColors.grey88,
            ),
          ),
          AnimatedCard(
            direction: AnimatedCardDirection.right,
            child: ListTile(
              dense: true,
              visualDensity: VisualDensity(vertical: -4, horizontal: 0),
              contentPadding: EdgeInsets.fromLTRB(24, 0, 0, 0),
              title: const Text(
                'Conta',
                style: TextStyles.black5414w500Roboto,
              ),
            ),
          ),
          AnimatedCard(
            direction: AnimatedCardDirection.right,
            child: ListTile(
              dense: true,
              visualDensity: VisualDensity(vertical: -2, horizontal: 0),
              contentPadding: EdgeInsets.fromLTRB(24, 0, 0, 0),
              title: const Text(
                'Gerenciar cartões',
                style: TextStyles.black8716w500Roboto,
              ),
              onTap: () {},
            ),
          ),
          AnimatedCard(
            direction: AnimatedCardDirection.right,
            child: ListTile(
              dense: true,
              visualDensity: VisualDensity(vertical: -2, horizontal: 0),
              contentPadding: EdgeInsets.fromLTRB(24, 0, 0, 0),
              title: const Text(
                'Investimentos',
                style: TextStyles.black8716w500Roboto,
              ),
              onTap: () {},
            ),
          ),
          AnimatedCard(
            direction: AnimatedCardDirection.right,
            child: Divider(
              height: 20,
              thickness: 2,
              color: AppColors.grey88,
            ),
          ),
          AnimatedCard(
            direction: AnimatedCardDirection.right,
            child: ListTile(
              dense: true,
              visualDensity: VisualDensity(vertical: -2, horizontal: 0),
              contentPadding: EdgeInsets.fromLTRB(24, 0, 0, 0),
              title: const Text(
                'Segurança',
                style: TextStyles.black5414w500Roboto,
              ),
            ),
          ),
          AnimatedCard(
            direction: AnimatedCardDirection.right,
            child: ListTile(
              dense: true,
              visualDensity: VisualDensity(vertical: -2, horizontal: 0),
              contentPadding: EdgeInsets.fromLTRB(24, 0, 0, 0),
              title: const Text(
                'Alterar senha',
                style: TextStyles.black8716w500Roboto,
              ),
              onTap: () {},
            ),
          ),
          AnimatedCard(
            direction: AnimatedCardDirection.right,
            child: Divider(
              height: 20,
              thickness: 2,
              color: AppColors.grey88,
            ),
          ),
          AnimatedCard(
            direction: AnimatedCardDirection.right,
            child: ListTile(
              contentPadding: EdgeInsets.fromLTRB(24, 0, 0, 0),
              dense: true,
              visualDensity: VisualDensity(vertical: -2, horizontal: 0),
              title: const Text(
                'Ajuda',
                style: TextStyles.black8716w500Roboto,
              ),
              onTap: () {},
            ),
          ),
          AnimatedCard(
            direction: AnimatedCardDirection.right,
            child: Divider(
              color: AppColors.white,
              height: MediaQuery.of(context).size.height / 3,
            ),
          ),
          AnimatedCard(
            direction: AnimatedCardDirection.right,
            child: Divider(
              height: 20,
              thickness: 2,
              color: AppColors.grey88,
            ),
          ),
          AnimatedCard(
            direction: AnimatedCardDirection.right,
            child: ListTile(
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
          ),
        ],
      ),
    );
  }
}
