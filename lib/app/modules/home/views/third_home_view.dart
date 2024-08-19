import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:ip_tv/app/modules/home/views/home_theme_dialog.dart';
import 'package:ip_tv/app/routes/app_pages.dart';
import 'package:ip_tv/app/utils/constraints/colors.dart';
import 'package:ip_tv/app/utils/constraints/image_strings.dart';
import '../../../../generated/locales.g.dart';
import '../../../common/controller/vpn_controller.dart';
import '../../../common/widgets/vlc_player_screen.dart';
import '../../live_TV/controllers/live_t_v_controller.dart';
import '../../live_TV/views/live_t_v_view.dart';
import '../../selectLanguage/views/select_language_view.dart';
import '../../setting/views/setting_view.dart';

class ThirdHomeView extends GetView<LiveTVController> {
  const ThirdHomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<String> icons = [
      'assets/icons/homeIcon.png',
      'assets/icons/liveIcon.png',
      'assets/icons/moviesIcon.png',
      'assets/icons/multiScreenIcon.png',
      'assets/icons/seriesIcon.png',
      'assets/icons/settingsIcon.png'
    ];

    List<String> titles = [
      LocaleKeys.Home.tr,
      LocaleKeys.LiveTv.tr,
      LocaleKeys.Movies.tr,
      LocaleKeys.MultiScreen.tr,
      LocaleKeys.Series.tr,
      LocaleKeys.Settings.tr
    ];

    return Scaffold(
      backgroundColor: VoidColors.blackColor,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 15.0.h),
          Container(
            height: 55.h,
            width: double.infinity,
            color: Colors.transparent,
            child: Row(
              children: [
                GestureDetector(
                onTap: () async {
          final VPNController vpnController = Get.put<VPNController>(VPNController());
          await vpnController.toggleVPN();
          },
                  child: Image.asset(
                    'assets/images/transBgVpn.png',
                    height: 25.0.h,
                    width: 25.0.w,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    showHomeScreenDialog();
                  },
                  child: Image.asset(
                    VoidImages.homeTheme,
                    height: 25.h,
                    width: 25.w,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Get.to(() => SelectLanguageView());
                  },
                  child: Image.asset(
                    VoidImages.language,
                    height: 25.h,
                    width: 25.w,
                  ),
                ),
                Spacer(),
                Image.asset(
                  VoidImages.logo,
                  height: 40.0.h,
                  width: 40.0.w,
                ),
                Text(
                  'ARK VIP',
                  style: TextStyle(
                    fontSize: 9.sp,
                    fontWeight: FontWeight.w500,
                    color: VoidColors.whiteColor,
                  ),
                ),
                Spacer(),
                Text(
                  '${LocaleKeys.Expiration.tr} : 24/09/2022',
                  style: TextStyle(
                    fontSize: 7.sp,
                    color: VoidColors.whiteColor,
                    fontFamily: 'Arial',
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ).marginSymmetric(horizontal: 7.0.w),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    // Get.toNamed(Routes.HOME);
                  },
                  child: ThirdHomeCardWidget(
                    icons: icons[0],
                    titles: titles[0],
                  ),
                ),
              ),
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    Get.to(() => LiveTVView(initialSelectedTab: 0));
                  },
                  child: ThirdHomeCardWidget(
                    icons: icons[1],
                    titles: titles[1],
                  ),
                ),
              ),
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    Get.to(() => LiveTVView(initialSelectedTab: 1));
                  },
                  child: ThirdHomeCardWidget(
                    icons: icons[2],
                    titles: titles[2],
                  ),
                ),
              ),
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    Get.toNamed(Routes.MULTISCREEN);
                  },
                  child: ThirdHomeCardWidget(
                    icons: icons[3],
                    titles: titles[3],
                  ),
                ),
              ),
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    Get.to(() => LiveTVView(initialSelectedTab: 2));
                  },
                  child: ThirdHomeCardWidget(
                    icons: icons[4],
                    titles: titles[4],
                  ),
                ),
              ),
              Spacer(),
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    Get.to(() => SettingView());
                  },
                  child: ThirdHomeCardWidget(
                    icons: icons[5],
                    titles: titles[5],
                  ),
                ),
              ),
            ],
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.0.w, vertical: 10.0.h),
              child: Obx(() {
                return Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        if (controller.selectedChannelUrl.value.isNotEmpty) {
                          Get.to(() => VlcPlayerScreen(streamUrl: controller.selectedChannelUrl.value));
                        }
                      },
                      child: Image.network(
                        controller.selectedChannelLogo.value,
                        height: 400.0,
                        width: 400.0,
                        errorBuilder: (context, error, stackTrace) {
                          return Image.asset(
                            VoidImages.placeholder,
                            height: 400.0,
                            width: 400.0,
                          );
                        },
                      ),
                    ),
                    SizedBox(width: 5.0.w),
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.primary,
                        ),
                        child: controller.isLoading.value
                            ? Center(child: CircularProgressIndicator())
                            : ListView.builder(
                          itemCount: controller.entries.length,
                          itemBuilder: (context, index) {
                            final channel = controller.entries[index];
                            return GestureDetector(
                              onTap: () {
                                controller.selectedChannelLogo.value =
                                    channel.logo;
                                controller.selectedChannelUrl.value =
                                    channel.url;
                              },
                              child: Container(
                                padding:
                                EdgeInsets.symmetric(vertical: 4.0.h),
                                child: Row(
                                  children: [
                                    Expanded(
                                      flex: 1,
                                      child: Text(
                                        '${index + 1}',
                                        style: TextStyle(
                                          fontSize: 7.sp,
                                          color: VoidColors.whiteColor,
                                          fontFamily: 'Arial',
                                          fontWeight: FontWeight.w400,
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                    Expanded(
                                      flex: 5,
                                      child: Text(
                                        channel.displayName,
                                        style: TextStyle(
                                          fontSize: 7.sp,
                                          color: VoidColors.whiteColor,
                                          fontFamily: 'Arial',
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  ],
                );
              }),
            ),
          ),
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
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primary,
        borderRadius: BorderRadius.circular(10.0.r),
      ),
      child: Column(
        children: [
          Expanded(
            child: Column(
              children: [
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10.0.w),
                    child: Center(
                      child: Image.asset(
                        icons,
                      ).marginOnly(top: 10.0.h),
                    ),
                  ),
                ),
                Text(
                  titles,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 5.sp,
                    color: VoidColors.whiteColor,
                    fontFamily: 'Arial',
                    fontWeight: FontWeight.w400,
                  ),
                ).marginSymmetric(horizontal: 3.0.w, vertical: 6.0.h),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
