import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../utils/constraints/image_strings.dart';
import '../controllers/time_format_controller.dart';

class TimeFormatView extends GetView<TimeFormatController> {
  const TimeFormatView({Key? key}) : super(key: key);

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
              'Settings',
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
              padding: EdgeInsets.all(16.0.w),
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.5),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Time Format',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 20.h),
                  _buildCheckboxItem('12 Hour'),
                  SizedBox(height: 20.h),
                  _buildCheckboxItem('24 Hour'),
                ],
              ),
            ),
          ),
          // Buttons
          Positioned(
            bottom: 10.h,
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
                    backgroundColor: Colors.black.withOpacity(0.4),
                    padding: EdgeInsets.symmetric(horizontal: 22.0.w, vertical: 10.0.h),
                    textStyle: TextStyle(fontSize: 9.sp),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.r),
                    ),
                  ),
                  child: Text(
                    'Back',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    // Handle save action
                  },
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(horizontal: 22.0.w, vertical: 10.0.h),
                    textStyle: TextStyle(fontSize: 9.sp),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.r),
                    ),
                  ),
                  child: Text(
                    'Save',
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

  Widget _buildCheckboxItem(String title) {
    bool isChecked = title == '12 Hour';
    return StatefulBuilder(
      builder: (BuildContext context, StateSetter setState) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Checkbox(
              value: isChecked,
              onChanged: (bool? value) {
                setState(() {
                  isChecked = value ?? false;
                });
              },
              checkColor: Colors.black,
              activeColor: Colors.white,
            ),
            SizedBox(width: 10.w),
            Text(
              title,
              style: TextStyle(color: Colors.white, fontSize: 9.sp),
            ),
          ],
        );
      },
    );
  }
}
