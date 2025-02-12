import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart'; // Import ScreenUtil
import '../../../routes/app_pages.dart';
//import 'app_pages.dart'; // Import the routes
import '../controllers/setting_controller.dart';

class SettingView extends GetView<SettingController> {
  const SettingView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Initialize ScreenUtil
    ScreenUtil.init(context, designSize: Size(360, 690), minTextAdapt: true, splitScreenMode: true);

    return Scaffold(
      body: Stack(
        children: [
          // Background image
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/image.png'), // Background image
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Content
          Column(
            children: [
              // Back button and title
              Padding(
                padding: EdgeInsets.all(16.0.w), // Padding using ScreenUtil
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Get.back();
                      },
                      child: Image.asset(
                        'assets/images/back_button.png',
                        height: 30.h, // Adjusted size using ScreenUtil
                        width: 24.w, // Adjusted size using ScreenUtil
                      ),
                    ),
                    SizedBox(width: 5.w), // Spacing using ScreenUtil
                    Text(
                      'Settings',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 10.sp, // Font size using ScreenUtil
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: GridView.count(
                  crossAxisCount: 3,
                  padding: EdgeInsets.only(left: 30.w, right: 30.w), // Padding using ScreenUtil
                  crossAxisSpacing: 30.w, // Spacing using ScreenUtil
                  mainAxisSpacing: 30.h, // Spacing using ScreenUtil
                  children: [
                    _buildSettingItem('General Settings', context, 'assets/icons/gs.png', onTap: () {
                      Get.toNamed(Routes.GENERAL_SETTING);
                    }),
                    _buildSettingItem('Stream Format', context, 'assets/icons/stream.png', onTap: () {
                      Get.toNamed(Routes.STREAM_FORMAT);
                    }),
                    _buildSettingItem('Time Format', context, 'assets/icons/clock.png', onTap: () {
                      Get.toNamed(Routes.TIME_FORMAT);
                    }),
                    _buildSettingItem('Parental Control', context, 'assets/icons/parental-control.png'),
                    _buildSettingItem('Automation', context, 'assets/icons/automation.png', onTap: () {
                      Get.toNamed(Routes.AUTOMATION);
                    }),
                    _buildSettingItem('EPG', context, 'assets/icons/epg.png'),
                    _buildSettingItem('Themes', context, 'assets/icons/themes.png', onTap: () {
                      Get.toNamed(Routes.THEMES);
                    }),
                    _buildSettingItem('External Players', context, 'assets/icons/player.png', onTap: () {
                      Get.toNamed(Routes.EXTERNAL_PLAYER);
                    }),
                    _buildSettingItem('Internet Speed Test', context, 'assets/icons/speed.png', onTap: () {
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
          borderRadius: BorderRadius.circular(10.r), // Border radius using ScreenUtil
          border: Border.all(color: Theme.of(context).colorScheme.secondary),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              iconPath,
              height: 70.h, // Adjusted height using ScreenUtil
              width: 70.w, // Adjusted width using ScreenUtil
            ),
            SizedBox(height: 10.h), // Spacing using ScreenUtil
            Text(
              title,
              style: TextStyle(
                color: Colors.white,
                fontSize: 7.sp, // Font size using ScreenUtil
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
