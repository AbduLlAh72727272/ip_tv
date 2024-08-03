import 'package:flutter/material.dart';
import 'package:better_player/better_player.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:volume_controller/volume_controller.dart';

import '../../utils/constraints/colors.dart';
import '../../utils/constraints/image_strings.dart';
import 'back_button_widget.dart';

class BetterPlayerScreen extends StatefulWidget {
  final String streamUrl;
  final bool isLive;

  const BetterPlayerScreen({Key? key, required this.streamUrl, this.isLive = false}) : super(key: key);

  @override
  _BetterPlayerScreenState createState() => _BetterPlayerScreenState();
}

class _BetterPlayerScreenState extends State<BetterPlayerScreen> with SingleTickerProviderStateMixin {
  late BetterPlayerController _betterPlayerController;
  bool isPlaying = true;
  double volume = 0.5;
  double brightness = 0.5;
  late AnimationController _animationController;
  late Animation<Offset> _offsetAnimation;
  bool isChannelListOpen = false;

  @override
  void initState() {
    super.initState();
    BetterPlayerDataSource betterPlayerDataSource = BetterPlayerDataSource(
      BetterPlayerDataSourceType.network,
      widget.streamUrl,
      liveStream: widget.isLive,
    );
    _betterPlayerController = BetterPlayerController(
      BetterPlayerConfiguration(autoPlay: true),
      betterPlayerDataSource: betterPlayerDataSource,
    );

    VolumeController().setVolume(volume);

    _animationController = AnimationController(
      duration: const Duration(milliseconds: 200),
      vsync: this,
    );

    _offsetAnimation = Tween<Offset>(
      begin: const Offset(1.0, 0.0),
      end: Offset.zero,
    ).animate(_animationController);
  }

  @override
  void dispose() {
    _betterPlayerController.dispose();
    _animationController.dispose();
    super.dispose();
  }

  void togglePlayPause() {
    setState(() {
      if (isPlaying) {
        _betterPlayerController.pause();
      } else {
        _betterPlayerController.play();
      }
      isPlaying = !isPlaying;
    });
  }

  void openChannelList() {
    setState(() {
      isChannelListOpen = true;
    });
    _animationController.forward();
  }

  void openSettings() {
    setState(() {
      isChannelListOpen = false;
    });
    _animationController.forward();
  }

  void closeSidePanel() {
    _animationController.reverse();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        _betterPlayerController.pause();
        _betterPlayerController.dispose();
        return true;
      },
      child: Scaffold(
        body: Stack(
          children: [
            Positioned.fill(
              child: BetterPlayer(
                controller: _betterPlayerController,
              ),
            ),
            Positioned(
              top: 20.h,
              left: 20.w,
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      _betterPlayerController.pause();
                      _betterPlayerController.dispose();
                      Navigator.pop(context);
                    },
                    child: const BackButtonWidget(),
                  ),
                  SizedBox(width: 2.w),
                  Image.asset(VoidImages.logo, height: 70.h),
                ],
              ),
            ),
            Positioned(
              top: 20.h,
              right: 20.w,
              child: Row(
                children: [
                  IconButton(
                    icon: Icon(Icons.settings_suggest_outlined, color: Colors.white, size: 30.h),
                    onPressed: openSettings,
                  ),
                  SizedBox(width: 5.w),
                  GestureDetector(
                    onTap: openChannelList,
                    child: Container(
                      padding: EdgeInsets.all(2.w),
                      color: Theme.of(context).colorScheme.primary,
                      child: Row(
                        children: [
                          Icon(Icons.tv, color: Colors.white, size: 20.h),
                          SizedBox(width: 5.w),
                          Text(
                            'Channel List',
                            style: TextStyle(color: Colors.white, fontSize: 10.sp),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: widget.isLive
                    ? Text(
                  'Live',
                  style: TextStyle(color: Colors.white, fontSize: 16.sp),
                )
                    : Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      formatDuration(_betterPlayerController.videoPlayerController!.value.position),
                      style: TextStyle(color: Colors.white, fontSize: 16.sp),
                    ),
                    Text(
                      formatDuration(_betterPlayerController.videoPlayerController!.value.duration ?? Duration.zero),
                      style: TextStyle(color: Colors.white, fontSize: 16.sp),
                    ),
                  ],
                ),
              ),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: SlideTransition(
                position: _offsetAnimation,
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.5,
                  color: isChannelListOpen
                      ? Theme.of(context).colorScheme.primary.withOpacity(0.6)
                      : VoidColors.blackColor.withOpacity(0.6),
                  child: Column(
                    children: [
                      IconButton(
                        icon: Icon(Icons.close, color: Colors.white),
                        onPressed: closeSidePanel,
                      ),
                      Expanded(
                        child: isChannelListOpen
                            ? ListView(
                          padding: EdgeInsets.all(20.w),
                          children: [
                            Text('All', style: TextStyle(color: Colors.white, fontSize: 10.sp)),
                            SizedBox(height: 10.h),
                            Text('Favourites', style: TextStyle(color: Colors.white, fontSize: 10.sp)),
                            SizedBox(height: 10.h),
                            Container(
                              color: Theme.of(context).colorScheme.primary,
                              padding: EdgeInsets.all(5.w),
                              child: Text('T20 World Cup', style: TextStyle(color: Colors.white, fontSize: 10.sp)),
                            ),
                            SizedBox(height: 10.h),
                            Text('Sports', style: TextStyle(color: Colors.white, fontSize: 10.sp)),
                            SizedBox(height: 10.h),
                            Text('Cricket', style: TextStyle(color: Colors.white, fontSize: 10.sp)),
                            SizedBox(height: 10.h),
                            Text('BEIN Sport', style: TextStyle(color: Colors.white, fontSize: 10.sp)),
                            SizedBox(height: 10.h),
                            Text('Sky Sport', style: TextStyle(color: Colors.white, fontSize: 10.sp)),
                            SizedBox(height: 10.h),
                            Text('3HD Sports', style: TextStyle(color: Colors.white, fontSize: 10.sp)),
                          ],
                        )
                            : ListView(
                          padding: EdgeInsets.all(20.w),
                          children: [
                            Text(
                              'Settings',
                              style: TextStyle(color: Colors.white, fontSize: 10.sp, fontWeight: FontWeight.bold),
                              textAlign: TextAlign.center,
                            ),
                            SizedBox(height: 20.h),
                            SwitchListTile(
                              title: Text('Active Subtitles', style: TextStyle(color: Colors.white, fontSize: 8.sp)),
                              value: true,
                              onChanged: (bool value) {},
                            ),
                            ListTile(
                              title: Text('Themes', style: TextStyle(color: Colors.white, fontSize: 8.sp)),
                              trailing: DropdownButton<String>(
                                dropdownColor: VoidColors.primary,
                                items: <String>['Dark', 'Light'].map((String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(value, style: TextStyle(color: Colors.white)),
                                  );
                                }).toList(),
                                onChanged: (_) {},
                              ),
                            ),
                            ListTile(
                              title: Text('Change Language', style: TextStyle(color: Colors.white, fontSize: 8.sp)),
                              trailing: DropdownButton<String>(
                                dropdownColor: VoidColors.primary,
                                items: <String>['English', 'Spanish', 'French'].map((String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(value, style: TextStyle(color: Colors.white)),
                                  );
                                }).toList(),
                                onChanged: (_) {},
                              ),
                            ),
                            SizedBox(height: 10.h),
                            ElevatedButton(
                              onPressed: closeSidePanel,
                              style: ElevatedButton.styleFrom(backgroundColor: VoidColors.primary),
                              child: Text('Done', style: TextStyle(color: Colors.white, fontSize: 10.sp)),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  String formatDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final hours = twoDigits(duration.inHours);
    final minutes = twoDigits(duration.inMinutes.remainder(60));
    final seconds = twoDigits(duration.inSeconds.remainder(60));
    return '$hours:$minutes:$seconds';
  }
}
