import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../utils/constraints/colors.dart';
import '../../../utils/constraints/image_strings.dart';
import '../controllers/movies_controller.dart';
import '../models/movie_model.dart';
import 'movies_view2.dart';

class MoviesView extends GetView<MoviesController> {
  MoviesView({super.key});

  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    // Initialize ScreenUtil

    // Add listener to the scroll controller to load more movies when reaching the end
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent &&
          !controller.isFetchingMore.value &&
          !controller.allPagesLoaded.value) {
        controller.fetchNextPage();
      }
    });

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 40.h,
        backgroundColor: Theme.of(context).colorScheme.primary,
        elevation: 0,
        leading: Padding(
          padding: EdgeInsets.all(2.0.w),
          child: Image.asset(
            VoidImages.vpn_blue,
            fit: BoxFit.contain,
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.search, color: Colors.white),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.settings_suggest_outlined, color: Colors.white),
            onPressed: () {},
          ),
        ],
      ),
      extendBodyBehindAppBar: false,
      body: Obx(() {
        // Background gradient with the first movie's image
        final firstMovie = controller.movies.isNotEmpty ? controller.movies[0] : null;
        return Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.black,
                    Theme.of(context).colorScheme.primary,
                  ],
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                ),
              ),
            ),
            SingleChildScrollView(
              controller: _scrollController,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(
                    children: [
                      Container(
                        height: 300.h,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: NetworkImage(
                              firstMovie?.logo.isNotEmpty == true
                                  ? firstMovie!.logo
                                  : VoidImages.placeholder,
                            ),
                            fit: BoxFit.fill,
                            // onError: (_, __) {
                            //   return AssetImage(VoidImages.placeholder);
                            // },
                          ),
                        ),
                      ),
                      Positioned(

                        bottom: 0.h,
                        left: 16.w,
                        right: 16.w,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              firstMovie?.name ?? 'Movie Title',
                              style: TextStyle(
                                fontSize: 10.sp,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(height: 8.h),
                            Text(
                              firstMovie?.group ?? 'Movie description goes here.',
                              style: TextStyle(
                                fontSize: 6.sp,
                                color: Colors.white,
                              ),
                              overflow: TextOverflow.ellipsis,
                              maxLines: 3,
                            ),
                            SizedBox(height: 16.h),
                            Row(
                              children: [
                                ElevatedButton.icon(
                                  onPressed: () {
                                    if (firstMovie != null) {
                                      Get.to(() => MoviesView2(
                                        imageUrl: firstMovie.logo,
                                        channelName: firstMovie.name,
                                        programInfo: firstMovie.group,
                                        date: '',
                                        streamUrl: firstMovie.url,
                                      ));
                                    }
                                  },
                                  icon: Icon(Icons.play_arrow),
                                  label: Text('Play'),
                                  style: ElevatedButton.styleFrom(
                                    foregroundColor: Colors.black,
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 24.w, vertical: 12.h),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                  ),
                                ),
                                SizedBox(width: 8.w),
                                OutlinedButton(
                                  onPressed: () {
                                    if (firstMovie != null) {
                                      _showMoreInfoDialog(context, firstMovie);
                                    }
                                  },
                                  style: OutlinedButton.styleFrom(
                                    foregroundColor: Colors.white,
                                    backgroundColor: Color(0x6D6D6EB2),
                                    side: BorderSide(color: Colors.white),
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 24.w, vertical: 12.h),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                  ),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Image.asset(
                                        VoidImages.info,
                                        color: Colors.white,
                                        height: 18.h,
                                        width: 18.w,
                                      ),
                                      SizedBox(width: 8.w),
                                      Text('More Info'),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.all(16.0.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 24.h),
                        _buildMatchedSection(),
                        SizedBox(height: 24.h),
                        Obx(() {
                          if (controller.isFetchingMore.value) {
                            return Center(child: CircularProgressIndicator());
                          } else if (controller.allPagesLoaded.value) {
                            return Center(child: Text('You have reached the end of the list'));
                          } else {
                            return SizedBox.shrink();
                          }
                        }),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        );
      }),
    );
  }

  Widget _buildMatchedSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 8.h),
        // Movies List
        SizedBox(
          height: 180.h,
          child: Obx(() {
            if (controller.isLoading.value && controller.movies.isEmpty) {
              return Center(child: CircularProgressIndicator());
            }
            return ListView.builder(
              itemCount: controller.movies.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                final movie = controller.movies[index];
                return GestureDetector(
                  onTap: () {
                    Get.to(() => MoviesView2(
                      imageUrl: movie.logo,
                      channelName: movie.name,
                      programInfo: movie.group,
                      date: '',
                      streamUrl: movie.url,
                    ));
                  },
                  child: buildMovieCard(movie.logo, movie.name),
                );
              },
            );
          }),
        ),
        SizedBox(height: 16.h),
      ],
    );
  }

  Widget buildMovieCard(String imageUrl, String title) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 8.0.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            child: Stack(
              children: [
                Image.network(
                  imageUrl.isNotEmpty ? imageUrl : VoidImages.placeholder,
                 // width: 50.w,
                  height: 150.h,
                  fit: BoxFit.contain,
                  errorBuilder: (BuildContext context, Object exception,
                      StackTrace? stackTrace) {
                    return Image.asset(
                      VoidImages.placeholder,
                      //width: 100.w,
                      height: 150.h,
                      fit: BoxFit.contain,
                    );
                  },
                ),
                // Positioned(
                //   bottom: 0,
                //   right: 0,
                //   left: 0,
                //   child: Text(
                //     title,
                //     style: TextStyle(
                //       color: Colors.black,
                //       fontSize: 10.sp,
                //     ),
                //     overflow: TextOverflow.ellipsis,
                //     maxLines: 2,
                //  ),
               // ),
              ],
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.0),
              color: Colors.grey,
            ),
          ),
          SizedBox(height: 8.h),
        ],
      ),
    );
  }

  void _showMoreInfoDialog(BuildContext context, Movie movie) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.black,
          title: Text(
            movie.name,
            style: TextStyle(color: Colors.white),
          ),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text(
                  'Program Info: ${movie.group}',
                  style: TextStyle(color: Colors.white),
                ),
                SizedBox(height: 10.h),
                Text(
                  'Stream URL: ${movie.url}',
                  style: TextStyle(color: Colors.white),
                ),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Close', style: TextStyle(color: Colors.white)),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
