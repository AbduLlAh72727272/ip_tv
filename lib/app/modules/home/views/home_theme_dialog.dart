import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:ip_tv/generated/locales.g.dart';
import '../../../utils/constraints/image_strings.dart';
import '../../../utils/theme/homeTheme.dart';
import '../controllers/home_controller.dart';

// class SecHomeView extends GetView {
//   const SecHomeView({super.key});
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//      body: Stack(
//        children: [
//          Container(
//            decoration: const BoxDecoration(
//              image: DecorationImage(
//                image: AssetImage('assets/images/bg2.png'),
//                fit: BoxFit.cover,
//              ),
//            ),
//          ),
//           Center(
//            child: Column(
//              mainAxisAlignment: MainAxisAlignment.center,
//              children: [
//                Text(
//                    'Second home Screen'
//                ),
//                Padding(
//                  padding: EdgeInsets.all(8.0),
//                  child: GestureDetector(
//                    onTap: () {
//                      showHomeScreenDialog();
//                    },
//                      child: Image.asset('assets/icons/themes.png', height: 35.h, width: 15.w,)),
//                ),
//              ],
//            ),
//          ),
//
//        ],
//      ),
//     );
//   }
// }


void showHomeScreenDialog() {
  final HomeController homeController = Get.find();
  Get.defaultDialog(
    title: LocaleKeys.ChooseTheme.tr,
    content: Expanded(
      child: Column(
        children: [
          ElevatedButton(
            onPressed: () {
              homeController.switchHomeScreen(homeScreen1Theme);
              Get.back();
            },
            child: Row(mainAxisSize: MainAxisSize.min,
              children: [

                Image.asset(VoidImages.home1,height: 20.h,width: 20.h),
                Text("ARK VIP",style: TextStyle(
                  fontFamily: 'Arial',
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),),
              ],
            ),
          ),
          ElevatedButton(
            onPressed: () {
              homeController.switchHomeScreen(homeScreen2Theme);
              Get.back();
            },
            child: Row(mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset(VoidImages.home2,height: 20.h,width: 20.h),
                Text("ARK VIP",style: TextStyle(
                  fontFamily: 'Arial',
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),),
              ],
            ),
          ),
          ElevatedButton(
            onPressed: () {
              homeController.switchHomeScreen(homeScreen3Theme);
              Get.back();
            },
            child: Row(mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset(VoidImages.home3,height: 20.h,width: 20.h),
                Text("ARK VIP",style: TextStyle(
                  fontFamily: 'Arial',
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),),
              ],
            ),
          ),
          ElevatedButton(
            onPressed: () {
              homeController.switchHomeScreen(homeScreen4Theme);
              Get.back();
            },
            child:  Row(mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset(VoidImages.home3,height: 20.h,width: 20.h),
                Text("ARK VIP",style: TextStyle(
                  fontFamily: 'Arial',
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}

// class SettingsPage extends StatelessWidget {
//   final HomeController homeController = Get.find();
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('Settings')),
//       body: Column(
//         children: [
//           ElevatedButton(
//             onPressed: () {
//               homeController.switchHomeScreen(homeScreen1Theme);
//               Get.back();
//             },
//             child: Text('Home Screen 1'),
//           ),
//           ElevatedButton(
//             onPressed: () {
//               homeController.switchHomeScreen(homeScreen2Theme);
//               Get.back();
//             },
//             child: Text('Home Screen 2'),
//           ),
//           // Add more buttons for other home screens
//
//           Divider(),
//           Text('Change Global Theme Color:'),
//           ElevatedButton(
//             onPressed: () {
//               homeController.switchGlobalTheme(ThemeData(
//                 primaryColor: Colors.red,
//               ));
//             },
//             child: Text('Red Theme'),
//           ),
//           ElevatedButton(
//             onPressed: () {
//               homeController.switchGlobalTheme(ThemeData(
//                 primaryColor: Colors.orange,
//               ));
//             },
//             child: Text('Orange Theme'),
//           ),
//           // Add more buttons for other colors
//         ],
//       ),
//     );
//   }
// }
