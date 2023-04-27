import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:movie_with_language/utils/helpers.dart';

import '../../generated/assets.dart';
import '../../generated/l10n.dart';
import '../../utils/app_color.dart';
import '../../utils/app_style.dart';
import '../../widgets/00_on_boarding_content.dart';
import '../00_core/lunch_screen.dart';
import 'choose_language.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> with Helpers {
  late PageController pageController;

  @override
  void initState() {
    pageController = PageController();
    super.initState();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  int pageIndex = 0;

  @override
  Widget build(BuildContext context) {
    final List<String> onBoardingText = [
      S.of(context).choose_the_language,
      S.of(context).Get_the_firstMovie,
      S.of(context).Know_the_movie,
      S.of(context).Real_time_updates,
    ];
    return Scaffold(
      backgroundColor: AppColor.black60Color,
      body: Stack(
        children: [
          Column(
            children: [
              Expanded(
                child: PageView(
                  controller: pageController,
                  onPageChanged: (int value) {
                    setState(() {
                      pageIndex = value;
                    });
                  },
                  children: const [
                    ChooseLanguage(),
                    OnBoardingContent(
                      imagePath: Assets.pixelBitmap,
                      gradient: LinearGradient(
                        begin: Alignment(0.0, -0.869),
                        end: Alignment(0.0, 0.963),
                        colors: [Color(0x23f5900e), Color(0xccdb3167)],
                        stops: [0.0, 1.0],
                      ),
                      index: 0,
                    ),
                    OnBoardingContent(
                      imagePath: Assets.pixelBitmap,
                      index: 1,
                      gradient: LinearGradient(
                        begin: Alignment(-0.322, -0.479),
                        end: Alignment(0.546, 0.904),
                        colors: [Color(0x00f5d547), Color(0xb4f5d547)],
                        stops: [0.0, 1.0],
                      ),
                    ),
                    OnBoardingContent(
                      imagePath: Assets.pixelBitmap,
                      index: 2,
                      gradient: LinearGradient(
                        begin: Alignment(0.0, -0.965),
                        end: Alignment(0.0, 0.376),
                        colors: [Color(0x00345cc5), Color(0xff142246)],
                        stops: [0.0, 1.0],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          _pageText(
            pageText: onBoardingText[pageIndex],
          ),
          _pageButton(
            onBoardingText: onBoardingText,
            pageIndex: pageIndex,
          ),
        ],
      ),
    );
  }

  Widget _pageText({
    required String pageText,
  }) {
    return Container(
      height: 468.h,
      alignment: AlignmentDirectional.bottomCenter,
      child: Text(
        pageText,
        style: AppStyle.h1Text.copyWith(
          color: Colors.white,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }

  Widget _pageButton({
    required List onBoardingText,
    required int pageIndex,
  }) {
    return Padding(
      padding: EdgeInsets.only(top: 530.h),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
                onBoardingText.length,
                (index) => Padding(
                      padding: EdgeInsets.symmetric(horizontal: 5.w),
                      child: SvgPicture.asset(
                        Assets.victorLogo,
                        height: 16.h,
                        colorFilter: ColorFilter.mode(
                          AppColor.backgroundColor
                              .withOpacity(pageIndex == index ? 1 : 0.5),
                          BlendMode.srcIn,
                        ),
                      ),
                    )),
          ),
          SizedBox(
            height: 57.h,
          ),
          AnimatedContainer(
              duration: const Duration(milliseconds: 400),
              height: 54.h,
              width: 192.w,
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(27.0.sh),
                gradient: onBoardingText.length - 1 == pageIndex
                    ? LinearGradient(
                        begin: Alignment(-0.6.h, -1.0.w),
                        end: Alignment(0.507.h, 0.74.w),
                        colors: const [Color(0xfff99f00), Color(0xffdb3069)],
                        stops: [0.0, 1.0],
                      )
                    : null,
                border: Border.all(
                  width: onBoardingText.length - 1 != pageIndex ? 2.0.w : 0.0,
                  color: const Color(0xffffffff),
                ),
              ),
              child: MaterialButton(
                onPressed: () async {
                  if (pageIndex != onBoardingText.length - 1) {
                    await pageController.nextPage(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.linear);
                  } else {
                    /// TODO: Navigate To Home page

                    screenBehavior(show: true).then((value) {
                      Navigator.pushReplacementNamed(context, "/movie_screen");
                    });

                  }
                },
                animationDuration: const Duration(microseconds: 1),
                padding: EdgeInsets.zero,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      onBoardingText.length - 1 != pageIndex
                          ? S.of(context).Next
                          : S.of(context).Get_Stared,
                      style: AppStyle.h2Text.copyWith(color: Colors.white),
                    ),
                    SizedBox(
                      width:
                          onBoardingText.length - 1 == pageIndex ? 0.0 : 10.w,
                    ),
                    Visibility(
                      visible: onBoardingText.length - 1 != pageIndex,
                      child: const Icon(
                        Icons.arrow_forward,
                        color: Colors.white,
                      ),
                    )
                  ],
                ),
              ))
        ],
      ),
    );
  }
}
