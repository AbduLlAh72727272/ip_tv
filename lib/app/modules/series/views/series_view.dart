import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ip_tv/app/modules/series/controllers/series_controller.dart';

import '../../../utils/constraints/image_strings.dart';

class SeriesView extends StatelessWidget {
  final SeriesController controller = Get.put(SeriesController());

  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    // Add listener to the scroll controller to load more series when reaching the end
    _scrollController.addListener(() {
      if (_scrollController.position.pixels == _scrollController.position.maxScrollExtent &&
          !controller.isFetchingMore.value &&
          !controller.allPagesLoaded.value) {
        controller.fetchNextPage();
      }
    });

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
            controller: _scrollController,
            child: Column(
              children: [
                Obx(() {
                  if (controller.isLoading.value && controller.series.isEmpty) {
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
                        FadeInImage.assetNetwork(
                          placeholder: VoidImages.placeholder, // Placeholder image
                          image: firstSeries.logo,
                          width: double.infinity,
                          height: double.infinity,
                          fit: BoxFit.cover,
                          imageErrorBuilder: (context, error, stackTrace) {
                            return Image.asset(VoidImages.placeholder, fit: BoxFit.cover);
                          },
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
                        if (controller.isLoading.value && controller.series.isEmpty) {
                          return Center(child: CircularProgressIndicator());
                        }

                        final seriesWithImages = controller.series.where((series) => series.logo.isNotEmpty == true).toList();
                        final seriesWithoutImages = controller.series.where((series) => series.logo.isEmpty == true || series.logo == null).toList();

                        final combinedSeries = [...seriesWithImages, ...seriesWithoutImages];

                        return Container(
                          height: 180.h,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: combinedSeries.length + 1,
                            itemBuilder: (context, index) {
                              if (index == combinedSeries.length) {
                                if (controller.allPagesLoaded.value) {
                                  return Center(child: Text('You have reached the end of the list'));
                                } else {
                                  return Center(child: CircularProgressIndicator());
                                }
                              }

                              final series = combinedSeries[index];

                              return GestureDetector(
                                onTap: () {
                                  Get.toNamed('/series_view2', arguments: series);
                                },
                                child: Container(
                                  margin: EdgeInsets.all(5.w),
                                  width: 120.w,
                                  child: Column(
                                    children: [
                                      Stack(
                                        children: [
                                          FadeInImage.assetNetwork(
                                            placeholder: VoidImages.logo, // Placeholder image
                                            image: series.logo,
                                            fit: BoxFit.cover,
                                            width: double.infinity,
                                            height: 140.h,
                                            imageErrorBuilder: (context, error, stackTrace) {
                                              return Image.asset(VoidImages.logo, fit: BoxFit.cover);
                                            },
                                          ),
                                        ],
                                      ),
                                      SizedBox(height: 1.h),
                                      Flexible(
                                        child: Text(
                                          series.name,
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 5.sp,
                                            fontWeight: FontWeight.bold,
                                          ),
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                        ),
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
