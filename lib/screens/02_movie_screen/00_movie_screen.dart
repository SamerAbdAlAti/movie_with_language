import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_with_language/api/movie_api_controller.dart';
import 'package:movie_with_language/models/movie_model.dart';
import 'package:movie_with_language/prefs/01_movie_provider.dart';
import 'package:movie_with_language/utils/app_style.dart';
import 'package:movie_with_language/widgets/02_slimmer_widget.dart';
import 'package:provider/provider.dart';
import '../../generated/l10n.dart';
import '../../utils/helpers.dart';
import '../../widgets/03_image_with_slimmer_widget.dart';

class MovieScreen extends StatefulWidget {
  const MovieScreen({Key? key}) : super(key: key);

  @override
  State<MovieScreen> createState() => _MovieScreenState();
}

class _MovieScreenState extends State<MovieScreen> with Helpers {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w).copyWith(
                top: 70.h,
                bottom: 19.h,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    S.of(context).MOVIES,
                    style: AppStyle.h2Text,
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.search_outlined,
                    ),
                  )
                ],
              ),
            ),
            _topRated(),
            _nowPlaying(),
            _popular(),
          ],
        ),
      ),
    );
  }

  Widget _topRated() {

    return FutureBuilder<List<MovieModel>>(
      future: MovieApiController.getTopRatedMovie(context),
      builder: (context, snapshot) {

        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (snapshot.hasData && snapshot.data!.isNotEmpty) {
          return SizedBox(
            height: 190.h,
            child: PageView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                MovieModel model = snapshot.data![index];
                return Stack(
                  children: [
                    Center(
                      child: Container(
                        height: 200.h,
                        width: 320.w,
                        clipBehavior: Clip.antiAlias,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4.sp)),
                        child: InkWell(
                          onTap: () {
                            MovieApiController.getMovieDetails(context,
                                    id: model.id)
                                .then((value) {
                              MovieProvider provider =
                                  Provider.of<MovieProvider>(context,
                                      listen: false);
                              provider.movieDetailsMethod(value).then((value) {
                                Navigator.pushNamed(
                                    context, "/movie_screen/details");
                              });
                            });
                          },
                          child: ImageWithSlimmer(
                            imageUrl:
                                imagePathComplete(path: model.backdropPath),
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          );
        }


        return Container();
      },
    );
  }

  Widget _nowPlaying() {
    return FutureBuilder<List<MovieModel>>(
      future: MovieApiController.getNowPlayingMovie(context),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (snapshot.hasData && snapshot.data!.isNotEmpty) {
          return Align(
            alignment: AlignmentDirectional.centerStart,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 20.h,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: Text(
                    S.of(context).Now,
                    style: AppStyle.h2Text,
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
                SizedBox(
                  height: 280.h,
                  child: ListView.builder(
                      itemCount: snapshot.data!.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        MovieModel model = snapshot.data![index];
                        return Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Container(
                              clipBehavior: Clip.antiAlias,
                              margin: EdgeInsets.symmetric(horizontal: 20.w),
                              height: 220.h,
                              width: 150.w,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(6.sp),
                              ),
                              child: Image.network(
                                  imagePathComplete(path: model.backdropPath),
                                  fit: BoxFit.cover,
                                  loadingBuilder: slimmerForImageLoading),
                            ),
                            SizedBox(
                              width: 150.w,
                              child: Text(
                                model.title,
                                style: AppStyle.h3Text,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.center,
                              ),
                            )
                          ],
                        );
                      }),
                ),
              ],
            ),
          );
        } else {
          return Container();
        }
      },
    );
  }

  Widget _popular() {
    return FutureBuilder<List<MovieModel>>(
      future: MovieApiController.getPopularMovie(context),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (snapshot.hasData && snapshot.data!.isNotEmpty) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Text(
                  S.of(context).Popular,
                  style: AppStyle.h3Text,
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 40.h),
                child: ConstrainedBox(
                  constraints: BoxConstraints(maxHeight: 480.h),
                  child: GridView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    itemCount: snapshot.data!.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 20.w,
                      crossAxisSpacing: 20.h,
                      childAspectRatio: 200 / 140,
                    ),
                    itemBuilder: (context, index) {
                      MovieModel model = snapshot.data![index];
                      return Container(
                        clipBehavior: Clip.antiAlias,
                        alignment: AlignmentDirectional.topEnd,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(6.sp),
                        ),
                        child: Stack(
                          children: [
                            Image.network(
                              imagePathComplete(path: model.backdropPath),
                              fit: BoxFit.cover,
                              height: double.maxFinite,
                              width: double.maxFinite,
                              loadingBuilder: slimmerForImageLoading,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 10.w, vertical: 10.h),
                                  child: SizedBox(
                                    height: 40.h,
                                    width: 40.h,
                                    child: Container(
                                      height: 40.h,
                                      alignment: AlignmentDirectional.center,
                                      decoration: const BoxDecoration(
                                        gradient: LinearGradient(
                                          begin: Alignment(0.0, -1.0),
                                          end: Alignment(0.0, 1.0),
                                          colors: [
                                            Color(0xfff99f00),
                                            Color(0xffdb3069)
                                          ],
                                          stops: [0.0, 1.0],
                                        ),
                                        shape: BoxShape.circle,
                                      ),
                                      child: Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 3.w, vertical: 3.h),
                                          child: RichText(
                                            textDirection: TextDirection.ltr,
                                            text: TextSpan(
                                              text: model.voteAverage
                                                  .floor()
                                                  .toString(),
                                              children: [
                                                TextSpan(
                                                  children: [
                                                    WidgetSpan(
                                                      child:
                                                          Transform.translate(
                                                        offset:
                                                            const Offset(0, -8),
                                                        child: Text(
                                                          textDirection:
                                                              TextDirection.ltr,
                                                          ".${model.voteAverage.toString().substring(2, 3)}",
                                                          style: AppStyle.h4Text
                                                              .copyWith(
                                                                  color: Colors
                                                                      .white),
                                                        ),
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              ],
                                              style: AppStyle.h1Text.copyWith(
                                                  color: Colors.white),
                                            ),
                                          )),
                                    ),
                                  ),
                                ),
                                const Spacer(),
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 10.w, vertical: 10.h),
                                  child: Row(
                                    children: [
                                      Expanded(
                                        child: Text(
                                          "${model.releaseDate}"
                                          "\n${model.title}",
                                          style: AppStyle.h4Text.copyWith(
                                            color: Colors.white,
                                          ),
                                          maxLines: 3,
                                          softWrap: true,
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          );
        }

        return Container();
      },
    );
  }
}
