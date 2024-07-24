import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart'; // Import ScreenUtil
import 'package:ip_tv/app/modules/home/views/home_screen_wrapper.dart';
import '../../home/views/home_view.dart';
import '../controllers/parental_controller.dart';

class ParentalView extends GetView<ParentalController> {
  const ParentalView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Initialize ScreenUtil
    ScreenUtil.init(context, designSize: Size(360, 690), minTextAdapt: true, splitScreenMode: true);

    // Calculate the responsive size of the box using ScreenUtil
    double boxWidth = 0.2.sw; // 50% of screen width
    double boxHeight = 0.7.sh; // 70% of screen height

    Future.delayed(Duration.zero, () => _showSetPinDialog(context, boxWidth, boxHeight));

    return Scaffold(
      backgroundColor: Colors.black, // Set the whole screen background color to black
      body: Stack(
        children: [
          // Top background image
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Image.asset(
              'assets/images/bg3.png', // Top background image
              fit: BoxFit.cover,
            ),
          ),
          // Icon background image
          Positioned(
            bottom: 16.h,
            left: 30.w,
            right: 30.w,
            child: Image.asset(
              'assets/images/bg_icons.png', // Icons background image
              fit: BoxFit.contain,
            ),
          ),
        ],
      ),
    );
  }

  void _showSetPinDialog(BuildContext context, double boxWidth, double boxHeight) {
    showDialog(
      context: context,
      barrierDismissible: false, // Prevents dialog from being dismissed by tapping outside
      builder: (BuildContext context) {
        return Dialog(
          backgroundColor: Colors.transparent,
          child: Opacity(
            opacity: 0.7, // Set the opacity of the dialog
            child: Container(
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(10.r),
              ),
              padding: EdgeInsets.all(10.0.w), // Padding using ScreenUtil
              child: SingleChildScrollView(
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                    maxHeight: MediaQuery.of(context).size.height * 0.9, // Maximum height for dialog
                  ),
                  child: IntrinsicHeight(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Set Pin',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 10.sp, // Font size using ScreenUtil
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 8.h), // Spacing using ScreenUtil
                        _buildTextField('Enter Pin'),
                        SizedBox(height: 18.h), // Spacing using ScreenUtil
                        _buildTextField('Confirm Pin'),
                        SizedBox(height: 30.h), // Spacing using ScreenUtil
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                          ElevatedButton(
                          onPressed: () {
                            Get.to(() => HomeScreenWrapper());
                  },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.black.withOpacity(0.4),
                            padding: EdgeInsets.symmetric(horizontal: 10.0.w, vertical: 8.0.h), // Padding using ScreenUtil
                            textStyle: TextStyle(fontSize: 8.sp), // Font size using ScreenUtil
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5.r), // Border radius using ScreenUtil
                            ),
                          ),
                          child: Text(
                            'Skip',
                            // style: TextStyle(color: textColor),
                          ),
                        ),
                            //
                            // _buildButton('Skip', Colors.black.withOpacity(0.4), () {
                            //   // Get.to(() => HomeView()); // Navigate to HomeView
                            //   Get.to(() => HomeScreenWrapper());
                            // }),

                            ElevatedButton(
                              onPressed: () {

                              },
                              style: ElevatedButton.styleFrom(
                                padding: EdgeInsets.symmetric(horizontal: 10.0.w, vertical: 8.0.h), // Padding using ScreenUtil
                                textStyle: TextStyle(fontSize: 8.sp), // Font size using ScreenUtil
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5.r), // Border radius using ScreenUtil
                                ),
                              ),
                              child: Text(
                                'Set',
                                // style: TextStyle(color: textColor),
                              ),
                            ),
                            // _buildButton('Set', Colors.red, () {
                            //   // Handle set action
                            // }),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildTextField(String hint) {
    return Container(
      width: double.infinity,
      child: TextField(
        decoration: InputDecoration(
          hintText: hint,
          hintStyle: TextStyle(color: Colors.grey), // Grey hint text
          filled: true,
          fillColor: Colors.white, // White background
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5.r), // Border radius using ScreenUtil
            borderSide: BorderSide(color: Colors.white),
          ),
        ),
        style: TextStyle(color: Colors.black), // Black text color
      ),
    );
  }

  // Widget _buildButton(String text, Color? bgColor, VoidCallback onPressed) {
  //   return ElevatedButton(
  //     onPressed: onPressed,
  //     style: ElevatedButton.styleFrom(
  //       backgroundColor: bgColor,
  //       padding: EdgeInsets.symmetric(horizontal: 10.0.w, vertical: 8.0.h), // Padding using ScreenUtil
  //       // textStyle: TextStyle(fontSize: 8.sp), // Font size using ScreenUtil
  //       shape: RoundedRectangleBorder(
  //         borderRadius: BorderRadius.circular(5.r), // Border radius using ScreenUtil
  //       ),
  //     ),
  //     child: Text(
  //       text,
  //       // style: TextStyle(color: textColor),
  //     ),
  //   );
  // }
}
