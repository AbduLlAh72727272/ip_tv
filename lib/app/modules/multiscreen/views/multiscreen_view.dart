import 'package:flutter/material.dart';
import 'package:flutter_vlc_player/flutter_vlc_player.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ip_tv/generated/locales.g.dart';
import '../../../utils/constraints/colors.dart';
import '../controllers/multiscreen_controller.dart';
import '../../../common/widgets/back_button_widget.dart';
import 'multiscreen_view2.dart';

class MultiscreenView extends GetView<MultiscreenController> {
  const MultiscreenView({super.key});

  @override
  Widget build(BuildContext context) {
    final MultiscreenController multiScreenController = Get.put(MultiscreenController());

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(40.h),
        child: AppBar(
          backgroundColor: Colors.black,
          automaticallyImplyLeading: false,
          leading: const BackButtonWidget(),
          title: Text(LocaleKeys.MultiScreenLayout.tr, style: TextStyle(color: VoidColors.whiteColor)),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [VoidColors.blackColor, Theme.of(context).colorScheme.primary],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: List.generate(2, (index) {
              return Obx(() {
                final url = multiScreenController.selectedUrls[index];
                return url == null
                    ? GestureDetector(
                  onTap: () async {
                    final selectedUrl = await Get.to(() => MultiscreenView2(initialIndex: index));
                    if (selectedUrl != null) {
                      multiScreenController.updateUrl(index, selectedUrl);
                    }
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.45,
                    height: MediaQuery.of(context).size.height * 0.8,
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.primary,
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                    child: Center(
                      child: Icon(Icons.add_circle, color: Colors.white, size: 50.sp),
                    ),
                  ),
                )
                    : VlcPlayerWidget(streamUrl: url, index: index);
              });
            }),
          ),
        ),
      ),
    );
  }
}

class VlcPlayerWidget extends StatefulWidget {
  final String streamUrl;
  final int index;

  const VlcPlayerWidget({super.key, required this.streamUrl, required this.index});

  @override
  _VlcPlayerWidgetState createState() => _VlcPlayerWidgetState();
}

class _VlcPlayerWidgetState extends State<VlcPlayerWidget> {
  late VlcPlayerController _vlcPlayerController;
  RxBool isBuffering = true.obs;
  RxBool isEnded = false.obs;
  RxBool paused = true.obs;
  RxDouble bufferPercent = 0.0.obs;
  RxBool isMuted = false.obs;

  @override
  void initState() {
    super.initState();
    _vlcPlayerController = VlcPlayerController.network(
      widget.streamUrl,
      autoPlay: true,
      allowBackgroundPlayback: true,
      onInit: () {
        _vlcPlayerController.addListener(_onPlayerStateChanged);
      },
    );

    _vlcPlayerController.addListener(() {
      setState(() {
        bufferPercent.value = _vlcPlayerController.value.bufferPercent;
      });

      if (_vlcPlayerController.value.playingState == PlayingState.ended) {
        _vlcPlayerController.stop();
        _vlcPlayerController.play();
      }
    });
  }

  void _onPlayerStateChanged() {
    if (_vlcPlayerController.value.isBuffering || _vlcPlayerController.value.isEnded) {
      isBuffering.value = true;
      isEnded.value = true;
    } else {
      isBuffering.value = false;
      isEnded.value = false;
    }
  }

  void _toggleMute() {
    if (isMuted.value) {
      _vlcPlayerController.setVolume(100);
    } else {
      _vlcPlayerController.setVolume(0);
    }
    isMuted.value = !isMuted.value;
  }

  @override
  void dispose() {
    print('Disposing VLC Player Controller for URL: ${widget.streamUrl}');
    _vlcPlayerController.removeListener(_onPlayerStateChanged);
    _vlcPlayerController.stop();
    _vlcPlayerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: MediaQuery.of(context).size.width * 0.45,
          height: MediaQuery.of(context).size.height * 0.8,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.black),
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: VlcPlayer(
            controller: _vlcPlayerController,
            aspectRatio: 16 / 10,
            placeholder: Center(child: CircularProgressIndicator()),
          ),
        ),
        Obx(() {
          return isBuffering.value || isEnded.value
              ? Positioned.fill(
            child: Center(
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
              ),
            ),
          )
              : SizedBox.shrink();
        }),
        Obx(() {
          return Positioned(
            bottom: 10,
            right: 10,
            child: Text(
              'Buffering: ${(bufferPercent.value * 100).toStringAsFixed(2)}%',
              style: TextStyle(color: Colors.white, fontSize: 7.sp),
            ),
          );
        }),
        Positioned(
          top: 10,
          right: 10,
          child: IconButton(
            icon: Icon(isMuted.value ? Icons.volume_off : Icons.volume_up, color: Colors.white),
            onPressed: _toggleMute,
          ),
        ),
      ],
    );
  }
}
