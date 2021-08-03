import 'package:animated_card/animated_card.dart';
import 'package:flutter/material.dart';
import 'package:raro_budget/src/modules/home/home_page.dart';
import 'package:raro_budget/src/shared/constants/app_colors.dart';
import 'package:shimmer/shimmer.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    // WidgetsFlutterBinding.ensureInitialized().addPostFrameCallback((timeStamp) {
    //   Future.delayed(Duration(seconds: 2)).then(
    //     (value) => Navigator.of(context).push(
    //       MaterialPageRoute(
    //         builder: (BuildContext context) => HomePage(),
    //       ),
    //     ),
    //   );
    // });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      bottom: true,
      child: Scaffold(
        body: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            gradient: AppColors.cyanToPurple,
          ),
          child: Stack(
            alignment: Alignment.center,
            children: [
              AnimatedCard(
                direction: AnimatedCardDirection.top,
                duration: Duration(milliseconds: 700),
                curve: Curves.bounceOut,
                child: Align(
                  alignment: Alignment(0, -0.22),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image(
                          image:
                              AssetImage('assets/images/budget_icon_only.png')),
                    ],
                  ),
                ),
              ),
              AnimatedCard(
                direction: AnimatedCardDirection.left,
                duration: Duration(milliseconds: 700),
                child: Align(
                  alignment: Alignment(0, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image(
                          image: AssetImage(
                              'assets/images/budget_logo_text_only.png')),
                    ],
                  ),
                ),
              ),
              AnimatedCard(
                direction: AnimatedCardDirection.right,
                duration: Duration(milliseconds: 700),
                child: Align(
                  alignment: Alignment(0, 0.15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image(
                          image: AssetImage(
                              'assets/images/budget_subtitle_only.png')),
                    ],
                  ),
                ),
              ),
              Shimmer.fromColors(
                period: Duration(milliseconds: 2000),
                highlightColor: Colors.grey.shade400,
                baseColor: Colors.white,
                child: AnimatedCard(
                  direction: AnimatedCardDirection.bottom,
                  duration: Duration(milliseconds: 700),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image(
                              image: AssetImage(
                                  'assets/images/powered_by_raro.png')),
                        ],
                      ),
                      SizedBox(
                        height: 30,
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
