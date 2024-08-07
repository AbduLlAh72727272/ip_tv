import 'package:flutter/material.dart';
import 'package:flutter_vlc_player/flutter_vlc_player.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ip_tv/generated/locales.g.dart';
import '../../../utils/constraints/colors.dart';
import '../controllers/multiscreen_controller.dart';
import '../../../common/widgets/back_button_widget.dart';
import 'multiscreen_view2.dart';

class VlcPlayerWidget extends StatefulWidget {
  final String streamUrl;

  const VlcPlayerWidget({super.key, required this.streamUrl});

  @override
  _VlcPlayerWidgetState createState() => _VlcPlayerWidgetState();
}

class _VlcPlayerWidgetState extends State<VlcPlayerWidget> {
  late VlcPlayerController _vlcPlayerController;

  @override
  void initState() {
    super.initState();
    _vlcPlayerController = VlcPlayerController.network(
      widget.streamUrl,
      autoPlay: true,
      hwAcc: HwAcc.full,
    );
  }

  @override
  void dispose() {
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
        aspectRatio: 16 / 9,
        placeholder: Center(child: CircularProgressIndicator()),
      ),
    );
  }
}

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
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [VoidColors.blackColor, Theme.of(context).colorScheme.primary],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),
          Center(
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
                      : VlcPlayerWidget(streamUrl: url);
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}
