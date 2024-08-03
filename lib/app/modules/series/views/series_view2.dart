import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ip_tv/app/common/widgets/better_player_screen.dart';
import 'package:ip_tv/app/modules/series/controllers/series_controller.dart';
import '../../../../generated/locales.g.dart';
import '../../../common/widgets/back_button_widget.dart';
import '../../../common/widgets/vlc_player_screen.dart';
import '../../../utils/constraints/colors.dart';
import '../../../utils/constraints/image_strings.dart';


class SeriesView2 extends GetView<SeriesController> {
  const SeriesView2({Key? key}) : super(key: key);

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
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(VoidImages.sample),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      SizedBox(width: 16.w),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Akuaman The Saga',
                              style: TextStyle(
                                fontSize: 18.sp,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(height: 8.h),
                            Text(
                              'Half-human, half-Atlantean Arthur Curry must take his rightful place as the king of Atlantis and prevent a large-scale conflict from breaking out between the underwater kingdom and the surface world.',
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
                                    Get.to(() => BetterPlayerScreen(streamUrl: 'http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4'));
                                    //Get.to(() => VlcPlayerScreen(streamUrl: 'http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4'));
                                  },
                                  child: Text(LocaleKeys.Play.tr),
                                  style: ElevatedButton.styleFrom(
                                    // backgroundColor: VoidColors.primary,
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
                                        style: TextStyle(color: VoidColors.whiteColor)),
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
                                        style: TextStyle(color: VoidColors.whiteColor)),
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
                  SizedBox(height: 24.h),
                  // Similar Movies Section
                  Text(
                    LocaleKeys.SimilarMovies.tr,
                    style: TextStyle(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 8.h),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        _buildSimilarMovieCard(VoidImages.sample),
                        _buildSimilarMovieCard(VoidImages.sample),
                        _buildSimilarMovieCard(VoidImages.sample),
                        _buildSimilarMovieCard(VoidImages.sample),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSimilarMovieCard(String imagePath) {
    return Padding(
      padding: EdgeInsets.only(right: 8.0.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 100.w,
            height: 150.h,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(imagePath),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
