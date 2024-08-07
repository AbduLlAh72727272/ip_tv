import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:ip_tv/app/modules/home/views/home_theme_dialog.dart';
import 'package:ip_tv/app/utils/constraints/colors.dart';
import '../../../../generated/locales.g.dart';
import '../../../routes/app_pages.dart';
import '../../../utils/constraints/image_strings.dart';
import '../../Movies/controllers/movies_controller.dart';
import '../../Movies/models/movie_model.dart';
import '../../Movies/views/movies_view2.dart';
import '../../selectLanguage/views/select_language_view.dart';

class FirstHomeView extends StatelessWidget {
  FirstHomeView({super.key}) {
    // Ensure MoviesController is initialized
    Get.lazyPut(() => MoviesController());
  }

  final selectedIndex = 0.obs;
  final secSelectedIndex = 0.obs;
  final tabSelectedIndex = 0.obs;

  @override
  Widget build(BuildContext context) {
    // Find the MoviesController instance
    final MoviesController controller = Get.find<MoviesController>();

    return Scaffold(
      body: Column(
        children: [
          Container(
            height: 55.h,
            width: double.infinity,
            color: Theme.of(context).colorScheme.secondary,
            child: Row(
              children: [
                Image.asset(
                  VoidImages.vpn_blue,
                  height: 30.0.h,
                  width: 30.0.w,
                ),
                Text(
                  '',
                  style: TextStyle(
                    fontSize: 10.sp,
                    fontWeight: FontWeight.w500,
                    color: VoidColors.whiteColor,
                  ),
                ),
                Spacer(),
                Image.asset(
                  VoidImages.logo,
                  height: 50.0.h,
                  width: 50.0.w,
                ),
                Text(
                  'ARK VIP',
                  style: TextStyle(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w500,
                    color: VoidColors.whiteColor,
                  ),
                ),
                Spacer(),
                Image.asset(
                  VoidImages.search,
                  height: 20.0.h,
                  width: 20.0.w,
                ),
                GestureDetector(
                  onTap: () {
                    showHomeScreenDialog();
                  },
                  child: Image.asset(
                    VoidImages.homeTheme,
                    height: 20.0.h,
                    width: 20.0.w,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Get.to(() => SelectLanguageView());
                  },
                  child: Image.asset(
                    VoidImages.language,
                    height: 20.0.h,
                    width: 20.0.w,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    height: 180.h,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(VoidImages.background3),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 15.0.w),
                      child: Row(
                        children: [
                          _buildHomeCard(
                            onTap: () {
                              Get.toNamed(Routes.LIVE_T_V);
                            },
                            image: VoidImages.live_Tv,
                            label: LocaleKeys.LiveTv.tr,
                          ),
                          _buildHomeCard(
                            onTap: () {
                              Get.toNamed(Routes.MOVIES);
                            },
                            image: VoidImages.movie,
                            label: LocaleKeys.Movies.tr,
                          ),
                          _buildHomeCard(
                            onTap: () {
                              Get.toNamed(Routes.SERIES);
                            },
                            image: VoidImages.series,
                            label: LocaleKeys.Series.tr,
                          ),
                          _buildHomeCard(
                            onTap: () {
                              Get.toNamed(Routes.SETTING);
                            },
                            image: VoidImages.setting,
                            label: LocaleKeys.Settings.tr,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Theme.of(context).colorScheme.secondary,
                          VoidColors.blackColor,
                        ],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                      ),
                    ),
                    width: double.infinity,
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(
                              top: 15.0.h, bottom: 15.0.h),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              _buildTabButton(
                                context: context,
                                label: LocaleKeys.MovieInfo.tr,
                                index: 0,
                                controller: controller,
                              ),
                              SizedBox(width: 15.0.w),
                              // Removed the "Sports Info" tab button
                            ],
                          ),
                        ),
                        Container(
                          width: double.infinity,
                          height: 165.h,
                          decoration: BoxDecoration(
                            color: VoidColors.blackColor.withOpacity(0.2),
                          ),
                          child: _buildMoviesSection(controller),
                        ),
                        SizedBox(height: 20.0.h),
                        SizedBox(
                          width: double.infinity,
                          height: 130.h,
                          child: _buildNewImagesSection(),
                        ).marginOnly(bottom: 40.0.h),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 6.0.w, vertical: 7.0.h),
                          child: Row(
                            mainAxisAlignment:
                            MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                '${LocaleKeys.Expiration.tr}: 24/09/2022',
                                style: TextStyle(
                                  fontSize: 6.sp,
                                  color: VoidColors.whiteColor,
                                  fontFamily: 'Arial',
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              Text(
                                '${LocaleKeys.LoggedInAs.tr}: XYZ',
                                style: TextStyle(
                                  fontSize: 6.sp,
                                  color: VoidColors.whiteColor,
                                  fontFamily: 'Arial',
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHomeCard({required VoidCallback onTap, required String image, required String label}) {
    return Expanded(
      flex: 2,
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          height: 110.0.h,
          width: 130.0.w,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(image),
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(vertical: 4.0.h),
                child: SizedBox(
                  width: 45.w,
                  child: Center(
                    child: Text(
                      label,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontFamily: 'Arial',
                        fontSize: 7.sp,
                        fontWeight: FontWeight.w600,
                        color: VoidColors.whiteColor,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTabButton({
    required BuildContext context,
    required String label,
    required int index,
    required MoviesController controller,
  }) {
    return Obx(
          () => GestureDetector(
        onTap: () {
          tabSelectedIndex.value = index;
        },
        child: Container(
          decoration: BoxDecoration(
            color: tabSelectedIndex.value == index
                ? VoidColors.whiteColor.withOpacity(0.2)
                : null,
            borderRadius: BorderRadius.circular(6.0.r),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 7.0, vertical: 3.0.h),
            child: Text(
              label,
              style: TextStyle(
                fontFamily: 'Arial',
                fontSize: 8.sp,
                fontWeight: FontWeight.w700,
                color: VoidColors.whiteColor,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildMoviesSection(MoviesController controller) {
    return Obx(() {
      if (controller.isLoading.value && controller.movies.isEmpty) {
        return Center(child: CircularProgressIndicator());
      }

      // Separate movies with and without images
      List<Movie> moviesWithImages = [];
      List<Movie> moviesWithoutImages = [];

      for (var movie in controller.movies) {
        if (movie.logo.isNotEmpty && movie.logo != VoidImages.placeholder) {
          moviesWithImages.add(movie);
        } else {
          moviesWithoutImages.add(movie);
        }
      }

      List<Movie> combinedMovies = [...moviesWithImages];
      combinedMovies.addAll(moviesWithoutImages);
      combinedMovies.add(combinedMovies.removeAt(0));

      return ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: combinedMovies.length > 10 ? 10 : combinedMovies.length,
        itemBuilder: (context, index) {
          final movie = combinedMovies[index];
          return GestureDetector(
            onTap: () {
              Get.to(() => MoviesView2(
                imageUrl: movie.logo,
                channelName: movie.name,
                programInfo: movie.group,
                date: '',
                streamUrl: movie.url,
              ));
            },
            child: _buildMovieCard(movie.logo, movie.name),
          );
        },
      );
    });
  }




  Widget _buildMovieCard(String imageUrl, String title) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 8.0.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.0),
              color: Colors.grey,
            ),
            child: Stack(
              children: [
                Image.network(
                  // imageUrl.isNotEmpty ? imageUrl : VoidImages.placeholder,
                  imageUrl,
                  height: 150.h,
                  fit: BoxFit.contain,
                  errorBuilder: (BuildContext context, Object exception,
                      StackTrace? stackTrace) {
                    return Image.asset(
                      VoidImages.placeholder,
                      height: 110.h,
                      fit: BoxFit.contain,
                    );
                  },
                ),
              ],
            ),
          ),
          SizedBox(height: 8.h),
          // Text(
          //   title,
          //   style: TextStyle(
          //     color: Colors.white,
          //     fontSize: 6.sp,
          //   ),
          //   overflow: TextOverflow.ellipsis,
          //   maxLines: 2,
          // ),
        ],
      ),
    );
  }

  Widget _buildNewImagesSection() {
    List<String> newImages = [
      VoidImages.TV,
      VoidImages.SEC_TV,
      VoidImages.Sports,
    ];

    List<String> titles = [
      LocaleKeys.Epg.tr,
      LocaleKeys.MultiScreen.tr,
      LocaleKeys.SportGuide.tr,
    ];

    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: newImages.length,
      itemBuilder: (context, index) {
        if (index == 1) {
          return GestureDetector(
            onTap: () {
              Get.toNamed(Routes.MULTISCREEN);
            },
            child: FirstHomeSecCardWidget(
              secSelectedIndex: secSelectedIndex,
              newImages: newImages,
              titles: titles,
              index: index,
            ),
          );
        } else {
          return FirstHomeSecCardWidget(
            secSelectedIndex: secSelectedIndex,
            newImages: newImages,
            titles: titles,
            index: index,
          );
        }
      },
    );
  }
}

class FirstHomeSecCardWidget extends StatelessWidget {
  const FirstHomeSecCardWidget({
    super.key,
    required this.secSelectedIndex,
    required this.newImages,
    required this.titles,
    required this.index,
  });

  final RxInt secSelectedIndex;
  final List<String> newImages;
  final List<String> titles;
  final int index;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 3.0.w, vertical: 5.0.h),
        height: 70.h,
        width: 80.w,
        decoration: BoxDecoration(
          color: VoidColors.lightBlack,
          borderRadius: BorderRadius.circular(10.0.r),
        ),
        child: Column(
          children: [
            Expanded(
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15.0.w),
                    child: Container(
                      height: 80.0.h,
                      width: 80.0.w,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Theme.of(context).colorScheme.secondary,
                      ),
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Image.asset(
                            newImages[index],
                            fit: BoxFit.cover,
                          ),
                        ),
                      ).marginOnly(top: 10.0.h),
                    ),
                  ),
                  Text(
                    titles[index],
                    style: TextStyle(
                      fontSize: 5.sp,
                      color: VoidColors.whiteColor,
                      fontFamily: 'Arial',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
