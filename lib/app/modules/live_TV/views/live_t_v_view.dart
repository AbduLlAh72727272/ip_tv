import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../generated/locales.g.dart';
import '../../../common/widgets/back_button_widget.dart';
import '../../../common/widgets/vlc_player_screen.dart';
import '../../../utils/constraints/image_strings.dart';
import '../controllers/live_t_v_controller.dart';

class LiveTVView extends GetView<LiveTVController> {
  LiveTVView({Key? key}) : super(key: key);

  final LiveTVController liveTVController = Get.put(LiveTVController());

  void _navigateToVlcPlayer(BuildContext context, String streamUrl) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => VlcPlayerScreen(streamUrl: streamUrl),
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
                    preferredSize: Size.fromHeight(20.0.h),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const BackButtonWidget(),
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
                          iconSize: 10.w,
                        ),
                        IconButton(
                          icon: Icon(Icons.settings, color: Colors.white),
                          onPressed: () {
                            // Handle settings action
                          },
                          iconSize: 10.w,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              // Main Body
              Expanded(
                child: Obx(() {
                  if (liveTVController.isLoading.value && liveTVController.entries.isEmpty) {
                    return Center(child: CircularProgressIndicator());
                  }
                  return NotificationListener<ScrollNotification>(
                    onNotification: (scrollInfo) {
                      if (scrollInfo.metrics.pixels == scrollInfo.metrics.maxScrollExtent &&
                          !liveTVController.isFetchingMore.value &&
                          !liveTVController.allPagesLoaded.value) {
                        liveTVController.fetchNextPage();
                      }
                      return false;
                    },
                    child: Row(
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
                                color: index == 0
                                    ? Theme.of(context).colorScheme.primary
                                    : Colors.transparent,
                                child: ListTile(
                                  title: Text(
                                    channel.displayName,
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  subtitle: Text(
                                    LocaleKeys.ProgramInfo.tr,
                                    style: TextStyle(
                                        color: Colors.white.withOpacity(0.7)),
                                  ),
                                  onTap: () {
                                    _navigateToVlcPlayer(context, channel.url);
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
                            gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 3,
                              crossAxisSpacing: 10,
                              mainAxisSpacing: 10,
                            ),
                            itemCount: liveTVController.entries.length + 1,
                            itemBuilder: (context, index) {
                              if (index == liveTVController.entries.length) {
                                if (liveTVController.allPagesLoaded.value) {
                                  return Center(child: Text('You have reached the end of the list'));
                                } else {
                                  return Center(child: CircularProgressIndicator());
                                }
                              }
                              final entry = liveTVController.entries[index];
                              final imageUrl = entry.logo.isNotEmpty ? entry.logo : VoidImages.placeholder;
                              return GestureDetector(
                                onTap: () {
                                  _navigateToVlcPlayer(context, entry.url);
                                },
                                child: Image.network(
                                  imageUrl,
                                  errorBuilder: (context, error, stackTrace) {
                                    return Image.asset(VoidImages.placeholder);
                                  },
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  );
                }),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
