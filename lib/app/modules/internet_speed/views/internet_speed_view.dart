import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart'; // Import ScreenUtil
import '../controllers/internet_speed_controller.dart';

class InternetSpeedView extends StatelessWidget {
  final InternetSpeedController controller = Get.put(InternetSpeedController());

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
          // Back button
          Positioned(
            top: 20.h, // Adjusted position using ScreenUtil
            left: 10.w, // Adjusted position using ScreenUtil
            child: GestureDetector(
              onTap: () {
                Get.back(); // Navigate to the previous screen
              },
              child: Image.asset(
                'assets/images/back_button.png',
                height: 34.h, // Adjusted size using ScreenUtil
                width: 24.w, // Adjusted size using ScreenUtil
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
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'Internet Speed Test',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 10.sp, // Adjusted font size using ScreenUtil
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 20.h), // Adjusted spacing using ScreenUtil
                    // Speedometer image
                    Image.asset(
                      'assets/images/speedometer.png', // Replace with your speedometer image
                      height: 120.h, // Adjusted size using ScreenUtil
                    ),
                    SizedBox(height: 20.h), // Adjusted spacing using ScreenUtil
                    // Speed text
                    Obx(() {
                      return Text(
                        '${controller.speed.value} Mbps',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 9.sp, // Adjusted font size using ScreenUtil
                          fontWeight: FontWeight.bold,
                        ),
                      );
                    }),
                    SizedBox(height: 20.h), // Adjusted spacing using ScreenUtil
                    ElevatedButton(
                      onPressed: () {
                        // Handle OK action
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
                        'OK',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
