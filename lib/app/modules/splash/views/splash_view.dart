import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../routes/app_pages.dart';
import '../../../utils/constraints/image_strings.dart';
import '../../login/views/login_view.dart';
import '../controllers/splash_controller.dart';


class SplashView extends StatelessWidget {
  final SplashController controller = Get.put(SplashController());

  SplashView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {


    Future.delayed(Duration(seconds: 3), () {
      Get.offNamed(Routes.LOGIN);
    });

    return Scaffold(
      body: Stack(
        children: [
          // Background image
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(VoidImages.background1),
                fit: BoxFit.cover,
              ),
            ),
          ),

          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Logo
                Image.asset(
                 VoidImages.logo,
                  height: 150.h,
                ),
                SizedBox(height: 20.h),

                CustomCircularProgressIndicator(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class CustomCircularProgressIndicator extends StatefulWidget {
  @override
  _CustomCircularProgressIndicatorState createState() =>
      _CustomCircularProgressIndicatorState();
}

class _CustomCircularProgressIndicatorState
    extends State<CustomCircularProgressIndicator>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller =
    AnimationController(vsync: this, duration: const Duration(seconds: 2))
      ..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 20.w,
      height: 20.h,
      child: AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          return CustomPaint(
            painter: _CircularProgressPainter(_controller.value,
                Theme.of(context).colorScheme.primary),
          );
        },
      ),
    );
  }
}

class _CircularProgressPainter extends CustomPainter {
  final double progress;
  final Color color;

  _CircularProgressPainter(this.progress, this.color);

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;

    final double radius = size.width / 2;
    final double dotRadius = radius / 6;

    for (int i = 0; i < 12; i++) {
      final double angle = (i * 30 + (progress * 360)) * math.pi / 180;
      final double x = radius + radius * 0.8 * math.cos(angle);
      final double y = radius + radius * 0.8 * math.sin(angle);
      canvas.drawCircle(Offset(x, y), dotRadius, paint);
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
