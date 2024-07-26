import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart'; // Import ScreenUtil
import '../../../../generated/locales.g.dart';
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
                image: AssetImage('assets/images/image.png'), // Background image
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
                Get.back(); // Navigate to the previous screen
              },
              child: Image.asset(
                'assets/images/back_button.png',
                height: 36.h, // Adjusted size using ScreenUtil
                width: 36.w, // Adjusted size using ScreenUtil
              ),
            ),
          ),
          // Form content
          SafeArea(
            child: Center(
              child: SingleChildScrollView(
                child: Container(
                  width: 250.w, // Adjusted width using ScreenUtil
                  padding: EdgeInsets.all(16.0.w), // Padding using ScreenUtil
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.4),
                    borderRadius: BorderRadius.circular(10.r), // Border radius using ScreenUtil
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        // 'M3U playlist via URL',
                        LocaleKeys.MUPlaylist.tr,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 10.sp, // Font size using ScreenUtil
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 20.h), // Spacing using ScreenUtil
                      Row(
                        children: [
                          Expanded(child: _buildTextField(LocaleKeys.PlayListName.tr, playlistNameController)),
                          SizedBox(width: 10.w), // Spacing using ScreenUtil
                          Expanded(child: _buildTextField(LocaleKeys.PlayListUrl.tr, playlistUrlController)),
                        ],
                      ),
                      SizedBox(height: 20.h), // Spacing using ScreenUtil
                      Row(
                        children: [
                          Expanded(child: _buildTextField(LocaleKeys.UserName.tr, userNameController)),
                          SizedBox(width: 10.w), // Spacing using ScreenUtil
                          Expanded(child: _buildTextField(LocaleKeys.Password.tr, passwordController)),
                        ],
                      ),
                      SizedBox(height: 20.h), // Spacing using ScreenUtil
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
<<<<<<< HEAD
                        ElevatedButton(
                        onPressed: () {
                          Get.back();
                        },
                        style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black.withOpacity(0.4),
                        padding: EdgeInsets.symmetric(
                        horizontal: 8.0.w, // Padding using ScreenUtil
                        vertical: 6.0.h, // Padding using ScreenUtil
                        ),
                        textStyle: TextStyle(fontSize: 10.sp), // Font size using ScreenUtil
                        shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.r), // Border radius using ScreenUtil
                        ),
                        ),
                        child: Text(
                          LocaleKeys.Cancel.tr,
                        ),
                        ),

                          // _buildButton('Cancel', Colors.black.withOpacity(0.4), Colors.white, () {
                          //   Get.back(); // Navigate back without saving
                          // }),

=======
                          ElevatedButton(
                            onPressed: () {
                              Get.back();
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.black.withOpacity(0.4),
                              padding: EdgeInsets.symmetric(
                                horizontal: 8.0.w, // Padding using ScreenUtil
                                vertical: 6.0.h, // Padding using ScreenUtil
                              ),
                              textStyle: TextStyle(fontSize: 10.sp), // Font size using ScreenUtil
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.r), // Border radius using ScreenUtil
                              ),
                            ),
                            child: Text('Cancel'),
                          ),
>>>>>>> origin/master
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
                                horizontal: 8.0.w, // Padding using ScreenUtil
                                vertical: 6.0.h, // Padding using ScreenUtil
                              ),
                              textStyle: TextStyle(fontSize: 10.sp), // Font size using ScreenUtil
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.r), // Border radius using ScreenUtil
                              ),
                            ),
<<<<<<< HEAD
                            child: Text(
                              LocaleKeys.Save.tr,
                            ),
=======
                            child: Text('Save'),
>>>>>>> origin/master
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
        hintStyle: TextStyle(color: Colors.grey), // Grey hint text
        filled: true,
        fillColor: Colors.white, // White background
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.r), // Border radius using ScreenUtil
          borderSide: BorderSide(color: Colors.white),
        ),
      ),
      style: TextStyle(color: Colors.black), // Black text color
    );
  }
}
