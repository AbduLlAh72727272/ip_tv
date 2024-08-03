import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:better_player/better_player.dart';

import '../../../../generated/locales.g.dart';
import '../../../common/widgets/back_button_widget.dart';
import '../../../utils/constraints/image_strings.dart';
import '../controllers/live_t_v_controller.dart';
import 'live_t_v_view2.dart';


class LiveTVView extends GetView<LiveTVController> {
  LiveTVView({Key? key}) : super(key: key);

  final LiveTVController liveTVController = Get.put(LiveTVController());

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
                        const BackButtonWidget(),  // Use the back button widget
                        Expanded(
                          child: Center(
                            child: Text(
                              LocaleKeys.LiveTv.tr,
                              style: TextStyle(color: Colors.white, fontSize: 18),
                            ),
                          ),
                        ),
                        SizedBox(width: 45.w),
                        Text(
                          LocaleKeys.ChannelHd.tr,
                          style: TextStyle(color: Colors.white, fontSize: 18),
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
                        itemCount: liveTVController.entries.length,
                        itemBuilder: (context, index) {
                          final channel = liveTVController.entries[index];
                          return Container(
                            color: index == 0 ? Theme.of(context).colorScheme.primary : Colors.transparent,
                            child: ListTile(
                              title: Text(
                                channel.title,
                                style: TextStyle(color: Colors.white),
                              ),
                              subtitle: Text(
                                LocaleKeys.ProgramInfo.tr,
                                style: TextStyle(color: Colors.white.withOpacity(0.7)),
                              ),
                              onTap: () {},
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
                          mainAxisSpacing: 10,
                        ),
                        itemCount: liveTVController.entries.length, // Update this with actual video count
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              Get.to(() => LiveTVView2(
                                imageUrl: liveTVController.entries[index].logo,
                                channelName: liveTVController.entries[index].title,
                                programInfo: 'A hidden truth',
                                date: '21-june-2022',
                              ));
                            },
                            child: Image.network(
                              liveTVController.entries[index].logo,
                            ),
                          );
                        },
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
