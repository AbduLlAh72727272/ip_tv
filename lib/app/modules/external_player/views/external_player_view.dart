import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart'; // Import ScreenUtil
import '../controllers/external_player_controller.dart';

class ExternalPlayerView extends GetView<ExternalPlayerController> {
  const ExternalPlayerView({Key? key}) : super(key: key);

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
          // Form content
          Center(
            child: Container(
              width: 300.w, // Adjusted width using ScreenUtil
              padding: EdgeInsets.all(16.0.w), // Adjusted padding using ScreenUtil
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.5),
                borderRadius: BorderRadius.circular(10.r), // Adjusted border radius using ScreenUtil
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Select External Players',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 10.sp, // Adjusted font size using ScreenUtil
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8.h), // Adjusted spacing using ScreenUtil
                  _buildRadioItem('Default'),
                  SizedBox(height: 8.h), // Adjusted spacing using ScreenUtil
                  _buildRadioItem('Vlc Player'),
                  SizedBox(height: 8.h), // Adjusted spacing using ScreenUtil
                  _buildRadioItem('MX Player'),
                ],
              ),
            ),
          ),
          // Buttons
          Positioned(
            bottom: 50.h, // Adjusted position using ScreenUtil
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
                    padding: EdgeInsets.symmetric(horizontal: 22.0.w, vertical: 9.0.h), // Adjusted padding using ScreenUtil
                    textStyle: TextStyle(fontSize: 9.sp), // Adjusted font size using ScreenUtil
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.r), // Adjusted border radius using ScreenUtil
                    ),
                  ),
                  child: Text(
                    'Cancel',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    // Handle OK action
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    padding: EdgeInsets.symmetric(horizontal: 22.0.w, vertical: 9.0.h), // Adjusted padding using ScreenUtil
                    textStyle: TextStyle(fontSize: 9.sp), // Adjusted font size using ScreenUtil
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.r), // Adjusted border radius using ScreenUtil
                    ),
                  ),
                  child: Text(
                    'OK',
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

  Widget _buildRadioItem(String title) {
    final controller = Get.put(ExternalPlayerController());
    return Obx(() {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(color: Colors.white, fontSize: 9.sp), // Adjusted font size using ScreenUtil
          ),
          Radio<String>(
            value: title,
            groupValue: controller.selectedPlayer.value,
            onChanged: (String? value) {
              controller.selectedPlayer.value = value!;
            },
            activeColor: Colors.red,
            fillColor: MaterialStateProperty.resolveWith<Color>((Set<MaterialState> states) {
              return states.contains(MaterialState.selected) ? Colors.red : Colors.white;
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
