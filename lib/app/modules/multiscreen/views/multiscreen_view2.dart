import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../common/widgets/back_button_widget.dart';
import '../../../utils/constraints/colors.dart';
import '../../../utils/constraints/image_strings.dart';
import '../controllers/multiscreen_controller.dart'; // Import your color file

class MultiscreenView2 extends GetView<MultiscreenController> {
  const MultiscreenView2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {


    final List<String> categories = [
      'All', 'Favourites', 'T20 World cup', 'Sports', 'Cricket', 'BEIN sport', 'Sky sport', 'Others'
    ];

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
          title: Text('Live TV', style: TextStyle(color: Colors.white)),
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
          Center(
            child: GridView.builder(
              padding: EdgeInsets.all(16.w),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 8.w,
                mainAxisSpacing: 8.h,
                childAspectRatio: 4,
              ),
              itemCount: categories.length,
              itemBuilder: (context, index) {
                return Container(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  decoration: BoxDecoration(
                    color: Colors.grey,
                  ),
                  child: Row(
                    children: [
                      Icon(Icons.tv, color: Colors.white, size: 24.sp),
                      SizedBox(width: 8.w),
                      Text(
                        categories[index],
                        style: TextStyle(color: Colors.white, fontSize: 12.sp),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
