import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../generated/locales.g.dart';
import '../../M3U_playlist/views/m3_u_playlist_view.dart';
import '../../parental/views/parental_view.dart';
//import '../parental/parental_view.dart'; // Import the ParentalView

class PlaylistView extends StatefulWidget {
  @override
  _PlaylistViewState createState() => _PlaylistViewState();
}

class _PlaylistViewState extends State<PlaylistView> {
  List<Map<String, String>> playlists = []; // List to store playlist details

  @override
  Widget build(BuildContext context) {
    // Initialize ScreenUtil
    ScreenUtil.init(context, designSize: Size(360, 690), minTextAdapt: true, splitScreenMode: true);

    return Scaffold(
      body: Stack(
        children: [
          // Background image
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/image.png'), // Background image
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Playlist content
          Center(
            child: Container(
              width: 300.w, // Adjusted width using ScreenUtil
              height: 300.h,
              padding: EdgeInsets.all(16.0.w), // Padding using ScreenUtil
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.4),
                borderRadius: BorderRadius.circular(10.r), // Border radius using ScreenUtil
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start, // Align text to start
                children: [
                  Text(
                    // 'Playlist',
                  LocaleKeys.Playlist.tr,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 10.sp, // Font size using ScreenUtil
                    ),
                  ),
                  SizedBox(height: 10.h), // Spacing using ScreenUtil
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
                  SizedBox(height: 10.h), // Spacing using ScreenUtil
                  Center(
                    child: ElevatedButton.icon(
                      onPressed: () async {
                        // Navigate to HomeView and wait for result
                        final result = await Get.to(() => M3UPlaylistView());
                        if (result != null && result is Map<String, String>) {
                          setState(() {
                            playlists.add(result);
                          });
                        }
                      },
                      icon: Icon(Icons.add),
                      label: Text(LocaleKeys.AddPlaylist.tr),
                      style: ElevatedButton.styleFrom(
                        // foregroundColor: Colors.white,
                        // backgroundColor: Color(0xFFB1060F),
                        padding: EdgeInsets.symmetric(
                          horizontal: 8.0.w, // Padding using ScreenUtil
                          vertical: 8.0.h, // Padding using ScreenUtil
                        ),
                        textStyle: TextStyle(fontSize: 8.sp), // Font size using ScreenUtil
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.r), // Border radius using ScreenUtil
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
        Get.to(() => ParentalView());
      },
      child: Container(
        width: 120.w, // Adjusted width using ScreenUtil
        height: 95.h,
        padding: EdgeInsets.all(8.0.w), // Padding using ScreenUtil
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(10.r), // Border radius using ScreenUtil
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
