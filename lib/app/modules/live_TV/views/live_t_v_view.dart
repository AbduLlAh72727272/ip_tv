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
  final TextEditingController searchController = TextEditingController();
  final RxBool isSearchActive = false.obs;
  final RxList searchResults = [].obs;

  void _navigateToVlcPlayer(BuildContext context, String streamUrl) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => VlcPlayerScreen(streamUrl: streamUrl),
      ),
    );
  }

  void _toggleSearch() {
    isSearchActive.value = !isSearchActive.value;
    if (!isSearchActive.value) {
      searchController.clear();
      searchResults.clear();
    }
  }

  void _performSearch(String query) {
    if (query.isEmpty) {
      searchResults.clear();
    } else {
      searchResults.value = liveTVController.entries
          .where((entry) =>
          entry.displayName.toLowerCase().contains(query.toLowerCase()))
          .toList();
    }
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
                    preferredSize: Size.fromHeight(56.0.h),
                    child: Obx(() {
                      return AnimatedSwitcher(
                        duration: Duration(milliseconds: 300),
                        transitionBuilder:
                            (Widget child, Animation<double> animation) {
                          return FadeTransition(
                            opacity: animation,
                            child: SizeTransition(
                              sizeFactor: animation,
                              axis: Axis.horizontal,
                              child: child,
                            ),
                          );
                        },
                        child: isSearchActive.value
                            ? Padding(
                          key: ValueKey('searchBar'),
                          padding: EdgeInsets.all(8.0.w),
                          child: TextField(
                            controller: searchController,
                            onChanged: _performSearch,
                            decoration: InputDecoration(
                              hintText: LocaleKeys.Search.tr,
                              prefixIcon: Icon(Icons.search),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                                borderSide: BorderSide.none,
                              ),
                              filled: true,
                              fillColor: Colors.white.withOpacity(0.7),
                            ),
                          ),
                        )
                            : Row(
                          key: ValueKey('normalBar'),
                          mainAxisAlignment:
                          MainAxisAlignment.spaceBetween,
                          children: [
                            const BackButtonWidget(),
                            Expanded(
                              child: Center(
                                child: Text(
                                  LocaleKeys.LiveTv.tr,
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 9.sp),
                                ),
                              ),
                            ),
                            SizedBox(width: 65.w),
                            Text(
                              LocaleKeys.ChannelHd.tr,
                              style: TextStyle(
                                  color: Colors.white, fontSize: 9.sp),
                            ),
                            Spacer(),
                            IconButton(
                              icon: Icon(
                                isSearchActive.value
                                    ? Icons.close
                                    : Icons.search,
                                color: Colors.white,
                              ),
                              onPressed: _toggleSearch,
                              iconSize: 12.sp,
                            ),
                          ],
                        ),
                      );
                    }),
                  ),
                ),
              ),
              // Main Body
              Expanded(
                child: Obx(() {
                  if (liveTVController.isLoading.value &&
                      liveTVController.entries.isEmpty) {
                    return Center(child: CircularProgressIndicator());
                  }

                  final displayEntries = isSearchActive.value
                      ? searchResults
                      : liveTVController.entries;

                  return NotificationListener<ScrollNotification>(
                    onNotification: (scrollInfo) {
                      if (scrollInfo.metrics.pixels ==
                          scrollInfo.metrics.maxScrollExtent &&
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
                              final channel =
                              liveTVController.entries[index];
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
                                    _navigateToVlcPlayer(
                                        context, channel.url);
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
                            SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 3,
                              crossAxisSpacing: 10.w,
                              mainAxisSpacing: 10.h,
                            ),
                            itemCount: displayEntries.length + 1,
                            itemBuilder: (context, index) {
                              if (index == displayEntries.length) {
                                if (liveTVController
                                    .allPagesLoaded.value) {
                                  return Center(
                                      child: Text(
                                          'You have reached the end of the list'));
                                } else {
                                  return Center(
                                      child: CircularProgressIndicator());
                                }
                              }
                              final entry = displayEntries[index];
                              final imageUrl = entry.logo.isNotEmpty
                                  ? entry.logo
                                  : VoidImages.placeholder;
                              return GestureDetector(
                                onTap: () {
                                  _navigateToVlcPlayer(
                                      context, entry.url);
                                },
                                child: Image.network(
                                  imageUrl,
                                  errorBuilder:
                                      (context, error, stackTrace) {
                                    return Image.asset(
                                        VoidImages.placeholder);
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
