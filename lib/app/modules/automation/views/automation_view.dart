import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../generated/locales.g.dart';
import '../../../utils/constraints/image_strings.dart';
import '../controllers/automation_controller.dart';


class AutomationView extends GetView<AutomationController> {
  const AutomationView({Key? key}) : super(key: key);

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
              padding: EdgeInsets.all(16.0.w),
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.5),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    LocaleKeys.Automation.tr,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 20.h), // Adjusted spacing using ScreenUtil
                  _buildCheckboxItem(LocaleKeys.AutoUpdateAndMovie.tr),
                  SizedBox(height: 20.h), // Adjusted spacing using ScreenUtil
                  _buildCheckboxItemWithDropdown(LocaleKeys.AutoUpdateEpg.tr, LocaleKeys.Day.tr),
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
                    LocaleKeys.Back.tr,
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    // Handle save action
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    padding: EdgeInsets.symmetric(horizontal: 22.0.w, vertical: 10.0.h),
                    textStyle: TextStyle(fontSize: 9.sp),
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

  Widget _buildCheckboxItem(String title) {
    bool isChecked = title == LocaleKeys.AutoUpdateAndMovie.tr;
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
            SizedBox(width: 10.w), // Adjusted spacing using ScreenUtil
            Expanded(
              child: Text(
                title,
                style: TextStyle(color: Colors.white, fontSize: 9.sp), // Adjusted font size using ScreenUtil
              ),
            ),
          ],
        );
      },
    );
  }

  Widget _buildCheckboxItemWithDropdown(String title, String unit) {
    bool isChecked = false;
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
            SizedBox(width: 10.w), // Adjusted spacing using ScreenUtil
            SizedBox(
              width: 130.w,
              child: Text(
                title,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(color: Colors.white, fontSize: 9.sp), // Adjusted font size using ScreenUtil
              ),
            ),
            SizedBox(width: 10.w),
            DropdownButton<String>(
              dropdownColor: Colors.black,
              value: '1',
              icon: Icon(Icons.arrow_drop_down, color: Colors.white),
              items: <String>['1', '2', '3', '4', '5']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value, style: TextStyle(color: Colors.white)),
                );
              }).toList(),
              onChanged: (String? newValue) {
                // Handle dropdown change
              },
            ),
            SizedBox(width: 10.w),
            Text(
              unit,
              style: TextStyle(color: Colors.white, fontSize: 9.sp),
            ),
          ],
        );
      },
    );
  }
}
