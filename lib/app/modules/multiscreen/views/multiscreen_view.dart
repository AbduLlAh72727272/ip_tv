import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../utils/constraints/image_strings.dart';
import '../controllers/multiscreen_controller.dart';
import 'multiscreen_view2.dart';

class MultiscreenView extends GetView<MultiscreenController> {
  const MultiscreenView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(40.h),
        child: AppBar(
          backgroundColor: Colors.black,
          automaticallyImplyLeading: false,
          leading: IconButton(
            icon: Image.asset(VoidImages.back),
            onPressed: () {
              Get.back(); // Navigate back
            },
          ),
          title: Text('Multi Screen Layout', style: TextStyle(color: Colors.white)),
        ),
      ),
      body: Stack(
        children: [
          // Gradient background
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.black, Theme.of(context).colorScheme.primary],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),
          // Multi-screen grid
          Center(
            child: GridView.builder(
              padding: EdgeInsets.all(16.w),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 16.w,
                mainAxisSpacing: 16.h,
                childAspectRatio: 2,
              ),
              itemCount: 4,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    Get.to(() => MultiscreenView2());
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.primary,
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                    child: Center(
                      child: Icon(Icons.add_circle, color: Colors.white, size: 50.sp),
                    ),
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
