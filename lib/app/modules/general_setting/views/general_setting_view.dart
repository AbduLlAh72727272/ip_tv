import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart'; // Import ScreenUtil
import '../../../../generated/locales.g.dart';
import '../controllers/general_setting_controller.dart';

class GeneralSettingView extends GetView<GeneralSettingController> {
  const GeneralSettingView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Initialize ScreenUtil
    //ScreenUtil.init(context, designSize: Size(360, 690), minTextAdapt: true, splitScreenMode: true);

    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          // Background image
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/image.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Settings title
          Positioned(
            top: 20.h, // Adjusted position using ScreenUtil
            left: 25.w, // Adjusted position using ScreenUtil
            child: Text(
              LocaleKeys.Settings.tr,
              style: TextStyle(
                color: Colors.white,
                fontSize: 10.sp, // Adjusted font size using ScreenUtil
              ),
            ),
          ),
          // Form content
          Center(
            child: Container(
              width: 300.w, // Adjusted width using ScreenUtil
              padding: EdgeInsets.all(16.0.w), // Adjusted padding using ScreenUtil
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.5),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    LocaleKeys.GeneralSettings.tr,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12.sp, // Adjusted font size using ScreenUtil
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 20.h), // Adjusted spacing using ScreenUtil
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          LocaleKeys.AutoPlay.tr,
                          style: TextStyle(color: Colors.white, fontSize: 9.sp), // Adjusted font size using ScreenUtil
                        ),
                      ),
                      Checkbox(
                        value: false,
                        onChanged: (value) {
                          // Handle checkbox change
                        },
                      ),
                    ],
                  ),
                  SizedBox(height: 5.h), // Adjusted spacing using ScreenUtil
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        LocaleKeys.ChangeTheme.tr,
                        style: TextStyle(color: Colors.white, fontSize: 9.sp), // Adjusted font size using ScreenUtil
                      ),
                      DropdownButton<String>(
                        dropdownColor: Colors.black,
                        value: null,
                        hint: Text(
                          LocaleKeys.ChangeTheme.tr,
                          style: TextStyle(color: Colors.white),
                        ),
                        icon: Icon(Icons.arrow_drop_down, color: Colors.white),
                        items: <String>[LocaleKeys.Light.tr, LocaleKeys.Dark.tr]
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
            bottom: 10.h, // Adjusted position using ScreenUtil
            left: MediaQuery.of(context).size.width / 4,
            right: MediaQuery.of(context).size.width / 4,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Get.back(); // Navigate back to previous screen
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black.withOpacity(0.4),
                    padding: EdgeInsets.symmetric(horizontal: 25.0.w, vertical: 16.0.h), // Adjusted padding using ScreenUtil
                    textStyle: TextStyle(fontSize: 7.sp), // Adjusted font size using ScreenUtil
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.r), // Adjusted border radius using ScreenUtil
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
                    // backgroundColor: Colors.red,
                    padding: EdgeInsets.symmetric(horizontal: 25.0.w, vertical: 16.0.h), // Adjusted padding using ScreenUtil
                    textStyle: TextStyle(fontSize: 7.sp), // Adjusted font size using ScreenUtil
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.r), // Adjusted border radius using ScreenUtil
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
}
