import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../generated/locales.g.dart';
import '../../../routes/app_pages.dart';
import '../../../utils/constraints/image_strings.dart';


class PlaylistView extends StatefulWidget {
  @override
  _PlaylistViewState createState() => _PlaylistViewState();
}

class _PlaylistViewState extends State<PlaylistView> {
  List<Map<String, String>> playlists = [];

  @override
  Widget build(BuildContext context) {


    return Scaffold(
      body: Stack(
        children: [
          // Background image
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(VoidImages.background1),
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Playlist content
          Center(
            child: Container(
              width: 300.w,
              height: 300.h,
              padding: EdgeInsets.all(16.0.w),
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.4),
                borderRadius: BorderRadius.circular(10.r),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    // 'Playlist',
                  LocaleKeys.Playlist.tr,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 10.sp,
                    ),
                  ),
                  SizedBox(height: 10.h),
                  Expanded(
                    child: ListView.builder(
                      itemCount: (playlists.length / 2).ceil(),
                      itemBuilder: (context, index) {
                        final itemIndex1 = index * 2;
                        final itemIndex2 = itemIndex1 + 1;
                        return Padding(
                          padding: EdgeInsets.only(bottom: 10.h),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              if (itemIndex1 < playlists.length)
                                _buildPlaylistItem(playlists[itemIndex1], itemIndex1),
                              if (itemIndex2 < playlists.length)
                                _buildPlaylistItem(playlists[itemIndex2], itemIndex2),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                  SizedBox(height: 10.h),
                  Center(
                    child: ElevatedButton.icon(
                      onPressed: () async {
                        final result = await Get.toNamed(Routes.M3_U_PLAYLIST);
                        if (result != null && result is Map<String, String>) {
                          setState(() {
                            playlists.add(result);
                          });
                        }
                      },
                      icon: Icon(Icons.add),
                      label: Text(LocaleKeys.AddPlaylist.tr),
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.symmetric(
                          horizontal: 8.0.w,
                          vertical: 8.0.h,
                        ),
                        textStyle: TextStyle(fontSize: 8.sp),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.r),
                        ),
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

  Widget _buildPlaylistItem(Map<String, String> playlist, int index) {
    return GestureDetector(
      onTap: () {
        Get.toNamed(Routes.PARENTAL);
      },
      child: Container(
        width: 120.w,
        height: 95.h,
        padding: EdgeInsets.all(8.0.w),
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(10.r),
          border: Border.all(color: Colors.white),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    playlist['playlistName'] ?? '',
                    style: TextStyle(color: Colors.white),
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    playlist['playlistUrl'] ?? '',
                    style: TextStyle(color: Colors.grey, fontSize: 10.sp),
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
            IconButton(
              icon: Icon(Icons.delete, color: Theme.of(context).iconTheme.color),
              onPressed: () {
                setState(() {
                  playlists.removeAt(index);
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
