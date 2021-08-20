import 'package:animated_card/animated_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:raro_budget/src/modules/login/create_account/create_account_controller.dart';
import 'package:raro_budget/src/shared/constants/app_colors.dart';
import 'package:raro_budget/src/shared/constants/app_text_styles.dart';

class OnboardingPage extends StatefulWidget {
  OnboardingPage({Key? key}) : super(key: key);

  @override
  _OnboardingPageState createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  final controller = Modular.get<CreateAccountController>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      bottom: true,
      child: Scaffold(
        body: Ink(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(
                    'assets/images/onboarding_background_novector.png'),
                fit: BoxFit.cover),
          ),
          child: Stack(
            children: [
              AnimatedCard(
                direction: AnimatedCardDirection.top,
                duration: Duration(milliseconds: 700),
                child: Align(
                  alignment: Alignment(0, -0.27),
                  child: Ink(
                    width: MediaQuery.of(context).size.width * 0.62,
                    child: Image(
                      image: AssetImage('assets/images/onboarding_vector.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 50),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AnimatedCard(
                      direction: AnimatedCardDirection.right,
                      child: Ink(
                        width: MediaQuery.of(context).size.width * 0.6,
                        child: Text(
                          "Agora sim! Você terá o controle financeiro nas suas mãos!",
                          style: TextStyles.cyan38w700Roboto,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 35,
                    ),
                    AnimatedCard(
                      direction: AnimatedCardDirection.left,
                      child: InkWell(
                        borderRadius: BorderRadius.circular(20),
                        child: Ink(
                          width: 108,
                          height: 36,
                          decoration: BoxDecoration(
                              color: AppColors.cyan,
                              borderRadius: BorderRadius.circular(20),
                              boxShadow: [
                                BoxShadow(
                                    blurRadius: 1,
                                    spreadRadius: -2,
                                    offset: Offset(0, 3),
                                    color: Color(0xFF000000).withOpacity(0.2)),
                                BoxShadow(
                                    blurRadius: 2,
                                    spreadRadius: 0,
                                    offset: Offset(0, 2),
                                    color: Color(0xFF000000).withOpacity(0.14)),
                                BoxShadow(
                                    blurRadius: 5,
                                    spreadRadius: 0,
                                    offset: Offset(0, 1),
                                    color: Color(0xFF000000).withOpacity(0.12)),
                              ]),
                          child: Center(
                            child: Text(
                              "VAMOS LÁ!",
                              style: TextStyles.white14w500Roboto,
                            ),
                          ),
                        ),
                        onTap: () {
                          if (controller.checkUserLogin()) {
                            Modular.to.navigate('/home');
                          } else {
                            Modular.to.navigate('/login');
                          }
                        },
                      ),
                    ),
                    SizedBox(
                      height: 35,
                      width: MediaQuery.of(context).size.width,
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
