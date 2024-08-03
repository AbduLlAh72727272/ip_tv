import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:ip_tv/app/common/widgets/better_player_screen.dart';
import '../../../common/widgets/back_button_widget.dart';
import '../../../common/widgets/vlc_player_screen.dart';
import '../../../utils/constraints/image_strings.dart';
import '../controllers/live_t_v_controller.dart';


class LiveTVView2 extends StatelessWidget {
  final String imageUrl;
  final String channelName;
  final String programInfo;
  final String date;

  LiveTVView2({
    Key? key,
    required this.imageUrl,
    required this.channelName,
    required this.programInfo,
    required this.date,
  }) : super(key: key);

  final LiveTVController liveTVController = Get.put(LiveTVController());

  void _navigateToBetterPlayer(BuildContext context, String streamUrl) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => BetterPlayerScreen(streamUrl: streamUrl),
      ),
    );
  }

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
                    preferredSize: Size.fromHeight(50.0.h), // Decrease the height of the AppBar
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const BackButtonWidget(),  // Use the back button widget
                        Expanded(
                          child: Center(
                            child: Text(
                              'Live TV',
                              style: TextStyle(color: Colors.white, fontSize: 9.sp),
                            ),
                          ),
                        ),
                        SizedBox(width: 40.w),
                        SizedBox(
                          width: 100.w,
                          child: Text(
                            channelName,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(color: Colors.white, fontSize: 11.sp, fontWeight: FontWeight.w400),
                          ),
                        ),
                        Spacer(),
                        Text(
                          date,
                          style: TextStyle(color: Colors.white, fontSize: 9.sp),
                        ),
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
                child: Obx(() => liveTVController.isLoading.value ?
                Center(
                    child: CircularProgressIndicator()) :
                Row(
                  children: [
                    // Left Sidebar
                    Container(
                      width: 90.w,
                      color: Colors.black.withOpacity(0.5),
                      child: ListView.builder(
                        itemCount: liveTVController.entries.length, // Update this with actual channel count
                        itemBuilder: (context, index) {
                          final channel = liveTVController.entries[index];
                          return Container(
                            color: index == 0 ? Theme.of(context).colorScheme.primary : Colors.transparent,
                            child: ListTile(
                              title: Text(
                                // 'Channel 01 HD',
                                channel.title,
                                style: TextStyle(color: Colors.white),
                              ),
                              subtitle: Text(
                                'Program Info',
                                style: TextStyle(color: Colors.white.withOpacity(0.7)),
                              ),
                              onTap: () {
                                _navigateToBetterPlayer(context, liveTVController.entries[index].url);
                              },
                            ),
                          );
                        },
                      ),
                    ),
                    // Main Content
                    Expanded(
                      child: SingleChildScrollView(
                        padding: EdgeInsets.all(10.0.w),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Image and Info
                            GestureDetector(
                              onTap: () {
                                _navigateToBetterPlayer(context, 'https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4');
                              },
                              child: Center(
                                child: SizedBox(
                                  child: Image.network(imageUrl,),
                                  // decoration: BoxDecoration(
                                  //   borderRadius: BorderRadius.circular(8.0.r),
                                  //   image: DecorationImage(
                                  //     image: AssetImage(imageUrl),
                                  //     fit: BoxFit.cover,
                                  //   ),
                                  // ),
                                  height: 200.h,
                                ),
                              ),
                            ),
                            SizedBox(height: 10.0.h),
                            // Program Info
                            Text(
                              channelName,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 12.0.sp,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 8.0.h),
                            // Program Schedule
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  // color: Colors.red,
                                  padding: EdgeInsets.symmetric(vertical: 4.0.h, horizontal: 2.0.w),
                                  child: Text(
                                    '10:10 - 12:20    A hidden truth',
                                    style: TextStyle(color: Colors.white, fontSize: 10.0.sp),
                                  ),
                                ),
                                SizedBox(height: 4.0.h),
                                Container(
                                  //color: Colors.grey,
                                  padding: EdgeInsets.symmetric(vertical: 4.0.h, horizontal: 2.0.w),
                                  child: Text(
                                    '10:10 - 12:20    A hidden truth',
                                    style: TextStyle(color: Colors.grey, fontSize: 10.0.sp),
                                  ),
                                ),
                                SizedBox(height: 4.0.h),
                                Container(
                                  // color: Colors.grey,
                                  padding: EdgeInsets.symmetric(vertical: 4.0.h, horizontal: 2.0.w),
                                  child: Text(
                                    '10:10 - 12:20    A hidden truth',
                                    style: TextStyle(color: Colors.grey, fontSize: 10.0.sp),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
