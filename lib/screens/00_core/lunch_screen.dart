import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:movie_with_language/utils/app_color.dart';
import 'package:movie_with_language/utils/app_style.dart';

import '../../generated/assets.dart';
import '../../generated/l10n.dart';

class LunchScreen extends StatefulWidget {
  const LunchScreen({Key? key}) : super(key: key);

  @override
  State<LunchScreen> createState() => _LunchScreenState();
}

class _LunchScreenState extends State<LunchScreen> {
  @override
  void initState() {
    screenBehavior();
    Future.delayed(const Duration(seconds: 1), () {
      Navigator.pushNamed(context, "/on_boarding_screen");
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Align(
            child: SvgPicture.asset(
              Assets.victorLunchScreenBackground,
              height: double.maxFinite,
              width: double.maxFinite,
              alignment: AlignmentDirectional.center,
              fit: BoxFit.cover,
            ),
          ),
          Align(
            alignment: AlignmentDirectional.center,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SvgPicture.asset(
                  Assets.victorLogo,
                  height: 135.h,
                ),
                Text(S.of(context).MAO_TRAILER,
                style: AppStyle.h1Text.copyWith(color: AppColor.backgroundColor),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Future<void> screenBehavior() async {
    await SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
  }
}
