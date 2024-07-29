import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../routes/app_pages.dart';

import '../../../utils/constraints/image_strings.dart';
import '../controllers/parental_controller.dart';


class ParentalView extends GetView<ParentalController> {
  const ParentalView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {


    double boxWidth = 0.2.sw;
    double boxHeight = 0.7.sh;

    Future.delayed(Duration.zero, () => _showSetPinDialog(context, boxWidth, boxHeight));

    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [

          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Image.asset(
              VoidImages.background3,
              fit: BoxFit.cover,
            ),
          ),
          // Icon background image
          Positioned(
            bottom: 16.h,
            left: 30.w,
            right: 30.w,
            child: Image.asset(
              VoidImages.bg_icons,
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
      barrierDismissible: false,
      builder: (BuildContext context) {
        return Dialog(
          backgroundColor: Colors.transparent,
          child: Opacity(
            opacity: 0.7,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(10.r),
              ),
              padding: EdgeInsets.all(10.0.w),
              child: SingleChildScrollView(
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                    maxHeight: MediaQuery.of(context).size.height * 0.9,
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
                            fontSize: 10.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 8.h),
                        _buildTextField('Enter Pin'),
                        SizedBox(height: 18.h),
                        _buildTextField('Confirm Pin'),
                        SizedBox(height: 30.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            ElevatedButton(
                              onPressed: () {
                                Get.offNamed(Routes.HOME);
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.black.withOpacity(0.4),
                                padding: EdgeInsets.symmetric(horizontal: 10.0.w, vertical: 8.0.h),
                                textStyle: TextStyle(fontSize: 8.sp),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5.r),
                                ),
                              ),
                              child: Text('Skip'),
                            ),
                            ElevatedButton(
                              onPressed: () {
                                // Handle set action
                              },
                              style: ElevatedButton.styleFrom(
                                padding: EdgeInsets.symmetric(horizontal: 10.0.w, vertical: 8.0.h),
                                textStyle: TextStyle(fontSize: 8.sp),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5.r),
                                ),
                              ),
                              child: Text('Set'),
                            ),
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
          hintStyle: TextStyle(color: Colors.grey),
          filled: true,
          fillColor: Colors.white, // White background
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5.r),
            borderSide: BorderSide(color: Colors.white),
          ),
        ),
        style: TextStyle(color: Colors.black), // Black text color
      ),
    );
  }
}
