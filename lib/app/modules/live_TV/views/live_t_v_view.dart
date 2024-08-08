import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../generated/locales.g.dart';
import '../../../common/widgets/back_button_widget.dart';
import '../../../common/widgets/vlc_player_screen.dart';
import '../../../utils/constraints/image_strings.dart';
import '../../Movies/controllers/movies_controller.dart';
import '../../Movies/views/movies_view2.dart';
import '../../series/controllers/series_controller.dart';
import '../controllers/live_t_v_controller.dart';

class LiveTVView extends GetView<LiveTVController> {
  final int initialSelectedTab;

  LiveTVView({Key? key, this.initialSelectedTab = 0}) : super(key: key);

  final LiveTVController liveTVController = Get.put(LiveTVController());
  final MoviesController moviesController = Get.put(MoviesController());
  final SeriesController seriesController = Get.put(SeriesController());

  final TextEditingController searchController = TextEditingController();
  final RxBool isSearchActive = false.obs;
  final RxList searchResults = [].obs;
  final RxInt selectedTab = 0.obs;

  @override
  void onInit() {
    //super.onInit();
    selectedTab.value = initialSelectedTab; // Set the initial selected tab
  }

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
      var entries;
      if (selectedTab.value == 0) {
        entries = liveTVController.entries;
      } else if (selectedTab.value == 1) {
        entries = moviesController.movies;
      } else {
        entries = seriesController.series;
      }
      searchResults.value = entries
          .where((entry) =>
          (selectedTab.value == 0 ? entry.displayName : entry.name)
              .toLowerCase()
              .contains(query.toLowerCase()))
          .toList();
    }
  }

  String getCurrentTime() {
    return DateFormat('hh:mm a').format(DateTime.now());
  }

  String getCurrentDate() {
    return DateFormat('yyyy-MM-dd').format(DateTime.now());
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (isSearchActive.value) {
          _toggleSearch();
        }
      },
      child: Scaffold(
        body: Stack(
          children: [
            Positioned.fill(
              child: Image.asset(
                VoidImages.background1,
                fit: BoxFit.cover,
              ),
            ),
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
                            padding: EdgeInsets.all(4.0.w),
                            child: TextField(
                              controller: searchController,
                              onChanged: _performSearch,
                              decoration: InputDecoration(
                                hintText: LocaleKeys.Search.tr,
                                prefixIcon: Icon(Icons.search),
                                border: OutlineInputBorder(
                                  borderRadius:
                                  BorderRadius.circular(10.0),
                                  borderSide: BorderSide.none,
                                ),
                                filled: true,
                                fillColor:
                                Colors.white.withOpacity(0.7),
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
                                  child: Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.center,
                                    children: [
                                      GestureDetector(
                                        onTap: () =>
                                        selectedTab.value = 0,
                                        child: Text(
                                          LocaleKeys.LiveTv.tr,
                                          style: TextStyle(
                                            color: selectedTab.value == 0
                                                ? Colors.yellow
                                                : Colors.white,
                                            fontSize: 9.sp,
                                          ),
                                        ),
                                      ),
                                      Text(
                                        ' | ',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 9.sp),
                                      ),
                                      GestureDetector(
                                        onTap: () =>
                                        selectedTab.value = 1,
                                        child: Text(
                                          'Movies',
                                          style: TextStyle(
                                            color: selectedTab.value == 1
                                                ? Colors.yellow
                                                : Colors.white,
                                            fontSize: 9.sp,
                                          ),
                                        ),
                                      ),
                                      Text(
                                        ' | ',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 9.sp),
                                      ),
                                      GestureDetector(
                                        onTap: () =>
                                        selectedTab.value = 2,
                                        child: Text(
                                          'Series',
                                          style: TextStyle(
                                            color: selectedTab.value == 2
                                                ? Colors.yellow
                                                : Colors.white,
                                            fontSize: 9.sp,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(width: 20.w),
                              Row(
                                children: [
                                  Text(
                                    getCurrentTime(),
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 8.sp),
                                  ),
                                  SizedBox(width: 4.w),
                                  Text(
                                    getCurrentDate(),
                                    style: TextStyle(
                                        color: Colors.grey,
                                        fontSize: 6.sp),
                                  ),
                                ],
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
                    if (selectedTab.value == 0 &&
                        liveTVController.isLoading.value &&
                        liveTVController.entries.isEmpty) {
                      return Center(child: CircularProgressIndicator());
                    } else if (selectedTab.value == 1 &&
                        moviesController.isLoading.value &&
                        moviesController.movies.isEmpty) {
                      return Center(child: CircularProgressIndicator());
                    } else if (selectedTab.value == 2 &&
                        seriesController.isLoading.value &&
                        seriesController.series.isEmpty) {
                      return Center(child: CircularProgressIndicator());
                    }

                    final displayEntries = isSearchActive.value
                        ? searchResults
                        : (selectedTab.value == 0
                        ? liveTVController.entries
                        : selectedTab.value == 1
                        ? moviesController.movies
                        : seriesController.series);

                    return NotificationListener<ScrollNotification>(
                      onNotification: (scrollInfo) {
                        if (scrollInfo.metrics.pixels ==
                            scrollInfo.metrics.maxScrollExtent) {
                          if (selectedTab.value == 0 &&
                              !liveTVController.isFetchingMore.value &&
                              !liveTVController.allPagesLoaded.value) {
                            liveTVController.fetchNextPage();
                          } else if (selectedTab.value == 1 &&
                              !moviesController.isFetchingMore.value &&
                              !moviesController.allPagesLoaded.value) {
                            moviesController.fetchNextPage();
                          } else if (selectedTab.value == 2 &&
                              !seriesController.isFetchingMore.value &&
                              !seriesController.allPagesLoaded.value) {
                            seriesController.fetchNextPage();
                          }
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
                              itemCount: displayEntries.length,
                              itemBuilder: (context, index) {
                                final entry = displayEntries[index];
                                final displayName = selectedTab.value == 0
                                    ? entry.displayName
                                    : entry.name;
                                return Container(
                                  color: index == 0
                                      ? Theme.of(context).colorScheme.primary
                                      : Colors.transparent,
                                  child: ListTile(
                                    title: Text(
                                      displayName,
                                      style: TextStyle(color: Colors.white),
                                    ),
                                    // subtitle: Text(
                                    //   LocaleKeys.ProgramInfo.tr,
                                    //   style: TextStyle(
                                    //       color:
                                    //       Colors.white.withOpacity(0.7)),
                                    // ),
                                    onTap: () {
                                      if(selectedTab.value == 0) {
                                         _navigateToVlcPlayer(
                                            context, entry.url);
                                      }
                                     else if(selectedTab.value ==1){
                                        Get.to(() => MoviesView2(
                                          imageUrl: entry.logo,
                                          channelName: entry.name,
                                          programInfo: entry.group,
                                          date: '',
                                          streamUrl: entry.url,
                                        )
                                        );

                                      }
                                     else if(selectedTab.value==2){
                                       Get.toNamed('/series_view2', arguments: entry,
                                       );
                                      }
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
                                  if (selectedTab.value == 0 &&
                                      liveTVController
                                          .allPagesLoaded.value) {
                                    return Center(
                                        child: Text(LocaleKeys
                                            .Youhavereachedtheendofthelist
                                            .tr));
                                  } else if (selectedTab.value == 1 &&
                                      moviesController
                                          .allPagesLoaded.value) {
                                    return Center(
                                        child: Text(LocaleKeys
                                            .Youhavereachedtheendofthelist
                                            .tr));
                                  } else if (selectedTab.value == 2 &&
                                      seriesController
                                          .allPagesLoaded.value) {
                                    return Center(
                                        child: Text(LocaleKeys
                                            .Youhavereachedtheendofthelist
                                            .tr));
                                  } else {
                                    return Center(
                                        child:
                                        CircularProgressIndicator());
                                  }
                                }
                                final entry = displayEntries[index];
                                final imageUrl = entry.logo.isNotEmpty
                                    ? entry.logo
                                    : VoidImages.placeholder;
                                return GestureDetector(
                                  onTap: () {
                                    _navigateToVlcPlayer(context, entry.url);
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
      ),
    );
  }
}
