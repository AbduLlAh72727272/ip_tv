import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ip_tv/generated/locales.g.dart';
import '../../../common/widgets/back_button_widget.dart';
import '../../../utils/constraints/colors.dart';
import '../../../utils/constraints/image_strings.dart';
import '../../live_TV/controllers/live_t_v_controller.dart';
import '../controllers/multiscreen_controller.dart'; // Import your color file

class MultiscreenView2 extends GetView<MultiscreenController> {
  final int initialIndex;
  const MultiscreenView2({super.key, required this.initialIndex});

  @override
  Widget build(BuildContext context) {


    final List<String> categories = [
      'All', 'Favourites', 'T20 World cup', 'Sports', 'Cricket', 'BEIN sport', 'Sky sport', 'Others'
    ];
    final LiveTVController liveTVController = Get.put(LiveTVController());

    return Scaffold(
      backgroundColor: VoidColors.blackColor,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(40.h),
        child: AppBar(
          backgroundColor: VoidColors.blackColor,
          automaticallyImplyLeading: false,
          leading: const BackButtonWidget(),
          // IconButton(
          //   icon: Image.asset(VoidImages.back),
          //   onPressed: () {
          //     Get.back();
          //   },
          // ),
          title: Text(LocaleKeys.LiveTv.tr, style: TextStyle(color: VoidColors.whiteColor)),
          actions: [
            IconButton(
              icon: Icon(Icons.search, color: VoidColors.whiteColor),
              onPressed: () {

              },
            ),
            IconButton(
              icon: Icon(Icons.settings_suggest_outlined, color: VoidColors.whiteColor),
              onPressed: () {
              },
            ),
          ],
        ),
      ),
      body: Stack(
        children: [
          // Gradient background
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [VoidColors.blackColor, Theme.of(context).colorScheme.primary],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),
          // Category grid
          Obx(() {
            if (liveTVController.isLoading.value &&
                liveTVController.entries.isEmpty) {
              return Center(child: CircularProgressIndicator());
            }
            return NotificationListener<ScrollNotification>(
              onNotification: (scrollInfo) {
                if (scrollInfo.metrics.pixels == scrollInfo.metrics.maxScrollExtent &&
                    !liveTVController.isFetchingMore.value &&
                    !liveTVController.allPagesLoaded.value) {
                  liveTVController.fetchNextPage();
                }
                return false;
              },
              child: Center(
                child: GridView.builder(
                  padding: EdgeInsets.all(16.w),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 8.w,
                    mainAxisSpacing: 8.h,
                    childAspectRatio: 6,
                  ),
                  // itemCount: categories.length,
                  itemCount: liveTVController.entries.length,
                  itemBuilder: (context, index) {
                    final channel = liveTVController.entries[index];
                    return GestureDetector(
                      onTap: () {
                        // controller.addUrl(channel.url);
                        Get.back(result: channel.url);
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 14.w),
                        decoration: BoxDecoration(
                          color: VoidColors.darkGreyColor,
                        ),
                        child: Row(
                          children: [
                            Icon(Icons.tv, color: VoidColors.whiteColor, size: 15.sp),
                            SizedBox(width: 8.w),
                            SizedBox(
                              width: 85.w,
                              child: Text(
                                // categories[index],
                                  channel.displayName,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                    color: VoidColors.whiteColor, fontSize: 9.sp),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            );
          }
          ),
        ],
      ),
    );
  }
}
