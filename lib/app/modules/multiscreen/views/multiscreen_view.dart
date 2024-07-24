import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../utils/constraints/colors.dart';
import '../controllers/multiscreen_controller.dart'; // Import your color file
import 'multiscreen_view2.dart'; // Import MultiscreenView2

class MultiscreenView extends GetView<MultiscreenController> {
  const MultiscreenView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Initialize ScreenUtil
    ScreenUtil.init(context, designSize: Size(360, 690), minTextAdapt: true, splitScreenMode: true);

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(40.h), // Decrease the height of the AppBar
        child: AppBar(
          backgroundColor: Colors.black, // Set app bar color to black
          automaticallyImplyLeading: false, // Remove the default back button
          leading: IconButton(
            icon: Image.asset('assets/images/back_button.png'), // Custom back button
            onPressed: () {
              Get.back(); // Navigate back
            },
          ),
          title: Text('Multi Screen Layout', style: TextStyle(color: Colors.white)),
        ),
      ),
      body: Stack(
        children: [
          // Gradient background
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.black, VoidColors.primary],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),
          // Multi-screen grid
          Center(
            child: GridView.builder(
              padding: EdgeInsets.all(16.w), // Adjust padding using ScreenUtil
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 16.w, // Adjust spacing using ScreenUtil
                mainAxisSpacing: 16.h, // Adjust spacing using ScreenUtil
                childAspectRatio: 2, // Adjust aspect ratio to make boxes rectangular
              ),
              itemCount: 4, // Number of screens
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    Get.to(() => MultiscreenView2()); // Navigate to MultiscreenView2
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: VoidColors.primary,
                      borderRadius: BorderRadius.circular(10.r), // Adjust border radius using ScreenUtil
                    ),
                    child: Center(
                      child: Icon(Icons.add_circle, color: Colors.white, size: 50.sp), // Adjust icon size using ScreenUtil
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
