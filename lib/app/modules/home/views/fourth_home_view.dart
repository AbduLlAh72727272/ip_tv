import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:ip_tv/app/modules/home/views/home_theme_dialog.dart';

import '../../../../generated/locales.g.dart';
import '../../../utils/constraints/colors.dart';
import '../../setting/views/setting_view.dart';
import 'first_home_view.dart';

class FourthHomeView extends GetView {
  FourthHomeView({super.key});
  var secSelectedIndex = 0.obs;

  @override
  Widget build(BuildContext context) {
    List<String> newImages = [
      'assets/images/mikeImg.png',
      'assets/images/tvImg.png',
      'assets/images/secTvImg.png',
      'assets/images/sportsImg.png',
      'assets/images/secTvImg.png',
      'assets/images/sportsImg.png',
    ];
    List<String> titles = [
      LocaleKeys.Recording.tr,
      LocaleKeys.Epg.tr,
      LocaleKeys.MultiScreen.tr,
      LocaleKeys.SportGuide.tr,
      LocaleKeys.MultiScreen.tr,
      LocaleKeys.SportGuide.tr,
    ];

    return Scaffold(
      body: Column(
        children: [
          Container(
            height: 55.h,
            width: double.infinity,
            color: VoidColors.blackColor,
            padding: EdgeInsets.only(top: 5.0.h),
            child: Row(
              children: [
                Image.asset('assets/images/vpnImg.png',
                  height: 25.0.h, width: 25.0.w,),
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
                Image.asset('assets/icons/searchIcon.png',
                  height: 20.0.h, width: 20.0.w,),
                GestureDetector(
                    onTap: () {
                      showHomeScreenDialog();
                    },
                    child: Image.asset('assets/icons/themes.png', height: 25.h, width: 25.w,)),
                GestureDetector(
                  onTap: () {
                    Get.to(() => SettingView());
                  },
                  child: Image.asset('assets/icons/settingsIcon.png',
                    height: 20.0.h, width: 20.0.w,),
                ),
                Image.asset('assets/icons/personIcon.png',
                  height: 20.0.h, width: 20.0.w,),
              ],
            ).marginSymmetric(horizontal: 7.0.w),
          ),
          Expanded(
            child: Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/images/fourthHomeBgImg.png',),
                  fit: BoxFit.cover,
                ),
              ),
              child:  SingleChildScrollView(
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 30.0.w, vertical: 20.0.h),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            flex: 2,
                            child: Image.asset('assets/images/movieImg.png',
                              ),
                          ),
                          SizedBox(width: 10.0.w,),
                          Expanded(
                            flex: 2,
                            child: Image.asset('assets/images/seriesImg.png',
                              ),
                          ),
                          SizedBox(width: 10.0.w,),
                          Expanded(
                            flex: 2,
                            child: Image.asset('assets/images/liveTvImg.png',
                             ),
                          ),
                        ],
                      ),
                    ),

                    SizedBox(
                      width: double.infinity,
                      height: 100.h,
                      child: ListView.builder(
                        padding: EdgeInsets.symmetric(horizontal: 10.0.w),
                          scrollDirection: Axis.horizontal,
                          itemCount: newImages.length,
                          itemBuilder: (context, index) {
                            return
                                FirstHomeSecCardWidget(
                                  secSelectedIndex: secSelectedIndex,
                                  newImages: newImages,
                                  titles: titles,
                                  index: index,);
                          }),
                    ).marginOnly(bottom: 40.0.h),

                  ],
                ),
              ),
            ),
          )
        ],
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
    return Obx(() =>
      GestureDetector(
        onTap: () {
          secSelectedIndex.value = index;
        },
        child:
        Container(
          margin: EdgeInsets.symmetric(horizontal: 3.0.w, vertical: 5.0.h),
          height: secSelectedIndex.value == index ? 80.h : 60.h,
          width: secSelectedIndex.value == index ? 90.w : 70.w,
          decoration: BoxDecoration(
              color: VoidColors.lightBlack,
              borderRadius: BorderRadius.circular(10.0.r),
            border: Border.all(color: secSelectedIndex.value == index ? VoidColors.whiteColor :
            Colors.transparent)
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
                          height: 50.0.h,
                          width: 50.0.w,
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
      ),
    );
  }
}

