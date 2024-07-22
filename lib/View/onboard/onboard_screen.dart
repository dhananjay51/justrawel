import 'package:flutter/material.dart';
import '../../res/components/text_sub_widget.dart';
import '../../res/components/title_text_widget.dart';
import '../../res/constant/string_constant.dart';
import '../Routes/RoutesName.dart';

class OnboardScreen extends StatelessWidget {
  const OnboardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;

    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          SizedBox(
            height: height,
            width: width,
            child: Image.asset(
              AppString.instance.pathOnboardImage,
              fit: BoxFit.fitWidth,
            ),
          ),
          _onboardBody(
            height,
            width,
            context,
          ),
        ],
      ),
    );
  }

  Widget _onboardBody(double height, double width, BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        TitleWidget(titleText: AppString.instance.textWelcome),
        SizedBox(
          height: height * .02,
        ),
        TextSubWidget(text: AppString.instance.textOnboardSub),
        SizedBox(
          height: height * .02,
        ),
        ElevatedButton(
            onPressed: () {
              Navigator.of(context).pushNamed(RoutesName.home);
            },
            child: SizedBox(
              width: width * .4,
              height: height * .065,
              child: Center(
                child: Text(AppString.instance.textGetStarted),
              ),
            )),
        SizedBox(
          height: height * .02,
        ),
      ],
    );
  }
}
