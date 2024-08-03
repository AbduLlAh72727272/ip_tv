import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../generated/locales.g.dart';
import '../../../utils/constraints/colors.dart';
import '../../../utils/constraints/image_strings.dart';
import '../controllers/stream_format_controller.dart';

class StreamFormatView extends GetView<StreamFormatController> {
  const StreamFormatView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
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
          // Settings title
          Positioned(
            top: 20.h,
            left: 25.w,
            child: Text(
              LocaleKeys.Settings.tr,
              style: TextStyle(
                color: Colors.white,
                fontSize: 10.sp,
              ),
            ),
          ),
          // Form content
          Center(
            child: Container(
              width: 300.w,
              height: 250.h,
              padding: EdgeInsets.all(16.0.w),
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.5),
              ),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      LocaleKeys.StreamFormat.tr,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    _buildCheckboxItem(LocaleKeys.Default.tr, context),
                    _buildCheckboxItem(LocaleKeys.MPEGTS.tr, context),
                    _buildCheckboxItem(LocaleKeys.Hsl.tr, context),
                  ],
                ),
              ),
            ),
          ),
          // Buttons
          Positioned(
            bottom: 2.h,
            left: MediaQuery.of(context).size.width / 4,
            right: MediaQuery.of(context).size.width / 4,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Get.back();
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white.withOpacity(0.4),
                    padding: EdgeInsets.symmetric(horizontal: 25.0.w, vertical: 16.0.h),
                    textStyle: TextStyle(fontSize: 7.sp),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.r),
                    ),
                  ),
                  child: Text(
                    LocaleKeys.Back.tr,
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    // Handle save action
                  },
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(horizontal: 25.0.w, vertical: 16.0.h),
                    textStyle: TextStyle(fontSize: 7.sp),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.r),
                    ),
                  ),
                  child: Text(
                    LocaleKeys.Save.tr,
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCheckboxItem(String title, BuildContext context) {
    return Obx(() {
      bool isChecked = controller.isSelected(title);
      return Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Checkbox(
            value: isChecked,
            onChanged: (bool? value) {
              if (value != null && value) {
                controller.setSelectedFormat(title);
              }
            },
            checkColor: Colors.white,
            activeColor: Theme.of(context).colorScheme.primary,
            side: MaterialStateBorderSide.resolveWith(
                  (states) => BorderSide(
                width: 1.5,
                color: isChecked ?  Theme.of(context).colorScheme.primary : Colors.white,
              ),
            ),
          ),
          SizedBox(width: 5.w),
          Text(
            title,
            style: TextStyle(color: Colors.white, fontSize: 9.sp),
          ),
        ],
      );
    });
  }
}
