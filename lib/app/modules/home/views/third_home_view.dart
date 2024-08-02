import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:ip_tv/app/modules/home/views/home_theme_dialog.dart';

import '../../../../generated/locales.g.dart';
import '../../../routes/app_pages.dart';
import '../../../utils/constraints/colors.dart';
import '../../../utils/constraints/image_strings.dart';
import '../../setting/views/setting_view.dart';
import 'first_home_view.dart';

class ThirdHomeView extends GetView {
  const ThirdHomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    List<String> icons = [
      'assets/icons/homeIcon.png',
      'assets/icons/liveIcon.png',
      'assets/icons/moviesIcon.png',
      'assets/icons/multiScreenIcon.png',
      'assets/icons/seriesIcon.png',
      'assets/icons/sportsIcon.png',
      'assets/icons/recIcon.png',
      'assets/icons/settingsIcon.png'
    ];

    List<String> titles = [
      LocaleKeys.Home.tr,
      LocaleKeys.LiveTv.tr,
      LocaleKeys.Movies.tr,
      LocaleKeys.MultiScreen.tr,
      LocaleKeys.Series.tr,
      LocaleKeys.Sports.tr,
      LocaleKeys.Recording.tr,
      LocaleKeys.Settings.tr
    ];
    List<String> numbers = [
      '10',
      '10',
      '10',
      '10',
      '10',
      '10',
      '10',
      '10',
      '10',
      '10',
    ];



    return Scaffold(
      backgroundColor: VoidColors.blackColor,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 15.0.h,),
          Container(
            height: 55.h,
            width: double.infinity,
            color: Colors.transparent,
            child: Row(
              children: [
                Image.asset('assets/images/transBgVpn.png',
                  height: 25.0.h, width: 25.0.w,),
                GestureDetector(
                    onTap: () {
                      showHomeScreenDialog();
                    },
                    child: Image.asset(VoidImages.homeTheme, height: 25.h, width: 25.w,)),
                Spacer(),
                Image.asset('assets/images/iptv logo.png',
                  height: 40.0.h, width: 40.0.w,),
                Text('ARK VIP', style: TextStyle(
                    fontSize: 9.sp,
                    fontWeight: FontWeight.w500,
                    color: VoidColors.whiteColor
                ),
                ),
                Spacer(),
                Text('${LocaleKeys.Expiration.tr} : 24/09/2022', style: TextStyle(
                    fontSize: 7.sp,
                    color: VoidColors.whiteColor,
                    fontFamily: 'Arial',
                    fontWeight: FontWeight.w400
                ),),
              ],
            ).marginSymmetric(horizontal: 7.0.w),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                child: GestureDetector(
                onTap: () {
                      Get.toNamed(Routes.HOME);
                },
                         child:
                            ThirdHomeCardWidget(icons: icons[0], titles: titles[0]),

                          ),
              ),
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    Get.toNamed(Routes.LIVE_T_V);
                  },
                  child:
                  ThirdHomeCardWidget(icons: icons[1], titles: titles[1]),

                ),
              ),
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    Get.toNamed(Routes.MOVIES);
                  },
                  child:
                  ThirdHomeCardWidget(icons: icons[2], titles: titles[2]),

                ),
              ),
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    Get.toNamed(Routes.MULTISCREEN);
                  },
                  child:
                  ThirdHomeCardWidget(icons: icons[3], titles: titles[3]),

                ),
              ),
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    Get.toNamed(Routes.SERIES);
                  },
                  child:
                  ThirdHomeCardWidget(icons: icons[4], titles: titles[4]),

                ),
              ),
              Expanded(
                child: GestureDetector(
                  onTap: () {},
                  child:
                  ThirdHomeCardWidget(icons: icons[5], titles: titles[5]),

                ),
              ),
              Spacer(),
              Expanded(
                child: GestureDetector(
                  onTap: () {},
                  child:
                  ThirdHomeCardWidget(icons: icons[6], titles: titles[6]),

                ),
              ),
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    Get.to(() => SettingView());
                  },
                  child:
                  ThirdHomeCardWidget(icons: icons[7], titles: titles[7]),

                ),
              ),
            ],
          ),
          Expanded(child:
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.0.w, vertical: 10.0.h),
            child: Row(
              children: [
                Image.asset('assets/images/thrdHomeImg.png'),
                SizedBox(width: 5.0.w),
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.primary
                    ),
                    child:Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: Container(
                            color: Theme.of(context).colorScheme.secondary,
                            child: Column(
                              children: [
                                Expanded(
                                  child: RichText(
                                    text: TextSpan(
                                      children: List.generate(9, (index) {
                                        return TextSpan(
                                          text: '10\n',
                                          style: TextStyle(
                                            fontSize: 7.sp,
                                            color: VoidColors.whiteColor,
                                            fontFamily: 'Arial',
                                            fontWeight: FontWeight.w400,
                                          ),
                                        );
                                      }),
                                    ),
                                  ).marginSymmetric(vertical: 4.0.h),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 5,
                          child: Container(
                            color: Theme.of(context).colorScheme.primary,
                            child: RichText(
                              text: TextSpan(
                                children: List.generate(9, (index) {
                                  return TextSpan(
                                    text: '  Sports      13   10     13    12    15\n',
                                    style: TextStyle(
                                      fontSize: 7.sp,
                                      color: VoidColors.whiteColor,
                                      fontFamily: 'Arial',
                                      fontWeight: FontWeight.w400,
                                    ),
                                  );
                                }),
                              ),
                            ).marginSymmetric(vertical: 5.0.h),
                          ),
                        ),
                      ],
                    )

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

class ThirdHomeCardWidget extends StatelessWidget {
  const ThirdHomeCardWidget({
    super.key,
    required this.icons,
    required this.titles,
  });

  final String icons;
  final String titles;

  @override
  Widget build(BuildContext context) {
    return Container(
            margin: EdgeInsets.symmetric(horizontal: 3.0.w, vertical: 5.0.h),
            height: 90.h,
            // width: 60.w,
            decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primary,
         borderRadius: BorderRadius.circular(10.0.r)
            ),
            child: Column(
              children: [
    Expanded(
      child: Column(
        children: [
          Expanded(
            child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.0.w,),
                child: Center(
                  child: Image.asset(icons,
                    // height: 50.h,
                    // width: 50.w,
                   ),
                ).marginOnly(top: 10.0.h)
            ),
          ),
          Text(titles,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontSize: 5.sp,
              color: VoidColors.whiteColor,
              fontFamily: 'Arial',
              fontWeight: FontWeight.w400
          ),).marginSymmetric(horizontal: 3.0.w, vertical: 6.0.h)
        ],
      ),
    ),
              ],
            ),
          );
  }
}
