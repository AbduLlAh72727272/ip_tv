// import 'package:flutter/material.dart';
// import 'package:flutter_vlc_player/flutter_vlc_player.dart';
// import 'package:get/get.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import '../../../common/widgets/back_button_widget.dart';
// import '../../../utils/constraints/image_strings.dart';
// import '../controllers/multiscreen_controller.dart';
// import 'multiscreen_view2.dart';
//
// class MultiscreenView extends GetView<MultiscreenController> {
//   MultiscreenView({super.key});
//
//   final MultiscreenController multiScreenController = Get.put(MultiscreenController());
//
//   @override
//   Widget build(BuildContext context) {
//
//     return Scaffold(
//       backgroundColor: Colors.black,
//       appBar: PreferredSize(
//         preferredSize: Size.fromHeight(40.h),
//         child: AppBar(
//           backgroundColor: Colors.black,
//           automaticallyImplyLeading: false,
//           leading: const BackButtonWidget(),
//           // leading: IconButton(
//           //   icon: Image.asset(VoidImages.back),
//           //   onPressed: () {
//           //     Get.back(); // Navigate back
//           //   },
//           // ),
//           title: Text('Multi Screen Layout', style: TextStyle(color: Colors.white)),
//         ),
//       ),
//       body: Stack(
//         children: [
//           // Gradient background
//           Container(
//             decoration: BoxDecoration(
//               gradient: LinearGradient(
//                 colors: [Colors.black, Theme.of(context).colorScheme.primary],
//                 begin: Alignment.topCenter,
//                 end: Alignment.bottomCenter,
//               ),
//             ),
//           ),
//           // Multi-screen grid
//           Center(
//             child:
//               GridView.builder(
//                 padding: EdgeInsets.all(16.w),
//                 gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                   crossAxisCount: 2,
//                   crossAxisSpacing: 16.w,
//                   mainAxisSpacing: 16.h,
//                   childAspectRatio: 2,
//                 ),
//                 itemCount: 4,
//                 itemBuilder: (context, index) {
//                   return
//                     VlcPlayerWidget(streamUrl: );
//                   // if (index > controller.selectedUrls.length) {
//                   //   return VlcPlayerWidget(streamUrl: controller.selectedUrls[index]);
//                   // }
//                   // else {
//                   //   return GestureDetector(
//                   //     onTap: () {
//                   //       // Get.to(() => MultiscreenView2());
//                   //       Get.to(() => MultiscreenView2(initialIndex: index));
//                   //     },
//                       child: Container(
//                         decoration: BoxDecoration(
//                           color: Theme.of(context).colorScheme.primary,
//                           borderRadius: BorderRadius.circular(10.r),
//                         ),
//                         child: Center(
//                           child: Icon(Icons.add_circle, color: Colors.white, size: 50.sp),
//                         ),
//                       ),
//                   //   );
//                   // }
//                 },
//               ),
//           ),
//         ],
//       ),
//     );
//   }
// }
//
//
//
// class VlcPlayerWidget extends StatefulWidget {
//   final String streamUrl;
//
//   const VlcPlayerWidget({Key? key, required this.streamUrl}) : super(key: key);
//
//   @override
//   _VlcPlayerWidgetState createState() => _VlcPlayerWidgetState();
// }
//
// class _VlcPlayerWidgetState extends State<VlcPlayerWidget> {
//   late VlcPlayerController _vlcPlayerController;
//
//   @override
//   void initState() {
//     super.initState();
//     _vlcPlayerController = VlcPlayerController.network(
//       widget.streamUrl,
//       autoPlay: true,
//     );
//   }
//
//   @override
//   void dispose() {
//     _vlcPlayerController.stop();
//     _vlcPlayerController.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       decoration: BoxDecoration(
//         border: Border.all(color: Colors.black),
//         borderRadius: BorderRadius.circular(8.0),
//       ),
//       child: VlcPlayer(
//         controller: _vlcPlayerController,
//         aspectRatio: 16 / 9,
//         placeholder: Center(child: CircularProgressIndicator()),
//       ),
//     );
//   }
// }
//
//
// //
// // import 'package:flutter/material.dart';
// // import 'package:flutter_screenutil/flutter_screenutil.dart';
// // import 'package:flutter_vlc_player/flutter_vlc_player.dart';
// //
// // class MultiscreenView extends StatelessWidget {
// //   MultiscreenView({Key? key,}) : super(key: key);
// //
// //   final List<String> streamUrls = [
// //     'https://media.w3.org/2010/05/sintel/trailer.mp4',
// //     'https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4',
// //     'https://media.w3.org/2010/05/sintel/trailer.mp4',
// //     'https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4'
// //   ];
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(
// //         title: Text('Multi VLC Player'),
// //       ),
// //       body: Padding(
// //         padding: EdgeInsets.all(8.0),
// //         child: GridView.builder(
// //           gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
// //             crossAxisCount: 3, // Number of videos per row
// //             crossAxisSpacing: 8.0,
// //             mainAxisSpacing: 8.0,
// //           ),
// //           itemCount: streamUrls.length,
// //           itemBuilder: (context, index) {
// //             return VlcPlayerWidget(streamUrl: streamUrls[index]);
// //           },
// //         ),
// //       ),
// //     );
// //   }
// // }
// //
// // class VlcPlayerWidget extends StatefulWidget {
// //   final String streamUrl;
// //
// //   const VlcPlayerWidget({Key? key, required this.streamUrl}) : super(key: key);
// //
// //   @override
// //   _VlcPlayerWidgetState createState() => _VlcPlayerWidgetState();
// // }
// //
// // class _VlcPlayerWidgetState extends State<VlcPlayerWidget> {
// //   late VlcPlayerController _vlcPlayerController;
// //
// //   @override
// //   void initState() {
// //     super.initState();
// //     _vlcPlayerController = VlcPlayerController.network(
// //       widget.streamUrl,
// //       autoPlay: true,
// //     );
// //   }
// //
// //   @override
// //   void dispose() {
// //     _vlcPlayerController.stop();
// //     _vlcPlayerController.dispose();
// //     super.dispose();
// //   }
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return Container(
// //       decoration: BoxDecoration(
// //         border: Border.all(color: Colors.black),
// //         borderRadius: BorderRadius.circular(8.0),
// //       ),
// //       child: VlcPlayer(
// //         controller: _vlcPlayerController,
// //         aspectRatio: 16 / 9,
// //         placeholder: Center(child: CircularProgressIndicator()),
// //       ),
// //     );
// //   }
// // }
//



import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vlc_player/flutter_vlc_player.dart';
import 'package:get/get.dart';

import '../../../../generated/locales.g.dart';
import '../../../common/widgets/back_button_widget.dart';
import '../../../utils/constraints/colors.dart';
import '../controllers/multiscreen_controller.dart';
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
          title: Text(LocaleKeys.MultiScreenLayout.tr, style: const TextStyle(color: VoidColors.whiteColor)),
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
          child: GridView.builder(
            padding: EdgeInsets.all(16.w),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 16.w,
              mainAxisSpacing: 16.h,
              childAspectRatio: 2,
            ),
            itemCount: 4,
            itemBuilder: (context, index) {
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
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.primary,
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                    child: Center(
                      child: Icon(Icons.add_circle, color: Colors.white, size: 50.sp),
                    ),
                  ),
                )
                    : VlcPlayerWidget(
                  key: ValueKey(url), // Ensure unique keys
                  streamUrl: url,
                  controller: multiScreenController.controllers[index]!,
                );
              });
            },
          ),
        ),
      ),
    );
  }
}

class VlcPlayerWidget extends StatefulWidget {
  final String streamUrl;
  final VlcPlayerController controller;

  const VlcPlayerWidget({super.key, required this.streamUrl, required this.controller});

  @override
  _VlcPlayerWidgetState createState() => _VlcPlayerWidgetState();
}

class _VlcPlayerWidgetState extends State<VlcPlayerWidget> {
  late VlcPlayerController _vlcPlayerController;

  @override
  void initState() {
    super.initState();
    _vlcPlayerController = widget.controller;

    _vlcPlayerController.addListener(() {
      print('VLC Player Controller State: ${_vlcPlayerController.value}');
    });
  }

  @override
  void dispose() {
    print('Disposing VLC Player Controller for URL: ${widget.streamUrl}');
    _vlcPlayerController.stop();
    _vlcPlayerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: VlcPlayer(
        controller: _vlcPlayerController,
        aspectRatio: 16 / 10,
        placeholder: Center(child: CircularProgressIndicator()),
      ),
    );
  }
}


// import 'package:fijkplayer/fijkplayer.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:flutter_vlc_player/flutter_vlc_player.dart';
// import 'package:ip_tv/generated/locales.g.dart';
// import '../../../utils/constraints/colors.dart';
// import '../controllers/multiscreen_controller.dart';
// import '../../../common/widgets/back_button_widget.dart';
// import 'multiscreen_view2.dart';
//
// class MultiscreenView extends GetView<MultiscreenController> {
//   const MultiscreenView({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     final MultiscreenController multiScreenController = Get.put(MultiscreenController());
//
//     return Scaffold(
//       backgroundColor: Colors.black,
//       appBar: PreferredSize(
//         preferredSize: Size.fromHeight(40.h),
//         child: AppBar(
//           backgroundColor: Colors.black,
//           automaticallyImplyLeading: false,
//           leading: const BackButtonWidget(),
//           title: Text(LocaleKeys.MultiScreenLayout.tr, style: const TextStyle(color: VoidColors.whiteColor)),
//         ),
//       ),
//       body: Container(
//         decoration: BoxDecoration(
//           gradient: LinearGradient(
//             colors: [VoidColors.blackColor, Theme.of(context).colorScheme.primary],
//             begin: Alignment.topCenter,
//             end: Alignment.bottomCenter,
//           ),
//         ),
//         child:   Center(
//           child: GridView.builder(
//             padding: EdgeInsets.all(16.w),
//             gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//               crossAxisCount: 2,
//               crossAxisSpacing: 16.w,
//               mainAxisSpacing: 16.h,
//               childAspectRatio: 2,
//             ),
//             itemCount: 4,
//             itemBuilder: (context, index) {
//               return Obx(() {
//                 final url = multiScreenController.selectedUrls[index];
//                 return url == null
//                     ? GestureDetector(
//                   onTap: () async {
//                     final selectedUrl = await Get.to(() => MultiscreenView2(initialIndex: index));
//                     if (selectedUrl != null) {
//                       multiScreenController.updateUrl(index, selectedUrl);
//                     }
//                   },
//                   child: Container(
//                     decoration: BoxDecoration(
//                       color: Theme.of(context).colorScheme.primary,
//                       borderRadius: BorderRadius.circular(10.r),
//                     ),
//                     child: Center(
//                       child: Icon(Icons.add_circle, color: Colors.white, size: 50.sp),
//                     ),
//                   ),
//                 )
//                     : VlcPlayerWidget(streamUrl: url);
//               });
//             },
//           ),
//         ),
//       ),
//     );
//   }
// }
//
//
// class VlcPlayerWidget extends StatefulWidget {
//   final String streamUrl;
//
//   const VlcPlayerWidget({super.key, required this.streamUrl});
//
//   @override
//   _VlcPlayerWidgetState createState() => _VlcPlayerWidgetState();
// }
//
// class _VlcPlayerWidgetState extends State<VlcPlayerWidget> {
//   late VlcPlayerController _vlcPlayerController;
//
//   @override
//   void initState() {
//     super.initState();
//     _vlcPlayerController = VlcPlayerController.network(
//       widget.streamUrl,
//       autoPlay: true,
//       allowBackgroundPlayback: true,
//     );
//
//     _vlcPlayerController.addListener(() {
//       print('VLC Player Controller State: ${_vlcPlayerController.value}');
//     });
//   }
//
//   @override
//   void dispose() {
//     print('Disposing VLC Player Controller for URL: ${widget.streamUrl}');
//     _vlcPlayerController.startRendererScanning();
//     _vlcPlayerController.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       decoration: BoxDecoration(
//         border: Border.all(color: Colors.black),
//         borderRadius: BorderRadius.circular(8.0),
//       ),
//       child: VlcPlayer(
//         controller: _vlcPlayerController,
//         aspectRatio: 16 / 10,
//         placeholder: Center(child: CircularProgressIndicator()),
//       ),
//     );
//   }
// }




// class FijkPlayerWidget extends StatefulWidget {
//   final String streamUrl;
//
//   const FijkPlayerWidget({Key? key, required this.streamUrl}) : super(key: key);
//
//   @override
//   _FijkPlayerWidgetState createState() => _FijkPlayerWidgetState();
// }
//
// class _FijkPlayerWidgetState extends State<FijkPlayerWidget> {
//   late FijkPlayer _fijkPlayer;
//   bool isMuted = false;
//
//   @override
//   void initState() {
//     super.initState();
//     _fijkPlayer = FijkPlayer();
//     _fijkPlayer.setDataSource(widget.streamUrl, autoPlay: true);
//   }
//
//   @override
//   void dispose() {
//     _fijkPlayer.release();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         Expanded(
//           child: FijkView(
//             player: _fijkPlayer,
//             fit: FijkFit.cover,
//             color: Colors.black,
//           ),
//         ),
//         Row(
//           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//           children: [
//             IconButton(
//               icon: Icon(Icons.play_arrow),
//               onPressed: () {
//                 _fijkPlayer.start();
//               },
//             ),
//             IconButton(
//               icon: Icon(Icons.pause),
//               onPressed: () {
//                 _fijkPlayer.pause();
//               },
//             ),
//             IconButton(
//               icon: Icon(isMuted ? Icons.volume_off : Icons.volume_up),
//               onPressed: () {
//                 if (isMuted) {
//                   _fijkPlayer.setVolume(1.0);
//                 } else {
//                   _fijkPlayer.setVolume(0.0);
//                 }
//                 setState(() {
//                   isMuted = !isMuted;
//                 });
//               },
//             ),
//           ],
//         ),
//       ],
//     );
//   }
// }


// class VlcPlayerWidget extends StatefulWidget {
//   final String streamUrl;
//
//   const VlcPlayerWidget({super.key, required this.streamUrl});
//
//   @override
//   _VlcPlayerWidgetState createState() => _VlcPlayerWidgetState();
// }
//
// class _VlcPlayerWidgetState extends State<VlcPlayerWidget> {
//   late VlcPlayerController _vlcPlayerController;
//
//   @override
//   void initState() {
//     super.initState();
//     _vlcPlayerController = VlcPlayerController.network(
//       widget.streamUrl,
//       autoPlay: true,
//       hwAcc: HwAcc.full,
//     );
//   }
//
//   @override
//   void dispose() {
//     _vlcPlayerController.stop();
//     _vlcPlayerController.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       decoration: BoxDecoration(
//         border: Border.all(color: Colors.black),
//         borderRadius: BorderRadius.circular(8.0),
//       ),
//       child: VlcPlayer(
//         controller: _vlcPlayerController,
//         aspectRatio: 16 / 10,
//         placeholder: Center(child: CircularProgressIndicator()),
//       ),
//     );
//   }
// }
//
