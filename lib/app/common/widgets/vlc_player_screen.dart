import 'package:flutter/material.dart';
import 'package:flutter_vlc_player/flutter_vlc_player.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
//import 'package:video_player_control_panel/video_player_control_panel.dart';

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
  double brightness = 0.5; // Placeholder for brightness control

  @override
  void initState() {
    super.initState();
    _vlcPlayerController = VlcPlayerController.network(
      widget.streamUrl,
      autoPlay: true,
    );
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
      // Implement volume control here
    });
  }

  void adjustBrightness(double value) {
    setState(() {
      brightness = value;
      // Implement brightness control here if possible
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
              icon: Image.asset(
                'assets/images/back_button.png',
                height: 40.h,
              ),
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
              icon: Icon(Icons.skip_previous, color: Colors.white),
              onPressed: rewind,
            ),
          ),
          Positioned(
            bottom: 60.h,
            right: 20.w,
            child: IconButton(
              icon: Icon(Icons.skip_next, color: Colors.white),
              onPressed: fastForward,
            ),
          ),
          Positioned(
            bottom: 60.h,
            left: 100.w,
            right: 100.w,
            child: IconButton(
              icon: Icon(
                isPlaying ? Icons.pause : Icons.play_arrow,
                color: Colors.red,
                size: 50.h,
              ),
              onPressed: togglePlayPause,
            ),
          ),
          Positioned(
            bottom: 20.h,
            left: 20.w,
            child: Row(
              children: [
                Icon(Icons.brightness_6, color: Colors.white),
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
                Icon(Icons.volume_up, color: Colors.white),
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
              activeColor: Colors.red,
              inactiveColor: Colors.grey,
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


