import 'package:flutter/material.dart';
import 'package:flutter_vlc_player/flutter_vlc_player.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ip_tv/app/utils/constraints/colors.dart';
import 'package:volume_controller/volume_controller.dart';

class VlcPlayerScreen extends StatefulWidget {
  final String streamUrl;

  const VlcPlayerScreen({Key? key, required this.streamUrl}) : super(key: key);

  @override
  _VlcPlayerScreenState createState() => _VlcPlayerScreenState();
}

class _VlcPlayerScreenState extends State<VlcPlayerScreen> {
  late VlcPlayerController _vlcPlayerController;
  bool isPlaying = true;
  double volume = 0.5;
  double brightness = 0.5;

  @override
  void initState() {
    super.initState();
    _vlcPlayerController = VlcPlayerController.network(
      widget.streamUrl,
      autoPlay: true,
    );
    VolumeController().setVolume(volume);
    // Initialize brightness control if needed
  }

  @override
  void dispose() {
    _vlcPlayerController.dispose();
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

  void adjustVolume(double value) {
    setState(() {
      volume = value;
      VolumeController().setVolume(volume);
    });
  }

  void adjustBrightness(double value) {
    setState(() {
      brightness = value;
      // Implement platform-specific brightness control here if needed
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: VlcPlayer(
              controller: _vlcPlayerController,
              aspectRatio: 16 / 9,
              placeholder: Center(child: CircularProgressIndicator()),
            ),
          ),
          Positioned(
            top: 20.h,
            left: 20.w,
            child: IconButton(
              icon: Icon(Icons.arrow_back, color: Colors.white, size: 40.h),
              onPressed: () => Navigator.pop(context),
            ),
          ),
          Positioned(
            top: 20.h,
            right: 20.w,
            child: Image.asset(
              'assets/images/iptv logo.png',
              height: 40.h,
            ),
          ),
          Positioned(
            bottom: 60.h,
            left: 20.w,
            child: IconButton(
              icon: Icon(Icons.fast_rewind_outlined, color: Colors.white, size: 40.h),
              onPressed: rewind,
            ),
          ),
          Positioned(
            bottom: 60.h,
            right: 20.w,
            child: IconButton(
              icon: Icon(Icons.fast_forward_outlined, color: Colors.white, size: 40.h),
              onPressed: fastForward,
            ),
          ),
          Positioned(
            bottom: 60.h,
            left: 100.w,
            right: 100.w,
            child: IconButton(
              icon: Icon(
                isPlaying ? Icons.pause_circle_sharp : Icons.play_circle_fill_sharp,
                color: VoidColors.primary,
                size: 70.h,
              ),
              onPressed: togglePlayPause,
            ),
          ),
          Positioned(
            bottom: 20.h,
            left: 20.w,
            child: Row(
              children: [
                Icon(Icons.brightness_6, color: Colors.white, size: 30.h),
                Slider(
                  value: brightness,
                  min: 0,
                  max: 1,
                  onChanged: adjustBrightness,
                  activeColor: Colors.white,
                  inactiveColor: Colors.grey,
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 20.h,
            right: 20.w,
            child: Row(
              children: [
                Icon(Icons.volume_up, color: Colors.white, size: 30.h),
                Slider(
                  value: volume,
                  min: 0,
                  max: 1,
                  onChanged: adjustVolume,
                  activeColor: Colors.white,
                  inactiveColor: Colors.grey,
                ),
              ],
            ),
          ),
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
              activeColor: VoidColors.primary,
              inactiveColor: VoidColors.white,
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
