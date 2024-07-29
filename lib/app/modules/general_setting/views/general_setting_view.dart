import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../utils/constraints/image_strings.dart';
import '../controllers/general_setting_controller.dart';

class GeneralSettingView extends GetView<GeneralSettingController> {
  const GeneralSettingView({Key? key}) : super(key: key);

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
                    'General Settings',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 20.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Autoplay Next Episode in 30s',
                        style: TextStyle(color: Colors.white, fontSize: 9.sp),
                      ),
                      Checkbox(
                        value: false,
                        onChanged: (value) {
                          // Handle checkbox change
                        },
                      ),
                    ],
                  ),
                  SizedBox(height: 5.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Change Theme',
                        style: TextStyle(color: Colors.white, fontSize: 9.sp),
                      ),
                      DropdownButton<String>(
                        dropdownColor: Colors.black,
                        value: null,
                        hint: Text(
                          'Select Theme',
                          style: TextStyle(color: Colors.white),
                        ),
                        icon: Icon(Icons.arrow_drop_down, color: Colors.white),
                        items: <String>['Light', 'Dark']
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
                    ],
                  ),
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
                    padding: EdgeInsets.symmetric(horizontal: 25.0.w, vertical: 16.0.h),
                    textStyle: TextStyle(fontSize: 7.sp),
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
                    // backgroundColor: Colors.red,
                    padding: EdgeInsets.symmetric(horizontal: 25.0.w, vertical: 16.0.h),
                    textStyle: TextStyle(fontSize: 7.sp),
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
}
