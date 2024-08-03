import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../generated/locales.g.dart';
import '../../../common/widgets/movies_card.dart';
import '../../../utils/constraints/colors.dart';
import '../../../utils/constraints/image_strings.dart';
import '../controllers/movies_controller.dart';
import '../models/movie_model.dart';

class MoviesView extends GetView<MoviesController> {
  MoviesView({super.key});

  @override
  Widget build(BuildContext context) {
    // Initialize ScreenUtil
    ScreenUtil.init(context, designSize: Size(360, 690), minTextAdapt: true, splitScreenMode: true);

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 40.h,
        backgroundColor: Theme.of(context).colorScheme.primary,
        elevation: 0,
        leading: Padding(
          padding: EdgeInsets.all(2.0.w),
          child: Image.asset(
            VoidImages.vpn_blue,
            fit: BoxFit.contain,
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.search, color: Colors.white),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.settings_suggest_outlined, color: Colors.white),
            onPressed: () {},
          ),
        ],
      ),
      extendBodyBehindAppBar: false,
      body: Stack(
        children: [
          // Background gradient
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.black, Theme.of(context).colorScheme.primary],
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
              ),
            ),
          ),
          // Content
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Header Image with Title Overlay
                Stack(
                  children: [
                    Container(
                      height: 500.h,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(VoidImages.background3),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 20.h,
                      left: 16.w,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'HOUSE OF NINJAS',
                            style: TextStyle(
                              fontSize: 24.sp,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(height: 8.h),
                          Text(
                            'Years after retiring from their formidable ninja lives, a dysfunctional family must \n return to shadowy missions to counteract a string of looming threats.',
                            style: TextStyle(
                              fontSize: 7.sp,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(height: 16.h),
                          Row(
                            children: [
                              ElevatedButton.icon(
                                onPressed: () {},
                                icon: Icon(Icons.play_arrow),
                                label: Text(LocaleKeys.Play.tr),
                                style: ElevatedButton.styleFrom(
                                  foregroundColor: Colors.black,
                                //  backgroundColor: Colors.white,
                                  padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 12.h),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8.0), // Decrease roundness
                                  ),
                                ),
                              ),
                              SizedBox(width: 8.w),
                              OutlinedButton(
                                onPressed: () {},
                                child: Text(LocaleKeys.MoreInfo.tr),
                                style: OutlinedButton.styleFrom(
                                  foregroundColor: Colors.white,
                                  side: BorderSide(color: Colors.white),
                                  padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 12.h),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8.0), // Decrease roundness
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
                Padding(
                  padding: EdgeInsets.all(16.0.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 24.h),
                      // Matched to You Section
                      _buildMatchedSection(),
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

  Widget _buildMatchedSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Matched to You Title
        // Text(
        //   'Matched to You',
        //   style: TextStyle(
        //     fontSize: 9.sp,
        //     fontWeight: FontWeight.bold,
        //     color: Colors.white,
        //   ),
        // ),
        SizedBox(height: 8.h),
        // Movies List
        SizedBox(
          height: 180.h,
          child: ListView.builder(
            itemCount: 5,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  Get.toNamed('/movies_view2');
                },
                child: buildMovieCard('assets/images/sample.png', ''),
              );
            },
          ),
        ),
        SizedBox(height: 16.h),
        // Matched to You Title (Second Row)
        // Text(
        //   'Matched to You',
        //   style: TextStyle(
        //     fontSize: 9.sp,
        //     fontWeight: FontWeight.bold,
        //     color: Colors.white,
        //   ),
        // ),
        SizedBox(height: 8.h),
        // Movies List (Second Row)
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              buildMovieCard('assets/images/sample.png', ''),
              buildMovieCard('assets/images/sample.png', ''),
              buildMovieCard('assets/images/sample.png', ''),
            ],
          ),
        ),
        SizedBox(height: 16.h),
        // Expiration Date
        Text(
          'Expiration: 24/09/2022',
          style: TextStyle(
            fontSize: 7.sp,
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}
