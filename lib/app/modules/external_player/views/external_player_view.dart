import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../generated/locales.g.dart';
import '../../../utils/constraints/colors.dart';
import '../../../utils/constraints/image_strings.dart';
import '../controllers/external_player_controller.dart';

class ExternalPlayerView extends GetView<ExternalPlayerController> {
  ExternalPlayerView({Key? key}) : super(key: key);

  var selectedPlayer = 'MX Player'.obs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          // Background image
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(VoidImages.background1),
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Form content
          Center(
            child: Container(
              width: 300.w,
              padding: EdgeInsets.all(16.0.w),
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.5),
               // borderRadius: BorderRadius.circular(10.r),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    LocaleKeys.SelectExternalPlayer.tr,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 10.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 26.h), // Increased spacing
                  _buildRadioItem(LocaleKeys.Default.tr, context),
                  SizedBox(height: 26.h), // Increased spacing
                  _buildRadioItem(LocaleKeys.VlcPlayer.tr, context),
                  SizedBox(height: 26.h), // Increased spacing
                  _buildRadioItem(LocaleKeys.MxPlayer.tr, context),
                ],
              ),
            ),
          ),
          // Buttons
          Positioned(
            bottom: 10.h,
            left: MediaQuery.of(context).size.width / 4,
            right: MediaQuery.of(context).size.width / 4,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Get.back();
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white.withOpacity(0.4),
                    padding: EdgeInsets.symmetric(horizontal: 22.0.w, vertical: 10.0.h),
                    textStyle: TextStyle(fontSize: 9.sp),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.r),
                    ),
                  ),
                  child: Text(
                    LocaleKeys.Cancel.tr,
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    // Handle save action
                  },
                  style: ElevatedButton.styleFrom(
                    //backgroundColor: VoidColors.primary,
                    padding: EdgeInsets.symmetric(horizontal: 22.0.w, vertical: 10.0.h),
                    textStyle: TextStyle(fontSize: 9.sp),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.r),
                    ),
                  ),
                  child: Text(
                    LocaleKeys.Ok.tr,
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRadioItem(String title, BuildContext context) {
    return Obx(() {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(color: Colors.white, fontSize: 9.sp),
          ),
          GestureDetector(
            onTap: () {
              selectedPlayer.value = title;
            },
            child: Container(
              width: 13.w,
              height: 28.h,
              decoration: BoxDecoration(
                border: Border.all(
                  color: selectedPlayer.value == title
                      ? Theme.of(context).colorScheme.secondary
                      : Colors.white,
                ),
                // borderRadius: BorderRadius.circular(4.r),
                color: selectedPlayer.value == title
                    ? Theme.of(context).colorScheme.secondary
                    : Colors.transparent,
              ),
              // child: selectedPlayer.value == title
              //     ? Icon(
              //   Icons.check,
              //   size: 14.w,
              //   color: Colors.white,
              // )
              //     : null,
            ),
          ),
        ],
      );
    });
  }
}
