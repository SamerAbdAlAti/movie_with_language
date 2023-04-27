import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_with_language/utils/helpers.dart';

class ImageWithSlimmer extends StatelessWidget  with Helpers{
  final String imageUrl;
  final BoxFit fit;
  final double? height;
  final double? width;
  final int? cacheHeight;
  final int? cacheWidth;
  final double blurAmount;

  const ImageWithSlimmer({
    Key? key,
    required this.imageUrl,
    this.fit = BoxFit.cover,
    this.height,
    this.width,
    this.cacheHeight,
    this.cacheWidth,
    this.blurAmount = 4.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.maxFinite,
      child: Stack(
        children: [
          Padding(
            padding: EdgeInsets.only(bottom: 10.h),
            child: Stack(
              children: [
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Image.network(
                    imageUrl,
                    fit: BoxFit.contain,
                    alignment: Alignment.bottomCenter,
                    cacheWidth: 170.w.round(),
                    cacheHeight: 100.w.round(),
                    height: 180.h,
                  ),
                ),
                BackdropFilter(
                  filter:
                      ImageFilter.blur(sigmaX: blurAmount, sigmaY: blurAmount),
                  child: Container(
                    height: 100,
                    color: Colors.transparent,
                  ),
                ),
              ],
            ),
          ),
          Container(
            clipBehavior: Clip.antiAlias,
            decoration:
                BoxDecoration(borderRadius: BorderRadius.circular(6.sp)),
            child: Image.network(
              imageUrl,
              fit: fit,
              height: height ?? 170.h,
              width: width ?? double.maxFinite,
              cacheHeight: cacheHeight,
              cacheWidth: cacheWidth,
              filterQuality: FilterQuality.high,
              loadingBuilder: slimmerForImageLoading,
              errorBuilder: (context, error, stackTrace) {
                return const Icon(Icons.error);
              },
            ),
          ),
        ],
      ),
    );
  }
}
