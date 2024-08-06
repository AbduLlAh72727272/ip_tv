import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:ip_tv/app/common/widgets/better_player_screen.dart';
import 'package:ip_tv/app/common/widgets/vlc_player_screen.dart';
import 'package:ip_tv/generated/locales.g.dart';
import '../../../common/widgets/back_button_widget.dart';
import '../../../utils/constraints/image_strings.dart';

class MoviesView2 extends StatelessWidget {
  final String imageUrl;
  final String channelName;
  final String programInfo;
  final String date;
  final String streamUrl;

  MoviesView2({
    Key? key,
    required this.imageUrl,
    required this.channelName,
    required this.programInfo,
    required this.date,
    required this.streamUrl,
  }) : super(key: key);

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
          // Gradient overlay
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.black.withOpacity(0.6), Colors.transparent],
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
              ),
            ),
          ),
          // Content
          SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(16.0.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Back button and settings icon
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const BackButtonWidget(),  // Use the back button widget
                      IconButton(
                        icon: Icon(Icons.settings_suggest_outlined, color: Colors.white),
                        onPressed: () {},
                      ),
                    ],
                  ),
                  // Movie details
                  Row(
                    children: [
                      Container(
                        width: 100.w,
                        height: 150.h,
                        child: Image.network(
                          imageUrl.isNotEmpty ? imageUrl : VoidImages.placeholder,
                          width: 100.w,
                          height: 150.h,
                          fit: BoxFit.cover,
                          errorBuilder: (BuildContext context, Object exception, StackTrace? stackTrace) {
                            return Image.asset(
                              VoidImages.placeholder,
                              width: 100.w,
                              height: 150.h,
                              fit: BoxFit.cover,
                            );
                          },
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.0),
                          color: Colors.grey,
                        ),
                      ),
                      SizedBox(width: 16.w),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              channelName,
                              style: TextStyle(
                                fontSize: 18.sp,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(height: 8.h),
                            Text(
                              programInfo,
                              style: TextStyle(
                                fontSize: 7.sp,
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(height: 16.h),
                            Row(
                              children: [
                                ElevatedButton(
                                  onPressed: () {
                                    Get.to(() => VlcPlayerScreen(streamUrl: streamUrl));
                                  },
                                  child: Text(LocaleKeys.Play.tr),
                                  style: ElevatedButton.styleFrom(
                                    padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8.0), // Decrease roundness
                                    ),
                                  ),
                                ),
                                SizedBox(width: 8.w),
                                Flexible(
                                  child: OutlinedButton(
                                    onPressed: () {},
                                    child: Text(LocaleKeys.ContinueWatching.tr,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(color: Colors.white)),
                                    style: OutlinedButton.styleFrom(
                                      side: BorderSide(color: Colors.white),
                                      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(8.0), // Decrease roundness
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(width: 8.w),
                                Flexible(
                                  child: OutlinedButton(
                                    onPressed: () {},
                                    child: Text(LocaleKeys.WatchLater.tr,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(color: Colors.white)),
                                    style: OutlinedButton.styleFrom(
                                      side: BorderSide(color: Colors.white),
                                      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(8.0), // Decrease roundness
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
