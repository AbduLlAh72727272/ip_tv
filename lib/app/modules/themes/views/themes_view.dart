import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../utils/constraints/colors.dart';
import '../../../utils/constraints/image_strings.dart';
import '../../../utils/theme/custom_themes/theme.dart';
import '../../home/controllers/home_controller.dart';
import '../controllers/themes_controller.dart';

class ThemesView extends GetView<ThemesController> {
  const ThemesView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final HomeController homeController = Get.find<HomeController>();

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
          // Form content
          Center(
            child: Container(
              width: 300.w,
              padding: EdgeInsets.all(16.0.w),
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.5),
                borderRadius: BorderRadius.circular(10.r),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Select Theme Colour',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 10.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 20.h),
                  Wrap(
                    spacing: 8.w,
                    runSpacing: 8.h,
                    children: [
                      _buildColorOption(VoidColors.primary, primaryTheme),
                      _buildColorOption(VoidColors.greyColor, greyTheme),
                      _buildColorOption(VoidColors.redColor, redTheme),
                      _buildColorOption(VoidColors.orangeColor, orangeTheme),
                      _buildColorOption(VoidColors.yellowColor, yellowTheme),
                      _buildColorOption(VoidColors.purpleColor, purpleTheme),
                      _buildColorOption(VoidColors.blueColor, blueTheme),
                      _buildColorOption(VoidColors.cyanColor, cyanTheme),
                      _buildColorOption(VoidColors.lightGreen, lightGreenTheme),
                      _buildColorOption(VoidColors.parrotColor, parrotTheme),
                    ],
                  ),
                ],
              ),
            ),
          ),
          // Buttons
          Positioned(
            bottom: 10.h, // Adjusted position using ScreenUtil
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
                    homeController.switchGlobalTheme(homeController.selectedColorTheme.value);
                    Get.back();
                  },
                  style: ElevatedButton.styleFrom(
                    // backgroundColor: Colors.red,
                    padding: EdgeInsets.symmetric(horizontal: 22.0.w, vertical: 10.0.h), // Adjusted padding using ScreenUtil
                    textStyle: TextStyle(fontSize: 9.sp), // Adjusted font size using ScreenUtil
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.r), // Adjusted border radius using ScreenUtil
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

  Widget _buildColorOption(Color color, AppColorTheme colorTheme) {
    bool isSelected = false;
    final HomeController homeController = Get.find<HomeController>();
    return StatefulBuilder(
      builder: (BuildContext context, StateSetter setState) {
        return Obx(() {
          bool isSelected = homeController.selectedColorTheme.value ==
              colorTheme;
          return GestureDetector(
            onTap: () {
              setState(() {
                isSelected = !isSelected;
                homeController.selectedColorTheme.value = colorTheme;
              });
            },
            child: Container(
              width: 20.w,
              height: 40.h,
              decoration: BoxDecoration(
                color: color,
                shape: BoxShape.rectangle,

                border: isSelected
                    ? Border.all(color: Colors.white, width: 3.w)
                    : null,
              ),
              child: isSelected
                  ? Icon(Icons.check, color: Colors.white,
                  size: 30.w)
                  : null,
            ),
          );
        }
        );
      },
    );
  }
}
