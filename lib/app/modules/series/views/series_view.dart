import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ip_tv/app/modules/series/controllers/series_controller.dart';

import '../../../utils/constraints/image_strings.dart';

class SeriesView extends StatelessWidget {
  final SeriesController controller = Get.put(SeriesController());

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
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(Icons.settings_suggest_outlined, color: Colors.white),
              onPressed: () {},
            ),
          ],
        ),
      ),
      // extendBodyBehindAppBar: true,
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
                Obx(() {
                  if (controller.isLoading.value) {
                    return Container(
                      width: double.infinity,
                      height: 400.h,
                      child: Center(
                        child: CircularProgressIndicator(),
                      ),
                    );
                  }

                  if (controller.series.isEmpty) {
                    return Container(
                      width: double.infinity,
                      height: 400.h,
                      child: Center(
                        child: Text(
                          'No Series Available',
                          style: TextStyle(color: Colors.white, fontSize: 18.sp),
                        ),
                      ),
                    );
                  }

                  final firstSeries = controller.series.first;

                  return Container(
                    width: double.infinity,
                    height: 400.h,
                    child: Stack(
                      children: [
                        Image.network(
                          firstSeries.logo,
                          width: double.infinity,
                          height: double.infinity,
                          fit: BoxFit.cover,
                        ),
                        Positioned(
                          left: 16.w,
                          bottom: 16.h,
                          child: Text(
                            firstSeries.name,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 24.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                }),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.0.w),
                  child: Column(
                    children: [
                      SizedBox(height: 10.h),
                      Obx(() {
                        if (controller.isLoading.value) {
                          return Center(child: CircularProgressIndicator());
                        }

                        return Container(
                          height: 180.h,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: controller.series.length,
                            itemBuilder: (context, index) {
                              return GestureDetector(
                                onTap: () {
                                  Get.toNamed('/series_view2', arguments: controller.series[index]);
                                },
                                child: Container(
                                  margin: EdgeInsets.all(5.w),
                                  width: 120.w,
                                  height: 180.h,
                                  child: Stack(
                                    children: [
                                      Image.network(
                                        controller.series[index].logo,
                                        fit: BoxFit.cover,
                                        width: double.infinity,
                                        height: double.infinity,
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
                        );
                      }),
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
