import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:ip_tv/app/modules/home/views/home_theme_dialog.dart';
import 'package:ip_tv/app/utils/constraints/colors.dart';
import '../../../../generated/locales.g.dart';
import '../../../routes/app_pages.dart';
import '../../../utils/constraints/image_strings.dart';
import '../../selectLanguage/views/select_language_view.dart';

class FirstHomeView extends GetView {
  FirstHomeView({super.key});
  var selectedIndex = 0.obs;
  var secSelectedIndex = 0.obs;
  var tabSelectedIndex = 0.obs;

  @override
  Widget build(BuildContext context) {
    List<String> images = [
      VoidImages.movieInfo,
      VoidImages.movieInfo,
      VoidImages.movieInfo,
      VoidImages.movieInfo,
      VoidImages.movieInfo,
      VoidImages.movieInfo,
    ];

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
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: 55.h,
            width: double.infinity,
            color: Theme.of(context).colorScheme.secondary,
            child: Row(
              children: [
                Image.asset(VoidImages.vpn_blue,
                  height: 30.0.h, width: 30.0.w,),
                Text('', style: TextStyle(
                  fontSize: 10.sp,
                  fontWeight: FontWeight.w500,
                  color: VoidColors.whiteColor
                ),
                ),
                Spacer(),
                Image.asset(VoidImages.logo,
                  height: 50.0.h, width: 50.0.w,),
                Text('ARK VIP', style: TextStyle(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w500,
                    color: VoidColors.whiteColor
                ),
                ),
                Spacer(),
                Image.asset(VoidImages.search,
                  height: 20.0.h, width: 20.0.w,),
                GestureDetector(
                  onTap: () {
                    showHomeScreenDialog();
                  },
                  child:  Image.asset(VoidImages.homeTheme,
                    height: 20.0.h, width: 20.0.w,),
                ),
                GestureDetector(
                  onTap: () {
                    Get.to(() => SelectLanguageView());
                  },
                  child: Image.asset(VoidImages.language,
                     height: 20.0.h, width: 20.0.w,),
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
                    child:
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 15.0.w),
                      child: Row(
                        children: [
                          Expanded(
                            flex: 2,
                            child: GestureDetector(
                              onTap: () {
                                Get.toNamed(Routes.LIVE_T_V);
                              },
                              child: Container(
                                height: 110.0.h, width: 130.0.w,
                              decoration: const BoxDecoration(
                                image: DecorationImage(image: AssetImage(
                                    VoidImages.live_Tv,
                                ))
                              ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.symmetric(vertical: 4.0.h),
                                      child: SizedBox(
                                        width: 45.w,
                                        child: Center(
                                          child: Text(LocaleKeys.LiveTv.tr,
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
                                )
                                // Image.asset(VoidImages.live_Tv,
                                //   height: 110.0.h, width: 130.0.w,),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 2,
                            child: GestureDetector(
                              onTap: () {
                                Get.toNamed(Routes.MOVIES);
                              },
                              child: Container(
                                  height: 110.0.h, width: 130.0.w,
                                  decoration: const BoxDecoration(
                                      image: DecorationImage(image: AssetImage(
                                        VoidImages.movie,
                                      ))
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.symmetric(vertical: 4.0.h),
                                        child: SizedBox(
                                          width: 45.w,
                                          child: Center(
                                            child: Text(LocaleKeys.Movies.tr,
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
                                  )
                                // Image.asset(VoidImages.live_Tv,
                                //   height: 110.0.h, width: 130.0.w,),
                              ),
                              // Image.asset(VoidImages.movie,
                              //   height: 110.0.h, width: 130.0.w,),
                            ),
                          ),
                          Expanded(
                            flex: 2,
                            child: GestureDetector(
                              onTap: () {
                                Get.toNamed(Routes.SERIES);
                              },
                              child: Container(
                                  height: 110.0.h, width: 130.0.w,
                                  decoration: const BoxDecoration(
                                      image: DecorationImage(image: AssetImage(
                                        VoidImages.series,
                                      ))
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.symmetric(vertical: 4.0.h),
                                        child: SizedBox(
                                          width: 45.w,
                                          child: Center(
                                            child: Text(LocaleKeys.Series.tr,
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
                                  )
                                // Image.asset(VoidImages.live_Tv,
                                //   height: 110.0.h, width: 130.0.w,),
                              ),
                              // Image.asset(VoidImages.series,
                              //   height: 110.0.h, width: 130.0.w,),
                            ),
                          ),
                          Expanded(
                            flex: 2,
                            child: GestureDetector(
                              onTap: () {
                                Get.toNamed(Routes.SETTING);
                              },
                              child: Container(
                                  height: 110.0.h, width: 130.0.w,
                                  decoration: const BoxDecoration(
                                      image: DecorationImage(image: AssetImage(
                                        VoidImages.setting,
                                      ))
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.symmetric(vertical: 4.0.h),
                                        child: SizedBox(
                                          width: 45.w,
                                          child: Center(
                                            child: Text(LocaleKeys.Settings.tr,
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
                                  )
                                // Image.asset(VoidImages.live_Tv,
                                //   height: 110.0.h, width: 130.0.w,),
                              ),
                              // Image.asset(VoidImages.setting,
                              //   height: 110.0.h, width: 130.0.w,),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [Theme.of(context).colorScheme.secondary,
                          VoidColors.blackColor],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        // stops: [0.6, 1],
                      ),
                    ),
                    width: double.infinity,
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(top: 15.0.h, bottom: 15.0.h),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Obx(() =>
                                GestureDetector(
                                  onTap: () {
                                    tabSelectedIndex.value = 0;
                                    },
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: tabSelectedIndex.value == 0 ? VoidColors.whiteColor.withOpacity(0.2) :
                                      null,
                                      borderRadius: BorderRadius.circular(6.0.r),
                                    ),
                                    child: Padding(
                                      padding: EdgeInsets.symmetric(horizontal: 7.0, vertical: 3.0.h),
                                      child: Text(LocaleKeys.MovieInfo.tr, style: TextStyle(
                                         fontFamily: 'Arial',
                                          fontSize: 8.sp,
                                          fontWeight: FontWeight.w700,
                                          color: VoidColors.whiteColor,
                                      ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(width: 15.0.w),
                              Obx(() =>
                                GestureDetector(
                                  onTap: () {
                                    tabSelectedIndex.value = 1;
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: tabSelectedIndex.value == 1 ? VoidColors.whiteColor.withOpacity(0.2) : null,
                                      borderRadius: BorderRadius.circular(6.0.r),
                                    ),
                                    child: Padding(
                                      padding: EdgeInsets.symmetric(horizontal: 7.0, vertical: 3.0.h),
                                      child: Text(LocaleKeys.SportInfo.tr, style: TextStyle(
                                        fontFamily: 'Arial',
                                        fontSize: 8.sp,
                                        fontWeight: FontWeight.w700,
                                        color: VoidColors.whiteColor,
                                      ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          width: double.infinity,
                          height: 165.h,
                          decoration: BoxDecoration(
                            color: VoidColors.whiteColor.withOpacity(0.2),
                          ),
                          child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                            itemCount: images.length,
                              itemBuilder: (context, index) {
                                return FirstHomeFirstCardWidget(selectedIndex: selectedIndex, images: images, index: index,);
                                // );
                              }),
                        ),
                        SizedBox(height: 20.0.h),
                        SizedBox(
                          width: double.infinity,
                          height: 130.h,
                          child: ListView.builder(
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
                          ),
                        )
                            .marginOnly(bottom: 40.0.h),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 6.0.w, vertical: 7.0.h),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('${LocaleKeys.Expiration.tr}: 24/09/2022', style: TextStyle(
                                  fontSize: 6.sp,
                                  color: VoidColors.whiteColor,
                                  fontFamily: 'Arial',
                                  fontWeight: FontWeight.w400
                              ),),
                              Text('${LocaleKeys.LoggedInAs.tr}: XYZ', style: TextStyle(
                                  fontSize: 6.sp,
                                  color: VoidColors.whiteColor,
                                  fontFamily: 'Arial',
                                  fontWeight: FontWeight.w400
                              ),)
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
}

class FirstHomeFirstCardWidget extends StatelessWidget {
   FirstHomeFirstCardWidget({
    super.key,
    required this.selectedIndex,
    required this.images,
    required this.index
  });

  final RxInt selectedIndex;
  final List<String> images;
  int index;

  @override
  Widget build(BuildContext context) {
    return Obx(() =>
      GestureDetector(
        onTap: () {
            selectedIndex.value = index;
        },
        child:
          Stack(
            children: [
              Padding(
                padding: EdgeInsets.only(left: 2.0.w, top: selectedIndex.value == index ? 10.0.h :
                  50.0.h, right: 1.0.w),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10.0.r),
                  child: Image.asset(
                    images[index],
                    fit: BoxFit.cover,
                    height: selectedIndex.value == index ? 150.h : 100.h,
                    width: selectedIndex.value == index ? 70.w : 90.w,
                    color: selectedIndex.value == index ? null : Colors.black.withOpacity(0.5),
                    colorBlendMode: selectedIndex.value == index ? null : BlendMode.darken,
                  ),
                ),
              ),
            ],
          ),
      ),
    );
  }
}

class FirstHomeSecCardWidget extends StatelessWidget {
   FirstHomeSecCardWidget({
    super.key,
    required this.secSelectedIndex,
    required this.newImages,
    required this.titles,
    required this.index
  });

  final RxInt secSelectedIndex;
  final List<String> newImages;
  final List<String> titles;
  int index;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(

        child:
        Container(
          margin: EdgeInsets.symmetric(horizontal: 3.0.w, vertical: 5.0.h),
          height: 70.h,
          width: 80.w,
          // height: secSelectedIndex.value == index ? 100.h : 70.h,
          // width: secSelectedIndex.value == index ? 110.w : 80.w,
          decoration: BoxDecoration(
            color: VoidColors.lightBlack,
            borderRadius: BorderRadius.circular(10.0.r)
          ),
          child: Column(
            children: [
              Expanded(
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 15.0.w,),
                      child: Container(
                        // // padding: EdgeInsets.all(3.0),
                        height: 80.0.h,
                        width: 80.0.w,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Theme.of(context).colorScheme.secondary
                        ),
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Image.asset(newImages[index],
                              fit: BoxFit.cover,),
                          ),
                        ),
                      ).marginOnly(top: 10.0.h)
                    ),
                    Text(titles[index], style: TextStyle(
                      fontSize: 5.sp,
                      color: VoidColors.whiteColor,
                      fontFamily: 'Arial',
                      fontWeight: FontWeight.w400
                    ),)
                  ],
                ),
              ),
            ],
          ),
        ),
      );
  }
}
