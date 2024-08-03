import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ip_tv/app/modules/home/views/home_theme_dialog.dart';

import '../../../../generated/locales.g.dart';
import '../../../routes/app_pages.dart';
import '../../../utils/constraints/image_strings.dart';
import '../../live_TV/views/live_t_v_view.dart';
import '../../selectLanguage/views/select_language_view.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

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
              color: Theme.of(context).colorScheme.primary,
              image: DecorationImage(
                image: AssetImage(VoidImages.background2),
                fit: BoxFit.cover,
              ),
            ),
            child: Container(
                width: double.infinity,
                height: double.infinity,
                child: Image.asset('assets/images/darkShadeImg.png', fit: BoxFit.cover)
            ),
          ),
          // Content
          Container(
            width: double.infinity,
            height: double.infinity,
            child: Row(
              children: [
                // Side Menu
                Container(
                  width: 100.w, // Adjusted width using ScreenUtil
                  color: Color(0x1E000399), // Updated background color
                  child: Column(
                    children: [
                      Container(
                        color: Theme.of(context).colorScheme.secondary,
                        padding: EdgeInsets.symmetric(vertical: 20.h),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              VoidImages.logo,
                              height: 50.h,
                            ),
                            SizedBox(width: 8.w),
                            Text(
                              'ARK VIP',
                              style: TextStyle(
                                fontFamily: 'Arial',
                                fontWeight: FontWeight.w700,
                                fontSize: 8.sp,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              _buildMenuItem(Icons.home, LocaleKeys.Home.tr, selected: true),
                              _buildMenuItem(Icons.live_tv, LocaleKeys.LiveTv.tr, onTap: () {
                                Get.to(() => LiveTVView()); // Navigate to LiveTVView
                              }),
                              _buildMenuItem(Icons.movie, LocaleKeys.Movies.tr, onTap: () {
                                Get.toNamed(Routes.MOVIES); // Navigate to Movies
                              }),
                              _buildMenuItem(Icons.screen_share, LocaleKeys.MultiScreen.tr, onTap: () {
                                Get.toNamed(Routes.MULTISCREEN); // Navigate to MultiScreen
                              }),
                              _buildMenuItem(Icons.tv, LocaleKeys.Series.tr, onTap: () {
                                Get.toNamed(Routes.SERIES); // Navigate to SeriesScreen
                              }),
                              //  _buildMenuItem(Icons.sports, LocaleKeys.Sports.tr),
                              //  _buildMenuItem(Icons.playlist_play, LocaleKeys.Playlist.tr),
                              //  _buildMenuItem(Icons.videocam, LocaleKeys.Recording.tr),
                              SizedBox(height: 20.h), // Spacing using ScreenUtil
                            ],

                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          _buildIconButton(VoidImages.vpn_red),
                          _buildIconButton(VoidImages.homeTheme, onTap: () {
                            showHomeScreenDialog();
                          }),
                          _buildIconButton(VoidImages.setting_icon, onTap: () {
                            Get.toNamed(Routes.SETTING); // Navigate to SettingView
                          }),
                          _buildIconButton(VoidImages.language, onTap: () {
                            Get.to(() => SelectLanguageView());
                          }),
                        ],
                      ),
                      SizedBox(height: 10.h), // Spacing using ScreenUtil
                    ],
                  ),
                ),
                // Main Content
                Expanded(
                  child: Stack(
                    children: [
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Container(
                          padding: EdgeInsets.all(16.0.w), // Padding using ScreenUtil
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              SizedBox(height: 30.h), // Spacing using ScreenUtil
                              Flexible(
                                child: Image.asset(
                                  VoidImages.sample, // Replace with your content image
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        top: 16.h,
                        right: 16.w,
                        child: Text(
                          '${LocaleKeys.Expiration.tr} : 24/09/2022',
                          style: TextStyle(color: Colors.white, fontSize: 7.sp), // Adjust font size using ScreenUtil
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMenuItem(IconData icon, String title, {bool selected = false, VoidCallback? onTap}) {
    return Container(
      color: selected ? Color(0xFF3C0F71) : Colors.black.withOpacity(0.1),
      child: ListTile(
        leading: Icon(icon, color: Colors.white),
        title: Text(
          title,
          style: TextStyle(color: Colors.white, fontSize: 9.sp), // Adjust font size using ScreenUtil
        ),
        onTap: onTap ?? () {},
      ),
    );
  }

  Widget _buildIconButton(String imagePath, {VoidCallback? onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        color: Colors.transparent, // Set the background color to black
        padding: EdgeInsets.all(2.0.w), // Add padding for better alignment using ScreenUtil
        child: Image.asset(imagePath, height: 50.h, width: 10.w), // Adjusted size using ScreenUtil
      ),
    );
  }
}
