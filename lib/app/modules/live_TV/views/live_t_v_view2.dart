import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
//import 'live_t_v_view3.dart';

class LiveTVView2 extends StatelessWidget {
  final String imageUrl;
  final String channelName;
  final String programInfo;
  final String date;

  const LiveTVView2({
    Key? key,
    required this.imageUrl,
    required this.channelName,
    required this.programInfo,
    required this.date,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background Image
          Positioned.fill(
            child: Image.asset(
              'assets/images/image.png',
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
                        SizedBox(
                          height: 45.h, // Adjust the height of the back button
                          width: 25.w, // Adjust the width of the back button
                          child: IconButton(
                            icon: Image.asset('assets/images/back_button.png'),
                            onPressed: () => Navigator.pop(context),
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
                        SizedBox(width: 40.w),
                        Text(
                          channelName,
                          style: TextStyle(color: Colors.white, fontSize: 12.sp, fontWeight: FontWeight.bold),
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
                      child: SingleChildScrollView(
                        padding: EdgeInsets.all(10.0.w),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Image and Info
                            GestureDetector(
                              onTap: () {
                               // Navigator.push(
                                  //context,
                                  //MaterialPageRoute(
                                  //  builder: (context) => LiveTVView3(imageUrl: imageUrl),
                                 // ),
                                //);
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8.0.r),
                                  image: DecorationImage(
                                    image: AssetImage(imageUrl),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                height: 200.h,
                              ),
                            ),
                            SizedBox(height: 10.0.h),
                            // Program Info
                            Text(
                              channelName,
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
            ],
          ),
        ],
      ),
    );
  }
}
