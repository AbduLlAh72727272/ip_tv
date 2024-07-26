import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../utils/constraints/colors.dart';
import '../controllers/multiscreen_controller.dart'; // Import your color file

class MultiscreenView2 extends GetView<MultiscreenController> {
  const MultiscreenView2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Initialize ScreenUtil
    ScreenUtil.init(context, designSize: Size(360, 690), minTextAdapt: true, splitScreenMode: true);

    final List<String> categories = [
      'All', 'Favourites', 'T20 World cup', 'Sports', 'Cricket', 'BEIN sport', 'Sky sport', 'Others'
    ];

    return Scaffold(
      backgroundColor: VoidColors.black,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(40.h), // Decrease the height of the AppBar
        child: AppBar(
          backgroundColor: VoidColors.black, // Set app bar color to black
          automaticallyImplyLeading: false, // Remove the default back button
          leading: IconButton(
            icon: Image.asset('assets/images/back_button.png'), // Custom back button
            onPressed: () {
              Get.back(); // Navigate back
            },
          ),
          title: Text('Live TV', style: TextStyle(color: Colors.white)),
          actions: [
            IconButton(
              icon: Icon(Icons.search, color: Colors.white),
              onPressed: () {
                // Add search functionality here
              },
            ),
            IconButton(
              icon: Icon(Icons.settings_suggest_outlined, color: Colors.white),
              onPressed: () {
                // Add settings functionality here
              },
            ),
          ],
        ),
      ),
      body: Stack(
        children: [
          // Gradient background
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [VoidColors.black, VoidColors.primary],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),
          // Category grid
          Center(
            child: GridView.builder(
              padding: EdgeInsets.all(16.w), // Adjust padding using ScreenUtil
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 8.w, // Adjust spacing using ScreenUtil
                mainAxisSpacing: 8.h, // Adjust spacing using ScreenUtil
                childAspectRatio: 4, // Adjust aspect ratio to make boxes rectangular
              ),
              itemCount: categories.length, // Number of categories
              itemBuilder: (context, index) {
                return Container(
                  padding: EdgeInsets.symmetric(horizontal: 16.w), // Add horizontal padding
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    // borderRadius: BorderRadius.circular(10.r), // Adjust border radius using ScreenUtil
                  ),
                  child: Row(
                    children: [
                      Icon(Icons.tv, color: Colors.white, size: 24.sp), // Adjust icon size using ScreenUtil
                      SizedBox(width: 8.w),
                      Text(
                        categories[index],
                        style: TextStyle(color: Colors.white, fontSize: 12.sp), // Adjust text size using ScreenUtil
                      ),
                    ],
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
