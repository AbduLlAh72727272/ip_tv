import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../generated/locales.g.dart';
import '../../../routes/app_pages.dart';
import '../../Movies/controllers/movies_controller.dart';
import '../../playlist/views/playlist_view.dart';
import '../../../utils/constraints/colors.dart';
import '../../../utils/theme/custom_themes/theme.dart';
//import 'app_pages.dart'; // Import the routes

class LoginView extends StatelessWidget {
  LoginView({Key? key}) : super(key: key);

  final TextEditingController macAddressController = TextEditingController();
  final TextEditingController pinController = TextEditingController();
  final MoviesController moviesController = Get.put(MoviesController());

  @override
  Widget build(BuildContext context) {
    // Initialize ScreenUtil
    ScreenUtil.init(context, designSize: Size(360, 690), minTextAdapt: true, splitScreenMode: true);

    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          // Background image
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/image.png'), // Ensure the correct image path
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Form content
          Center(
            child: Container(
              width: 200.w, // Adjusted width using ScreenUtil
              padding: EdgeInsets.all(16.0.w), // Adjusted padding using ScreenUtil
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.5),
                borderRadius: BorderRadius.circular(10.r), // Adjusted border radius using ScreenUtil
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextField(
                    controller: macAddressController,
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      labelText: 'Mac Address',
                      labelStyle: TextStyle(color: Colors.white),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      ),
                    ),
                  ),
                  SizedBox(height: 20.h), // Adjusted spacing using ScreenUtil
                  TextField(
                    controller: pinController,
                    style: const TextStyle(color: Colors.white),
                    decoration: const InputDecoration(
                      labelText: 'Pin',
                      labelStyle: TextStyle(color: Colors.white),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      ),
                    ),
                  ),
                  SizedBox(height: 20.h), // Adjusted spacing using ScreenUtil
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                        onPressed: () {
                          // // Navigate to PlaylistView using named route
                          Get.offNamed(Routes.PLAYLIST);
                          // print('Movie');
                          // moviesController.fetchMovieLists();
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: VoidColors.primary,
                          padding: EdgeInsets.symmetric(vertical: 15.h),
                          textStyle: TextStyle(fontSize: 8.sp),
                        ),
                        child: Text(
                           LocaleKeys.AddPlaylist.tr,
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
