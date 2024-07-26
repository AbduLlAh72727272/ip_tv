import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../utils/constraints/colors.dart'; // Import your color file
import '../../../utils/theme/custom_themes/theme.dart'; // Import your theme file

class SeriesView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(40.h), // Decrease the height of the AppBar
        child: AppBar(
          backgroundColor: VoidColors.primary, // Use theme color
          automaticallyImplyLeading: false, // Remove the back button
          title: Row(
            children: [
              Image.asset(
                'assets/images/vpnImg.png', // Add your VPN logo here
                height: 30.h,
              ),
              SizedBox(width: 2.w),
              //Text('VPN', style: TextStyle(color: Colors.white)),
            ],
          ),
          actions: [
            IconButton(
              icon: Icon(Icons.search, color: Colors.white),
              onPressed: () {
                // Add your search functionality here
              },
            ),
            IconButton(
              icon: Icon(Icons.settings_suggest_outlined, color: Colors.white),
              onPressed: () {
                // Add your settings functionality here
              },
            ),
          ],
        ),
      ),
      extendBodyBehindAppBar: true,
      body: Stack(
        children: [
          // Background gradient
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.black, VoidColors.primary],
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
              ),
            ),
          ),
          // Content
          SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  width: double.infinity,
                  height: 400.h, // Adjusted height for the main image
                  child: Stack(
                    children: [
                      Image.asset(
                        'assets/images/bg3.png', // Replace with your content image
                        width: double.infinity,
                        height: double.infinity,
                        fit: BoxFit.cover,
                      ),
                      Positioned(
                        left: 16.w,
                        bottom: 16.h,
                        child: Text(
                          'Gone Girl',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 24.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.0.w),
                  child: Column(
                    children: [
                      SizedBox(height: 10.h),
                      GridView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          crossAxisSpacing: 10.w,
                          mainAxisSpacing: 10.h,
                          childAspectRatio: 2 / 3,
                        ),
                        itemCount: 12, // Adjust based on your data
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              Get.toNamed('/series_view2'); // Navigate to series_view2
                            },
                            child: Stack(
                              children: [
                                Column(
                                  children: [
                                    Expanded(
                                      child: Image.asset(
                                        'assets/images/sample.png', // Replace with your thumbnails
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    SizedBox(height: 5.h),
                                  ],
                                ),
                                Positioned(
                                  top: 5.h,
                                  left: 5.w,
                                  child: Container(
                                    padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 2.h),
                                    color: VoidColors.redColor,
                                    child: Text(
                                      'New',
                                      style: TextStyle(fontSize: 8.sp, color: Colors.white),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                      SizedBox(height: 10.h),
                      Align(
                        alignment: Alignment.center,
                        child: Text(
                          'Expiration: 24/09/2022',
                          style: TextStyle(color: Colors.white, fontSize: 8.sp),
                        ),
                      ),
                      SizedBox(height: 20.h),
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
}
