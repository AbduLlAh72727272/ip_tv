import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:ip_tv/app/utils/constraints/colors.dart';

class FirstHomeView extends GetView {
  FirstHomeView({super.key});
  var selectedIndex = 0.obs;

  @override
  Widget build(BuildContext context) {
    List<String> images = [
      'assets/images/movieInfoImg.png',
      'assets/images/movieInfoImg.png',
      'assets/images/movieInfoImg.png',
      'assets/images/movieInfoImg.png',
      'assets/images/movieInfoImg.png',
      'assets/images/movieInfoImg.png',
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
                Image.asset('assets/images/vpnImg.png',
                  height: 30.0.h, width: 30.0.w,),
                Text('VPN', style: TextStyle(
                  fontSize: 10.sp,
                  fontWeight: FontWeight.w500,
                  color: VoidColors.whiteColor
                ),
                ),
                Spacer(),
                Image.asset('assets/images/iptv logo.png',
                  height: 50.0.h, width: 50.0.w,),
                Text('ARK VIP', style: TextStyle(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w500,
                    color: VoidColors.whiteColor
                ),
                ),
                Spacer(),
                Image.asset('assets/icons/searchIcon.png',
                  height: 20.0.h, width: 20.0.w,),
                Image.asset('assets/icons/homeTheme.png',
                  height: 20.0.h, width: 20.0.w,),
                Image.asset('assets/icons/languagesIcon.png',
                  height: 20.0.h, width: 20.0.w,),
              ],
            ),
          ),
          Expanded(
            child: Column(
              children: [
                Container(
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/bg3.png'),
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
                          child: Image.asset('assets/images/liveTvImg.png',
                            height: 110.0.h, width: 130.0.w,),
                        ),
                        Expanded(
                          flex: 2,
                          child: Image.asset('assets/images/movieImg.png',
                            height: 110.0.h, width: 130.0.w,),
                        ),
                        Expanded(
                          flex: 2,
                          child: Image.asset('assets/images/seriesImg.png',
                            height: 110.0.h, width: 130.0.w,),
                        ),
                        Expanded(
                          flex: 2,
                          child: Image.asset('assets/images/settingsImg.png',
                            height: 110.0.h, width: 130.0.w,),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Container(
                    color: Theme.of(context).colorScheme.secondary,
                    width: double.infinity,
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(top: 15.0.h, bottom: 15.0.h),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    color: VoidColors.whiteColor.withOpacity(0.2),
                                    borderRadius: BorderRadius.circular(6.0.r),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(horizontal: 7.0),
                                    child: Text('Movie Info', style: TextStyle(
                                       fontFamily: 'Arial',
                                        fontSize: 8.sp,
                                        fontWeight: FontWeight.w700,
                                        color: VoidColors.whiteColor,
                                    ),
                                    ),
                                  ),
                                ),
                                SizedBox(width: 15.0.w),
                                Container(
                                  decoration: BoxDecoration(
                                    color: VoidColors.whiteColor.withOpacity(0.2),
                                    borderRadius: BorderRadius.circular(6.0.r),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(horizontal: 7.0),
                                    child: Text('Sports Info', style: TextStyle(
                                      fontFamily: 'Arial',
                                      fontSize: 8.sp,
                                      fontWeight: FontWeight.w700,
                                      color: VoidColors.whiteColor,
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
                                  bool isSelected = selectedIndex.value == index;
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
                                }),
                          ),
                          SizedBox(height: 20.0.h),
                          SizedBox(
                            width: double.infinity,
                            height: 160.h,
                            child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: 4,
                                itemBuilder: (context, index) {
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
                                              child: Container(
                                                decoration: BoxDecoration(),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                  );
                                }),
                          )
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
