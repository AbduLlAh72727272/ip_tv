import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../utils/constraints/image_strings.dart';


class SeriesView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(40.h),
        child: AppBar(
          backgroundColor: Theme.of(context).colorScheme.primary,
          automaticallyImplyLeading: false,
          title: Row(
            children: [
              Image.asset(
                VoidImages.vpn_blue,
                height: 30.h,
              ),
              SizedBox(width: 2.w),
            ],
          ),
          actions: [
            IconButton(
              icon: Icon(Icons.search, color: Colors.white),
              onPressed: () {
              },
            ),
            IconButton(
              icon: Icon(Icons.settings_suggest_outlined, color: Colors.white),
              onPressed: () {
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
                colors: [Colors.black, Theme.of(context).colorScheme.primary],
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
                  height: 400.h,
                  child: Stack(
                    children: [
                      Image.asset(
                        VoidImages.background3,
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
                        itemCount: 12,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              Get.toNamed('/series_view2');
                            },
                            child: Stack(
                              children: [
                                Column(
                                  children: [
                                    Expanded(
                                      child: Image.asset(
                                        VoidImages.sample,
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
                                    color: Theme.of(context).colorScheme.primary,
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
