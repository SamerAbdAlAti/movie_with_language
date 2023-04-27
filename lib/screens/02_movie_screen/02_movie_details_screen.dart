import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:movie_with_language/generated/assets.dart';
import 'package:movie_with_language/utils/app_style.dart';
import 'package:movie_with_language/utils/helpers.dart';
import 'package:provider/provider.dart';

import '../../generated/l10n.dart';
import '../../models/movie_details_model.dart';
import '../../prefs/01_movie_provider.dart';

class MovieDetailsScreen extends StatelessWidget with Helpers {
  const MovieDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_outlined,
            color: Colors.white,
          ),
        ),
        title: Text(
          S.of(context).Back,
          style: AppStyle.h2Text.copyWith(
            color: Colors.white,
          ),
        ),
        titleSpacing: 0.0,
      ),
      extendBodyBehindAppBar: true,
      body: Column(
        children: [
          Stack(
            children: [
              SizedBox(
                height: 280.h + (188 / 2).h,
                child: Stack(
                  children: [
                    _topSectionBackgroundImage(),
                    _bottomImage(),
                  ],
                ),
              ),
              _underImagePeopleRate(),
            ],
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  _descriptionBottom(),
                  _productionCompaniesDetails(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _topSectionBackgroundImage() {
    return InkWell(
      onTap: () {},
      child: Consumer<MovieProvider>(
        builder: (context, provider, child) {
          return SizedBox(
            height: 280.h,
            child: Stack(
              alignment: AlignmentDirectional.center,
              children: [
                Image.network(
                  imagePathComplete(
                    path: provider.movieDetailsModel.backdropPath!,
                  ),
                  height: 280.h,
                  width: double.maxFinite,
                  fit: BoxFit.cover,
                  color: Colors.black45.withOpacity(0.3),
                  filterQuality: FilterQuality.low,
                  colorBlendMode: BlendMode.hardLight,
                  loadingBuilder: slimmerForImageLoading,
                  errorBuilder: (context, error, stackTrace) {
                    return const Icon(Icons.error);
                  },
                ),
                Center(
                  child: Container(
                    height: 54.h,
                    alignment: Alignment.center,
                    padding: EdgeInsets.only(left: 3.h),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: LinearGradient(
                        begin: Alignment(-0.6.w, -1.0.h),
                        end: Alignment(0.507.w, 0.74.h),
                        colors: const [Color(0xfff99f00), Color(0xffdb3069)],
                        stops: const [0.0, 1.0],
                      ),
                    ),
                    child: SvgPicture.asset(Assets.victorPlayIcon),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _bottomImage() {
    return Consumer<MovieProvider>(
      builder: (context, provider, child) {
        return Align(
          alignment: AlignmentDirectional.bottomStart,
          child: Container(
            width: 120.w,
            height: 188.h,
            margin: EdgeInsets.symmetric(horizontal: 20.w),
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6.sp),
                boxShadow: [
                  BoxShadow(
                      color: Colors.grey.shade600,
                      offset: Offset(2.h, 5.w),
                      blurRadius: 6.sp),
                ]),
            child: Image.network(
              imagePathComplete(path: provider.movieDetailsModel.posterPath!),
              fit: BoxFit.cover,
            ),
          ),
        );
      },
    );
  }

  Widget _underImagePeopleRate() {
    return Consumer<MovieProvider>(
      builder: (context, provider, child) {
        return Padding(
          padding: EdgeInsets.only(
            top: 290.h,
          ),
          child: Row(
            children: [
              SizedBox(
                width: 120.w + 25.w,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text.rich(
                    TextSpan(

                      children: [
                        TextSpan(
                          text: provider.movieDetailsModel.popularity
                              ?.round()
                              .toString(),
                        ),
                        TextSpan(
                          text: ' ${S.of(context).People_watching}\n',
                        ),
                        WidgetSpan(

                          child: SizedBox(
                            width: MediaQuery.of(context).size.width-150.w,
                            child: SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                children: [
                                  ...List.generate(
                                      provider.movieDetailsModel.genres.length,
                                      (index) => Text(
                                            " ${index != 0 ? "," : ""}${provider.movieDetailsModel.genres[index].name}",
                                            style: AppStyle.h4Text,
                                          ))
                                ],
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                    textHeightBehavior: const TextHeightBehavior(
                        applyHeightToFirstAscent: false),
                    softWrap: false,
                    style: AppStyle.h4Text,
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Row(
                    children: [
                      RichText(
                        textDirection: TextDirection.ltr,
                        text: TextSpan(
                          text: '1',
                          children: [
                            TextSpan(
                              children: [
                                WidgetSpan(
                                  child: Transform.translate(
                                    offset: const Offset(0, -8),
                                    child: Text(
                                        textDirection: TextDirection.ltr,
                                        ".4",
                                        style: AppStyle.h4Text
                                            .copyWith(color: Colors.red)),
                                  ),
                                ),
                              ],
                            ),
                          ],
                          style: AppStyle.h1Text.copyWith(color: Colors.red),
                        ),
                      ),
                      ...List.generate(
                        5,
                        (index) => Container(
                          margin: EdgeInsets.only(
                            right: 5.h,
                            left: index == 0 ? 10 : 0.0,
                          ),
                          child: SvgPicture.asset(
                            Assets.victorStar,
                            height: 14.h,
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _descriptionBottom() {
    return Consumer<MovieProvider>(
      builder: (context, provider, child) {
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 30.h),
          child: Text(
            provider.movieDetailsModel.overview.toString(),
            style: AppStyle.h2Text,

            overflow: TextOverflow.clip,
            textHeightBehavior:
                const TextHeightBehavior(applyHeightToFirstAscent: true),
          ),
        );
      },
    );
  }

  Widget _productionCompaniesDetails() {
    return Consumer<MovieProvider>(
      builder: (context, provider, child) {
        print(    provider.movieDetailsModel.productionCompanies[0].logoPath);
        return Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Text(
                  "Full Cast & Crew",
                  style: AppStyle.h3Text,
                ),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    ...List.generate(
                      provider.movieDetailsModel.productionCompanies.length,
                      (index) {

                        ProductionCompanies model =
                        provider.movieDetailsModel.productionCompanies[index];

                        return Container(
                          height:190.h,
                          width: 80.w,
                          margin: EdgeInsets.symmetric(horizontal: 10.w,vertical: 20.h).copyWith(top: 0.0,),
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(3.h),
                          ),
                          child: SizedBox(
                            height: 100.h,
                            child: Image.network(imagePathComplete(path: model.logoPath??""),
                              loadingBuilder: slimmerForImageLoading,
                              errorBuilder: (context, error, stackTrace) {
                                return const Icon(Icons.error);
                              },
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
