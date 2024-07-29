import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../generated/locales.g.dart';
import '../../../utils/constraints/image_strings.dart';


class ExternalPlayerView extends GetView<ExternalPlayerController> {
  const ExternalPlayerView({Key? key}) : super(key: key);

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
                children: [
                  Text(
                    LocaleKeys.SelectExternalPlayer.tr,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 10.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8.h), // Adjusted spacing using ScreenUtil
                  _buildRadioItem(LocaleKeys.Default.tr, context),
                  SizedBox(height: 8.h), // Adjusted spacing using ScreenUtil
                  _buildRadioItem(LocaleKeys.VlcPlayer.tr, context),
                  SizedBox(height: 8.h), // Adjusted spacing using ScreenUtil
                  _buildRadioItem(LocaleKeys.MxPlayer.tr, context),
                ],
              ),
            ),
          ),
          // Buttons
          Positioned(
            bottom: 50.h,
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
                    padding: EdgeInsets.symmetric(horizontal: 22.0.w, vertical: 9.0.h),
                    textStyle: TextStyle(fontSize: 9.sp),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.r),
                    ),
                  ),
                  child: Text(
                    LocaleKeys.Cancel.tr,
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      // Handle OK action
                    },
                    style: ElevatedButton.styleFrom(
                      // backgroundColor: Colors.red,
                      padding: EdgeInsets.symmetric(horizontal: 22.0.w, vertical: 9.0.h), // Adjusted padding using ScreenUtil
                      textStyle: TextStyle(fontSize: 9.sp), // Adjusted font size using ScreenUtil
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.r), // Adjusted border radius using ScreenUtil
                      ),
                    ),
                    child: Text(
                      LocaleKeys.Ok.tr,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(color: Colors.white),
    ),
    ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRadioItem(String title, BuildContext context) {
    final controller = Get.put(ExternalPlayerController());
    return Obx(() {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(color: Colors.white, fontSize: 9.sp),
          ),
          Radio<String>(
            value: title,
            groupValue: controller.selectedPlayer.value,
            onChanged: (String? value) {
              controller.selectedPlayer.value = value!;
            },
            activeColor: Theme.of(context).colorScheme.secondary,
            fillColor: MaterialStateProperty.resolveWith<Color>((Set<MaterialState> states) {
              return states.contains(MaterialState.selected) ? Theme.of(context).colorScheme.secondary : Colors.white;
            }),
          ),
        ],
      );
    });
  }
}

class ExternalPlayerController extends GetxController {
  var selectedPlayer = 'MX Player'.obs;
}
