import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart'; // Import ScreenUtil
import '../../../utils/constraints/image_strings.dart';
import '../controllers/m3_u_playlist_controller.dart';

class M3UPlaylistView extends GetView<M3UPlaylistController> {
  const M3UPlaylistView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController playlistNameController = TextEditingController();
    TextEditingController playlistUrlController = TextEditingController();
    TextEditingController userNameController = TextEditingController();
    TextEditingController passwordController = TextEditingController();

    return Scaffold(
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
            top: 16.h,
            left: 16.w,
            child: GestureDetector(
              onTap: () {
                Get.back();
              },
              child: Image.asset(
               VoidImages.back,
                height: 36.h,
                width: 36.w,
              ),
            ),
          ),
          // Form content
          SafeArea(
            child: Center(
              child: SingleChildScrollView(
                child: Container(
                  width: 250.w,
                  padding: EdgeInsets.all(16.0.w),
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.4),
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'M3U playlist via URL',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 10.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 20.h),
                      Row(
                        children: [
                          Expanded(child: _buildTextField('Playlist name', playlistNameController)),
                          SizedBox(width: 10.w), // Spacing using ScreenUtil
                          Expanded(child: _buildTextField('Playlist URL', playlistUrlController)),
                        ],
                      ),
                      SizedBox(height: 20.h),
                      Row(
                        children: [
                          Expanded(child: _buildTextField('User name', userNameController)),
                          SizedBox(width: 10.w),
                          Expanded(child: _buildTextField('Password', passwordController)),
                        ],
                      ),
                      SizedBox(height: 20.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          ElevatedButton(
                            onPressed: () {
                              Get.back();
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.black.withOpacity(0.4),
                              padding: EdgeInsets.symmetric(
                                horizontal: 8.0.w,
                                vertical: 6.0.h,
                              ),
                              textStyle: TextStyle(fontSize: 10.sp),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.r),
                              ),
                            ),
                            child: Text('Cancel'),
                          ),
                          ElevatedButton(
                            onPressed: () {
                              Get.back(result: {
                                'playlistName': playlistNameController.text,
                                'playlistUrl': playlistUrlController.text,
                                'userName': userNameController.text,
                                'password': passwordController.text,
                              });
                            },
                            style: ElevatedButton.styleFrom(
                              padding: EdgeInsets.symmetric(
                                horizontal: 8.0.w,
                                vertical: 6.0.h,
                              ),
                              textStyle: TextStyle(fontSize: 10.sp),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.r),
                              ),
                            ),
                            child: Text('Save'),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTextField(String hint, TextEditingController controller) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: TextStyle(color: Colors.grey),
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.r),
          borderSide: BorderSide(color: Colors.white),
        ),
      ),
      style: TextStyle(color: Colors.black),
    );
  }
}
