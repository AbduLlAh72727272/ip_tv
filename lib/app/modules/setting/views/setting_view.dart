import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../generated/locales.g.dart';
import '../../../routes/app_pages.dart';
import '../../../utils/constraints/image_strings.dart';
import '../controllers/setting_controller.dart';


class SettingView extends GetView<SettingController> {
  const SettingView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {


    return Scaffold(
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
          // Content
          Column(
            children: [
              // Back button and title
              Padding(
                padding: EdgeInsets.all(16.0.w),
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Get.back();
                      },
                      child: Image.asset(
                         VoidImages.back ,
                        height: 30.h,
                        width: 24.w,
                      ),
                    ),
                    SizedBox(width: 5.w),
                    Text(
                      LocaleKeys.Settings.tr,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 10.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: GridView.count(
                  crossAxisCount: 3,
                  padding: EdgeInsets.only(left: 30.w, right: 30.w),
                  crossAxisSpacing: 30.w,
                  mainAxisSpacing: 30.h,
                  children: [
                    _buildSettingItem(LocaleKeys.GeneralSettings.tr, context, VoidImages.general_setting, onTap: () {
                      Get.toNamed(Routes.GENERAL_SETTING);
                    }),
                    _buildSettingItem(LocaleKeys.StreamFormat.tr, context, VoidImages.stream, onTap: () {
                      Get.toNamed(Routes.STREAM_FORMAT);
                    }),
                    _buildSettingItem(LocaleKeys.TimeFormat.tr, context, VoidImages.clock, onTap: () {
                      Get.toNamed(Routes.TIME_FORMAT);
                    }),
                    _buildSettingItem(LocaleKeys.ParentalControl.tr, context, VoidImages.parental_control),
                    _buildSettingItem(LocaleKeys.Automation.tr, context, VoidImages.automation, onTap: () {
                      Get.toNamed(Routes.AUTOMATION);
                    }),
                    _buildSettingItem('EPG', context, VoidImages.epg),
                    _buildSettingItem(LocaleKeys.Themes.tr, context, VoidImages.themes, onTap: () {
                      Get.toNamed(Routes.THEMES);
                    }),
                    _buildSettingItem(LocaleKeys.ExternalPlayers.tr, context, VoidImages.player, onTap: () {
                      Get.toNamed(Routes.EXTERNAL_PLAYER);
                    }),
                    _buildSettingItem(LocaleKeys.InternetSpeedTest.tr, context, VoidImages.speed, onTap: () {
                      Get.toNamed(Routes.INTERNET_SPEED);
                    }),
                  ],

                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildSettingItem(String title, BuildContext context, String iconPath, {VoidCallback? onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.black.withOpacity(0.6),
          borderRadius: BorderRadius.circular(10.r),
          border: Border.all(color: Theme.of(context).colorScheme.secondary),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              iconPath,
              height: 70.h,
              width: 70.w,
            ),
            SizedBox(height: 10.h),
            Text(
              title,
              style: TextStyle(
                color: Colors.white,
                fontSize: 7.sp,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
