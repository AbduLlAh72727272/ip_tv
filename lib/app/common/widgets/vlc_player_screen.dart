import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vlc_player/flutter_vlc_player.dart';
import 'package:get/get.dart';
import 'package:ip_tv/app/utils/constraints/colors.dart';
import '../../modules/live_TV/controllers/live_t_v_controller.dart';
import '../../utils/constraints/image_strings.dart';
import 'back_button_widget.dart';


class VlcPlayerScreen extends StatefulWidget {
  final String streamUrl;

  const VlcPlayerScreen({Key? key, required this.streamUrl}) : super(key: key);

  @override
  _VlcPlayerScreenState createState() => _VlcPlayerScreenState();
}

class _VlcPlayerScreenState extends State<VlcPlayerScreen> with SingleTickerProviderStateMixin {
  late VlcPlayerController _vlcPlayerController;
  bool isPlaying = true;
  late AnimationController _animationController;
  late Animation<Offset> _offsetAnimation;
  bool isChannelListOpen = false;
  bool _isControlsVisible = true;
  Timer? _hideTimer;
  final LiveTVController _liveTVController = Get.put(LiveTVController());

  @override
  void initState() {
    super.initState();

    _vlcPlayerController = VlcPlayerController.network(
      widget.streamUrl,
      autoPlay: true,
    );

    _animationController = AnimationController(
      duration: const Duration(milliseconds: 200),
      vsync: this,
    );

    _offsetAnimation = Tween<Offset>(
      begin: const Offset(1.0, 0.0),
      end: Offset.zero,
    ).animate(_animationController);

    _startHideTimer();
    _liveTVController.fetchM3U();
  }

  void _startHideTimer() {
    _hideTimer?.cancel();
    _hideTimer = Timer(const Duration(seconds: 5), () {
      setState(() {
        _isControlsVisible = false;
      });
    });
  }

  void _resetHideTimer() {
    _startHideTimer();
    setState(() {
      _isControlsVisible = true;
    });
  }

  @override
  void dispose() {
    _vlcPlayerController.stop();
    _vlcPlayerController.dispose();
    _animationController.dispose();
    _hideTimer?.cancel();
    super.dispose();
  }

  void togglePlayPause() {
    setState(() {
      if (isPlaying) {
        _vlcPlayerController.pause();
      } else {
        _vlcPlayerController.play();
      }
      isPlaying = !isPlaying;
    });
  }

  void fastForward() {
    _vlcPlayerController.seekTo(Duration(seconds: _vlcPlayerController.value.position.inSeconds + 10));
  }

  void rewind() {
    _vlcPlayerController.seekTo(Duration(seconds: _vlcPlayerController.value.position.inSeconds - 10));
  }

  void openChannelList() {
    setState(() {
      isChannelListOpen = true;
    });
    _animationController.forward();
  }

  // void openSettings() {
  //   setState(() {
  //     isChannelListOpen = false;
  //   });
  //   _animationController.forward();
  // }

  void closeSidePanel() {
    _animationController.reverse();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        _vlcPlayerController.stop();
        _vlcPlayerController.dispose();
        return true;
      },
      child: GestureDetector(
        onTap: _resetHideTimer,
        child: Scaffold(
          body: Stack(
            children: [
              Positioned.fill(
                child: VlcPlayer(
                  controller: _vlcPlayerController,
                  aspectRatio: 16 / 9,
                  placeholder: Center(child: CircularProgressIndicator()),
                ),
              ),
              if (_isControlsVisible) ...[
                Positioned(
                  top: 20.h,
                  left: 20.w,
                  child: Row(
                    children: [
                      const BackButtonWidget(),
                      SizedBox(width: 2.w),
                      Image.asset(VoidImages.logo, height: 70.h),
                    ],
                  ),
                ),
                Positioned(
                  bottom: 150.h,
                  left: 20.w,
                  right: 20.w,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        icon: Icon(Icons.fast_rewind_outlined, color: Colors.white, size: 40.h),
                        onPressed: rewind,
                      ),
                      SizedBox(width: 20.w),
                      IconButton(
                        icon: Icon(
                          isPlaying ? Icons.pause_circle_sharp : Icons.play_circle_fill_sharp,
                          color: Theme.of(context).colorScheme.primary,
                          size: 70.h,
                        ),
                        onPressed: togglePlayPause,
                      ),
                      SizedBox(width: 20.w),
                      IconButton(
                        icon: Icon(Icons.fast_forward_outlined, color: Colors.white, size: 40.h),
                        onPressed: fastForward,
                      ),
                    ],
                  ),
                ),
                Positioned(
                  top: 20.h,
                  right: 20.w,
                  child: Row(
                    children: [
                      // IconButton(
                      //   icon: Icon(Icons.settings_suggest_outlined, color: Colors.white, size: 30.h),
                      //   onPressed: openSettings,
                      // ),
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
                                style: TextStyle(color: Colors.white, fontSize: 8.sp),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                if (_vlcPlayerController.value.duration != null && _vlcPlayerController.value.duration.inSeconds > 0) ...[
                  Positioned(
                    bottom: 40.h,
                    left: 0,
                    right: 0,
                    child: Slider(
                      value: _vlcPlayerController.value.position.inSeconds.toDouble(),
                      min: 0,
                      max: _vlcPlayerController.value.duration.inSeconds.toDouble(),
                      onChanged: (value) {
                        _vlcPlayerController.seekTo(Duration(seconds: value.toInt()));
                      },
                      activeColor: Theme.of(context).colorScheme.primary,
                      inactiveColor: VoidColors.whiteColor,
                    ),
                  ),
                  Positioned(
                    bottom: 20.h,
                    left: 20.w,
                    child: Text(
                      formatDuration(_vlcPlayerController.value.position),
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  Positioned(
                    bottom: 20.h,
                    right: 20.w,
                    child: Text(
                      formatDuration(_vlcPlayerController.value.duration),
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ],
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
                              ? Obx(() {
                            if (_liveTVController.isLoading.value) {
                              return Center(child: CircularProgressIndicator());
                            }
                            if (_liveTVController.entries.isEmpty) {
                              return Center(child: Text('No channels available', style: TextStyle(color: Colors.white)));
                            }
                            return ListView.builder(
                              padding: EdgeInsets.all(20.w),
                              itemCount: _liveTVController.entries.length,
                              itemBuilder: (context, index) {
                                final channel = _liveTVController.entries[index];
                                return ListTile(
                                 // leading: Image.network(channel.logo),

                                  title: Text(channel.displayName ?? "No name", style: TextStyle(color: Colors.white, fontSize: 10.sp)),
                                  onTap: () {
                                    setState(() {
                                      _vlcPlayerController.setMediaFromNetwork(channel.url);
                                      closeSidePanel();
                                    });
                                  },
                                );
                              },
                            );
                          })
                              : ListView(
                            padding: EdgeInsets.all(20.w),
                            children: [
                              // Text(
                              //   'Settings',
                              //   style: TextStyle(
                              //       color: Colors.white, fontSize: 10.sp, fontWeight: FontWeight.bold),
                              //   textAlign: TextAlign.center,
                              // ),
                             // SizedBox(height: 20.h),
                              // SwitchListTile(
                              //   title: Text('Active Subtitles', style: TextStyle(color: Colors.white, fontSize: 8.sp)),
                              //   value: true,
                              //   onChanged: (bool value) {},
                              // ),
                              // ListTile(
                              //   title: Text('Themes', style: TextStyle(color: Colors.white, fontSize: 8.sp)),
                              //   trailing: DropdownButton<String>(
                              //     dropdownColor: VoidColors.primary,
                              //     items: <String>['Dark', 'Light'].map((String value) {
                              //       return DropdownMenuItem<String>(
                              //         value: value,
                              //         child: Text(value, style: TextStyle(color: Colors.white)),
                              //       );
                              //     }).toList(),
                              //     onChanged: (_) {},
                              //   ),
                              // ),
                              // ListTile(
                              //   title: Text('Change Language', style: TextStyle(color: Colors.white, fontSize: 8.sp)),
                              //   trailing: DropdownButton<String>(
                              //     dropdownColor: VoidColors.primary,
                              //     items: <String>['English', 'Spanish', 'French'].map((String value) {
                              //       return DropdownMenuItem<String>(
                              //         value: value,
                              //         child: Text(value, style: TextStyle(color: Colors.white)),
                              //       );
                              //     }).toList(),
                              //     onChanged: (_) {},
                              //   ),
                              // ),
                             // SizedBox(height: 10.h),
                              // ElevatedButton(
                              //   onPressed: closeSidePanel,
                              //   style: ElevatedButton.styleFrom(
                              //     backgroundColor: VoidColors.primary,
                              //     padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 20.w),
                              //     shape: RoundedRectangleBorder(
                              //       borderRadius: BorderRadius.circular(8.0),
                              //     ),
                              //   ),
                              //   child: Text('Done', style: TextStyle(color: Colors.white, fontSize: 10.sp)),
                              // ),
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
