import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

import '../../../../generated/locales.g.dart';
import '../../../utils/constraints/image_strings.dart';
import '../controllers/internet_speed_controller.dart';



class InternetSpeedView extends StatelessWidget {
  final InternetSpeedController controller = Get.put(InternetSpeedController());

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
          // Back button
          Positioned(
            top: 20.h,
            left: 10.w,
            child: GestureDetector(
              onTap: () {
                Get.back();
              },
              child: Image.asset(
                VoidImages.back,
                height: 34.h,
                width: 24.w,
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
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      LocaleKeys.InternetSpeedTest.tr,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 10.h),
                    // Real Speedometer
                    Obx(() {
                      return SizedBox(
                        height: 200.h,
                        child: SfRadialGauge(
                          axes: <RadialAxis>[
                            RadialAxis(
                              minimum: 0,
                              maximum: 100,
                              ranges: <GaugeRange>[
                                GaugeRange(
                                  startValue: 0,
                                  endValue: 50,
                                  color: Colors.green,
                                ),
                                GaugeRange(
                                  startValue: 50,
                                  endValue: 80,
                                  color: Colors.orange,
                                ),
                                GaugeRange(
                                  startValue: 80,
                                  endValue: 100,
                                  color: Colors.red,
                                ),
                              ],
                              pointers: <GaugePointer>[
                                NeedlePointer(
                                  value: controller.speed.value,
                                  enableAnimation: true,
                                  needleColor: Theme.of(context).colorScheme.primary,
                                ),
                              ],
                              annotations: <GaugeAnnotation>[
                                GaugeAnnotation(
                                  widget: Container(
                                    child: Text(
                                      '${controller.speed.value.toStringAsFixed(2)} Mbps',
                                      style: TextStyle(
                                        fontSize: 9.sp,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  angle: 90,
                                  positionFactor: 0.5,
                                ),
                              ],
                            ),
                          ],
                        ),
                      );
                    }),
                    SizedBox(height: 10.h),
                    ElevatedButton(
                      onPressed: () {
                        controller.testInternetSpeed();
                      },
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.symmetric(horizontal: 15.0.w, vertical: 5.0.h),
                        textStyle: TextStyle(fontSize: 10.sp),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.r),
                        ),
                      ),
                      child: Text(
                        LocaleKeys.Ok.tr,
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
