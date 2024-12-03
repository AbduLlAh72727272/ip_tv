import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ip_tv/app/utils/constraints/image_strings.dart';

class VPNRedControlWidget extends StatefulWidget {
  @override
  _VPNRedControlWidgetState createState() => _VPNRedControlWidgetState();
}

class _VPNRedControlWidgetState extends State<VPNRedControlWidget> {
  static const platform = MethodChannel('com.example/vpn');
  bool isVPNActive = false;

  Future<void> toggleVPN() async {
    try {
      if (isVPNActive) {
        await platform.invokeMethod('stopVPN');
        setState(() {
          isVPNActive = false;
        });
      } else {
        await platform.invokeMethod('startVPN', {'config': 'your-vpn-config'});
        setState(() {
          isVPNActive = true;
        });
      }
    } on PlatformException catch (e) {
      print("Failed to toggle VPN: '${e.message}'.");
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: toggleVPN,
      child: Image.asset(
        isVPNActive ? VoidImages.vpn_red : VoidImages.vpn_red,
        height: 30.0.h,
        width: 30.0.w,
      ),
    );
  }
}
