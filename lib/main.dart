import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_with_language/prefs/01_movie_provider.dart';
import 'package:movie_with_language/prefs/00_shared_pref_controller.dart';
import 'package:movie_with_language/provider/00_language_provider.dart';
import 'package:movie_with_language/screens/02_movie_screen/00_movie_screen.dart';
import 'package:movie_with_language/screens/02_movie_screen/02_movie_details_screen.dart';
import 'package:movie_with_language/utils/app_style.dart';
import 'package:provider/provider.dart';

import 'generated/l10n.dart';
import 'screens/00_core/lunch_screen.dart';
import 'screens/01_on_boarding_screen/on_boarding_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPrefController().initPreferences();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MultiProvider(
          providers: [
            ChangeNotifierProvider(
              lazy: false,
              create: (BuildContext context) => LanguageProvider(),
            ),
            ChangeNotifierProvider(
              create: (BuildContext context) => MovieProvider(),
            ),
          ],
          builder: (context, child) {
            return MaterialApp(
              title: 'Movie',
              debugShowCheckedModeBanner: false,
              theme: AppStyle.lightTheme,
              darkTheme: AppStyle.lightTheme,
              localizationsDelegates: const [
                S.delegate,
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
              ],
              locale: Locale(Provider.of<LanguageProvider>(context).language),
              supportedLocales: S.delegate.supportedLocales,
              initialRoute: "/movie_screen",
              routes: {
                "/lunch_screen": (context) => const LunchScreen(),
                "/on_boarding_screen": (context) => const OnBoardingScreen(),
                "/movie_screen": (context) => const MovieScreen(),
                "/movie_screen/details": (context) => const MovieDetailsScreen(),
              },
            );
          },
        );
      },
    );
  }
}
