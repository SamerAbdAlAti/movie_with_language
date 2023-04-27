import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:movie_with_language/utils/app_color.dart';

import '../widgets/02_slimmer_widget.dart';

mixin Helpers {
  void showSnakBar(
    BuildContext context, {
    required String message,
    bool error = false,
  }) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: error ? Colors.red.shade700 : Colors.greenAccent,
      ),
    );
  }

  String imagePathComplete({required String path}) {
    return "https://image.tmdb.org/t/p/w500/$path";
  }

  Widget slimmerForImageLoading(context, child, loadingProgress) {
    if (loadingProgress == null) {
      return child;
    }
    return ShimmerWidget(
      width: double.infinity,
      height: double.infinity,
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.white,
    );
  }

  Future<void> screenBehavior({
    bool show = false,
  }) async {
    /*SystemUiMode.immersiveSticky*/
    if (show) {
      SystemChrome.setSystemUIOverlayStyle( SystemUiOverlayStyle(
        statusBarColor: AppColor.backgroundColor.withOpacity(0.0),
        statusBarBrightness: Brightness.dark,
        statusBarIconBrightness: Brightness.dark,
        systemNavigationBarIconBrightness: Brightness.dark,
        systemNavigationBarDividerColor: AppColor.backgroundColor,
        systemNavigationBarColor: AppColor.backgroundColor,
        systemNavigationBarContrastEnforced: true,
        systemStatusBarContrastEnforced: true,
      ));
      SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
          overlays: SystemUiOverlay.values);
    } else {
      await SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
    }
  }
}
