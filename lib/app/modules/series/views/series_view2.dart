import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:ip_tv/app/common/widgets/vlc_player_screen.dart';
import '../../../../generated/locales.g.dart';
import '../../../common/widgets/back_button_widget.dart';
import '../../../utils/constraints/image_strings.dart';
import '../controllers/series_controller.dart';


class SeriesView2 extends StatelessWidget {
  const SeriesView2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Series series = Get.arguments;

    return Scaffold(
      body: Stack(
        children: [
          // Background image
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: FadeInImage.assetNetwork(
                  placeholder: VoidImages.logo, // Placeholder image
                  image: series.logo,
                  fit: BoxFit.cover,
                  imageErrorBuilder: (context, error, stackTrace) {
                    return Image.asset(VoidImages.logo, fit: BoxFit.cover);
                  },
                ).image,
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
                      const BackButtonWidget(), // Use the back button widget
                      // IconButton(
                      //   icon: Icon(Icons.settings_suggest_outlined, color: Colors.white),
                      //   onPressed: () {},
                      // ),
                    ],
                  ),
                  // Series details
                  Row(
                    children: [
                      Container(
                        width: 100.w,
                        height: 150.h,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: FadeInImage.assetNetwork(
                              placeholder: VoidImages.logo, // Placeholder image
                              image: series.logo,
                              fit: BoxFit.cover,
                              imageErrorBuilder: (context, error, stackTrace) {
                                return Image.asset(VoidImages.logo, fit: BoxFit.cover);
                              },
                            ).image,
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
                              series.name,
                              style: TextStyle(
                                fontSize: 18.sp,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(height: 8.h),
                            Text(
                              series.group,
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
                                    Get.to(() => VlcPlayerScreen(streamUrl: series.url));
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
                                    child: Text(
                                      LocaleKeys.ContinueWatching.tr,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(color: Colors.white),
                                    ),
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
                                    child: Text(
                                      LocaleKeys.WatchLater.tr,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(color: Colors.white),
                                    ),
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
                  // Similar Series Section
                  // Text(
                  //   LocaleKeys.SimilarMovies.tr,
                  //   style: TextStyle(
                  //     fontSize: 18.sp,
                  //     fontWeight: FontWeight.bold,
                  //     color: Colors.white,
                  //   ),
                  // ),
                  // SizedBox(height: 8.h),
                  // SingleChildScrollView(
                  //   scrollDirection: Axis.horizontal,
                  //   child: Row(
                  //     children: [
                  //       _buildSimilarMovieCard(series.logo),
                  //       _buildSimilarMovieCard(series.logo),
                  //       _buildSimilarMovieCard(series.logo),
                  //       _buildSimilarMovieCard(series.logo),
                  //     ],
                  //   ),
                  // ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Widget _buildSimilarMovieCard(String imagePath) {
  //   return Padding(
  //     padding: EdgeInsets.only(right: 8.0.w),
  //     child: Column(
  //       crossAxisAlignment: CrossAxisAlignment.start,
  //       children: [
  //         Container(
  //           width: 100.w,
  //           height: 150.h,
  //           decoration: BoxDecoration(
  //             image: DecorationImage(
  //               image: FadeInImage.assetNetwork(
  //                 placeholder: VoidImages.placeholder, // Placeholder image
  //                 image: imagePath,
  //                 fit: BoxFit.cover,
  //                 imageErrorBuilder: (context, error, stackTrace) {
  //                   return Image.asset(VoidImages.placeholder, fit: BoxFit.cover);
  //                 },
  //               ).image,
  //               fit: BoxFit.cover,
  //             ),
  //           ),
  //         ),
  //       ],
  //     ),
  //   );
  // }
}
