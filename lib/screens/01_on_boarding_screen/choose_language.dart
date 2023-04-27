import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_with_language/provider/00_language_provider.dart';
import 'package:movie_with_language/utils/app_color.dart';
import 'package:provider/provider.dart';

class ChooseLanguage extends StatelessWidget {
  const ChooseLanguage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: AppColor.black60Color,
        gradient: LinearGradient(
          begin: Alignment(0.0, -0.965),
          end: Alignment(0.0, 0.376),
          colors: [Color(0x0000ff00), Color(0xff175719)],
          stops: [0.0, 1.0],
        ),
      ),
      child: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          Icon(
            Icons.language,
            size: 300.sp,
            color: Colors.white.withOpacity(0.3),
          ),
          Padding(
            padding:
                EdgeInsets.symmetric(horizontal: 30.w, vertical: 30.h).copyWith(
              top: 50.h,
            ),
            child: DropdownButtonFormField<String>(
              alignment: AlignmentDirectional.bottomCenter,
              decoration: InputDecoration(
                fillColor: AppColor.backgroundColor.withOpacity(0.8),
                border: InputBorder.none,
                contentPadding: EdgeInsets.zero.copyWith(right: 20.w,left: 20.w),
                filled: true,
              ),
              items: [
                "English",
                "العربية",
                "阿拉伯语",
              ].map((item) {
                return DropdownMenuItem<String>(
                  value: item,
                  child: Text(item),
                );
              }).toList(),
              onChanged: (newValue) {
                LanguageProvider provider =
                    Provider.of<LanguageProvider>(context, listen: false);
                switch (newValue) {
                  case "English":
                    {
                      provider.changeLanguage(
                        languageCode: "en" ,
                      );
                      break;
                    }
                    case "العربية":
                    {
                      provider.changeLanguage(
                        languageCode: "ar",
                      );
                      break;
                    }
                    case "阿拉伯语":
                    {
                      provider.changeLanguage(
                        languageCode: "zh" ,
                      );
                      break;
                    }
                }
              },
            ),
          )
        ],
      ),
    );
  }
}
