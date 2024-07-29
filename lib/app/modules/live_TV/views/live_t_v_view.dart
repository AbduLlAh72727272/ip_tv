import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../utils/constraints/image_strings.dart';
import '../controllers/live_t_v_controller.dart';
import 'live_t_v_view2.dart';

class LiveTVView extends GetView<LiveTVController> {
  const LiveTVView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background Image
          Positioned.fill(
            child: Image.asset(
              VoidImages.background1,
              fit: BoxFit.cover,
            ),
          ),
          // Content
          Column(
            children: [
              // AppBar
              Container(
                color: Colors.black.withOpacity(0.5),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.0.w),
                  child: PreferredSize(
                    preferredSize: Size.fromHeight(20.0.h), // Decrease the height of the AppBar
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          height: 45.h, // Adjust the height of the back button
                          width: 25.w, // Adjust the width of the back button
                          child: IconButton(
                            icon: Image.asset(VoidImages.back),
                            onPressed: () => Get.back(),
                            iconSize: 10.w, // Adjust the size of the icon inside the button
                          ),
                        ),
                        Expanded(
                          child: Center(
                            child: Text(
                              'Live TV',
                              style: TextStyle(color: Colors.white, fontSize: 9.sp),
                            ),
                          ),
                        ),
                        SizedBox(width: 45.w),
                        Text(
                          'Channel 01 HD',
                          style: TextStyle(color: Colors.white, fontSize: 12.sp, fontWeight: FontWeight.bold),
                        ),
                        Spacer(),
                        IconButton(
                          icon: Icon(Icons.search, color: Colors.white),
                          onPressed: () {
                            // Handle search action
                          },
                          iconSize: 10.w, // Adjust the size of the search icon
                        ),
                        IconButton(
                          icon: Icon(Icons.settings, color: Colors.white),
                          onPressed: () {
                            // Handle settings action
                          },
                          iconSize: 10.w, // Adjust the size of the settings icon
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              // Main Body
              Expanded(
                child: Row(
                  children: [
                    // Left Sidebar
                    Container(
                      width: 90.w,
                      color: Colors.black.withOpacity(0.5),
                      child: ListView.builder(
                        itemCount: 10, // Update this with actual channel count
                        itemBuilder: (context, index) {
                          return Container(
                            color: index == 0 ? Theme.of(context).colorScheme.primary : Colors.transparent,
                            child: ListTile(
                              title: const Text(
                                'Channel 01 HD',
                                style: TextStyle(color: Colors.white),
                              ),
                              subtitle: Text(
                                'Program Info',
                                style: TextStyle(color: Colors.white.withOpacity(0.7)),
                              ),
                              onTap: () {
                                // Handle channel selection
                              },
                            ),
                          );
                        },
                      ),
                    ),
                    // Main Content
                    Expanded(
                      child: GridView.builder(
                        padding: EdgeInsets.all(16.0.w),
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 7,
                        ),
                        itemCount: 12, // Update this with actual video count
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              Get.to(() => LiveTVView2(
                                imageUrl: VoidImages.sample,
                                channelName: 'Channel 01 HD',
                                programInfo: 'A hidden truth',
                                date: '21-june-2022',
                              ));
                            },
                            child: Image.asset(
                              VoidImages.sample, // Replace with actual video thumbnail
                              fit: BoxFit.cover,
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
