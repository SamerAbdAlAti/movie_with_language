

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OnBoardingContent extends StatelessWidget {
  final String imagePath;
  final Gradient gradient;
  final int index;

  const OnBoardingContent({
    super.key,
    required this.imagePath,
    required this.gradient,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            SizedBox(
              child: Stack(
                children: [
                  SizedBox(
                    height:
                    index == 0 ? 468.h : MediaQuery.of(context).size.height,
                    child: Image.asset(
                      imagePath,
                      width: double.maxFinite,
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(
                    height:
                    index == 0 ? 468.h : MediaQuery.of(context).size.height,
                    child: Align(
                      alignment: AlignmentDirectional.bottomCenter,
                      child: Container(
                        height: 294.h,
                        decoration: const BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment(0.0, -0.809),
                            end: Alignment(0.0, -0.107),
                            colors: [Color(0x00222222), Color(0xff222222)],
                            stops: [0.0, 1.0],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height,
                    width: double.maxFinite,
                    decoration:  BoxDecoration(
                        gradient: gradient
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}