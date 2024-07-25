import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:ip_tv/app/utils/extensions/cap_extension.dart';

import '../../../../generated/locales.g.dart';
import '../../../utils/constraints/colors.dart';
import '../controllers/select_language_controller.dart';




class SelectLanguageView extends StatefulWidget {
  const SelectLanguageView({super.key,});

  @override
  State<SelectLanguageView> createState() => _ChangeLanguageSheet();
}

class _ChangeLanguageSheet extends State<SelectLanguageView> {
  int selected = 0;
  var selectLanguage = LocaleKeys.English.tr;
  SelectLanguageController languageController = Get.put(SelectLanguageController());

  @override
  void initState() {
    selectLanguage = languageController.currentLanguage.value.toLanguage;
    log(selectLanguage);
    if (selectLanguage == LocaleKeys.English.tr) {
      selected = 0;

      log(selected.toString());
    } else {
      selected = 1;
    }
    setState(() {});
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: const Color(0xffFAFAFA),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20.r),
            topRight: Radius.circular(20.r),
          )),
      // width: 200.w,
      child: SingleChildScrollView(
        child: Column(
          // mainAxisSize: MainAxisSize.min,
          mainAxisSize: MainAxisSize.max,
          children: [
            Padding(
              padding: EdgeInsets.only(left: 20.w, top: 20.h, right: 20.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        LocaleKeys.SelectLanguage.tr,
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 18.sp,
                          color: const Color(0xFF000000),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  GestureDetector(
                    onTap: () async {
                      setState(() {
                        selected = 0;
                      });
                      selectLanguage = LocaleKeys.English.tr;
                      await SelectLanguageController()
                          .changeLanguage(selectLanguage.toCode);

                      Get.updateLocale(Locale(selectLanguage.toCode,
                          selectLanguage.toCode.toUpperCase()));
                      setState(() {});
                      // Get.back();
                      // Get.back();
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: 20.w, vertical: 15.h),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.r),
                        color: selected == 0
                            ? const Color(0xff064DAE).withOpacity(0.12)
                            : Colors.white,
                        border: Border.all(
                          color: selected == 0
                              ? const Color(0xff064DAE)
                              : Colors.black.withOpacity(0.1),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            LocaleKeys.English.tr,
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 14.sp,
                              color: selected == 0
                                  ? const Color(0xff064DAE)
                                  : const Color(0xFF0A1828),
                            ),
                          ),
                          selected == 0
                              ? Icon(
                            Icons.check,
                            color: const Color(0xff064DAE),
                            size: 20.sp,
                          )
                              : Container()
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  GestureDetector(
                    onTap: () async {
                      setState(() {
                        selected = 1;
                      });
                      selectLanguage = LocaleKeys.Spanish.tr;
                      await SelectLanguageController()
                          .changeLanguage(selectLanguage.toCode);

                      Get.updateLocale(Locale(selectLanguage.toCode,
                          selectLanguage.toCode.toUpperCase()));
                      setState(() {});
                      // Get.back();
                      // Get.back();
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: 20.w, vertical: 15.h),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.r),
                        color: selected == 1
                            ? const Color(0xff064DAE).withOpacity(0.12)
                            : Colors.white,
                        border: Border.all(
                          color: selected == 1
                              ? const Color(0xff064DAE)
                              : Colors.black.withOpacity(0.1),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            LocaleKeys.Spanish.tr,
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 14.sp,
                              color: selected == 1
                                  ? const Color(0xff064DAE)
                                  : const Color(0xFF0A1828),
                            ),
                          ),
                          selected == 1
                              ? Icon(
                            Icons.check,
                            color: const Color(0xff064DAE),
                            size: 20.sp,
                          )
                              : Container()
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// class SelectLanguageView extends StatefulWidget {
//   SelectLanguageView({super.key});
//
//   @override
//   State<SelectLanguageView> createState() => _SelectLanguageViewState();
// }
//
// class _SelectLanguageViewState extends State<SelectLanguageView> {
//   final List<Map<String, String>> languages = [
//     {'flag': 'assets/images/englishFlag.png', 'language': 'English', 'code': 'en'},
//     {'flag': 'assets/images/spanishFlag.png', 'language': 'Spanish', 'code': 'es'},
//     // Add other languages here
//     // {'flag': 'assets/images/flag_india.png', 'language': 'Hindi', 'code': 'hi'},
//     // {'flag': 'assets/images/flag_portugal.png', 'language': 'Portuguese', 'code': 'pt'},
//     // {'flag': 'assets/images/flag_turkey.png', 'language': 'Turkish', 'code': 'tr'},
//     // {'flag': 'assets/images/flag_armenia.png', 'language': 'Armenian', 'code': 'hy'},
//     // {'flag': 'assets/images/flag_france.png', 'language': 'French', 'code': 'fr'},
//   ];
//   final SelectLanguageController languageController = Get.put(SelectLanguageController());
//   var selectLanguage = LocaleKeys.English.tr;
//
//   @override
//   void initState() {
//     super.initState();
//     selectLanguage = languageController.currentLanguage.value.toLanguage;
//     languageController.loadSavedLanguage();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return  Scaffold(
//       appBar: PreferredSize(
//         preferredSize: Size.fromHeight(40.h),
//         child: AppBar(
//           // backgroundColor: VoidColors.redColor,
//           automaticallyImplyLeading: false,
//           leading: IconButton(
//             icon: Icon(Icons.arrow_back, color: Colors.white),
//             onPressed: () {
//
//             },
//           ),
//           title: Text('Select Language', style: TextStyle(color: Colors.white)),
//         ),
//       ),
//       body:   // Language selection content
//       Center(
//         child: Container(
//           width: 300.w, // Adjusted width using ScreenUtil
//           padding: EdgeInsets.all(16.0.w), // Adjusted padding using ScreenUtil
//           decoration: BoxDecoration(
//             color: Colors.black.withOpacity(0.5),
//             borderRadius: BorderRadius.circular(10.r), // Adjusted border radius using ScreenUtil
//           ),
//           child: SingleChildScrollView(
//             child: Column(
//               mainAxisSize: MainAxisSize.min,
//               children: [
//                 ...languages.map((language) => Obx(() =>
//                   Container(
//                     margin: EdgeInsets.symmetric(vertical: 5.h), // Adjusted margin using ScreenUtil
//                     decoration: BoxDecoration(
//                       // color: Colors.grey.withOpacity(0.5),
//                       color:  languageController.currentLanguage.value == language['code']
//                           ? Colors.blue.withOpacity(0.5)
//                           : Colors.grey.withOpacity(0.5),
//                       borderRadius: BorderRadius.circular(5.r), // Adjusted border radius using ScreenUtil
//                     ),
//                     child: ListTile(
//                       leading: Image.asset(
//                         language['flag']!,
//                         height: 30.h,
//                       ),
//                       title: Text(
//                         language['language']!,
//                         style: TextStyle(color: Colors.white, fontSize: 14.sp),
//                       ),
//                       onTap: () async {
//                         // languageController.changeLanguage(language['code']!);
//                         await languageController
//                             .changeLanguage(selectLanguage.toCode);
//
//                         Get.updateLocale(Locale(selectLanguage.toCode,
//                             selectLanguage.toCode.toUpperCase()));
//                         setState(() {
//
//                         });
//                       },
//                     ),
//                   ),
//                 )),
//                 SizedBox(height: 20.h),
//                 Align(
//                   alignment: Alignment.bottomRight,
//                   child: ElevatedButton(
//                     onPressed: () {
//                       // Add your next button functionality here
//                     },
//                     style: ElevatedButton.styleFrom(
//                       backgroundColor: VoidColors.redColor,
//                       padding: EdgeInsets.symmetric(vertical: 15.h, horizontal: 30.w),
//                       textStyle: TextStyle(fontSize: 14.sp),
//                     ),
//                     child: Text(LocaleKeys.Next.tr, style: TextStyle(color: Colors.white)),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }


// class SelectLanguageView extends GetView<SelectLanguageController> {
//    SelectLanguageView({super.key});
//
//   final List<Map<String, String>> languages = [
//     {'flag': 'assets/images/englishFlag.png', 'language': 'English'},
//     {'flag': 'assets/images/spanishFlag.png', 'language': 'Spanish'},
//   //   {'flag': 'assets/images/flag_india.png', 'language': 'Hindi'},
//   //   {'flag': 'assets/images/flag_portugal.png', 'language': 'Portuguese'},
//   //   {'flag': 'assets/images/flag_spain.png', 'language': 'Spanish'},
//   //   {'flag': 'assets/images/flag_turkey.png', 'language': 'Turkish'},
//   //   {'flag': 'assets/images/flag_armenia.png', 'language': 'Armenian'},
//   //   {'flag': 'assets/images/flag_brazil.png', 'language': 'Portuguese'},
//   ];
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: PreferredSize(
//         preferredSize: Size.fromHeight(40.h),
//         child: AppBar(
//           // backgroundColor: VoidColors.redColor,
//           automaticallyImplyLeading: false,
//           leading: IconButton(
//             icon: Icon(Icons.arrow_back, color: Colors.white),
//             onPressed: () {
//
//             },
//           ),
//           title: Text('Select Language', style: TextStyle(color: Colors.white)),
//         ),
//       ),
//       body:   // Language selection content
//       Center(
//         child: Container(
//           width: 300.w, // Adjusted width using ScreenUtil
//           padding: EdgeInsets.all(16.0.w), // Adjusted padding using ScreenUtil
//           decoration: BoxDecoration(
//             color: Colors.black.withOpacity(0.5),
//             borderRadius: BorderRadius.circular(10.r), // Adjusted border radius using ScreenUtil
//           ),
//           child: Column(
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               ...languages.map((language) => Container(
//                 margin: EdgeInsets.symmetric(vertical: 5.h), // Adjusted margin using ScreenUtil
//                 decoration: BoxDecoration(
//                   color: Colors.grey.withOpacity(0.5),
//                   borderRadius: BorderRadius.circular(5.r), // Adjusted border radius using ScreenUtil
//                 ),
//                 child: ListTile(
//                   leading: Image.asset(
//                     language['flag']!,
//                     height: 30.h,
//                   ),
//                   title: Text(
//                     language['language']!,
//                     style: TextStyle(color: Colors.white, fontSize: 14.sp),
//                   ),
//                   onTap: () {
//                     // Add your language selection functionality here
//                   },
//                 ),
//               )),
//               SizedBox(height: 20.h),
//               Align(
//                 alignment: Alignment.bottomRight,
//                 child: ElevatedButton(
//                   onPressed: () {
//                     // Add your next button functionality here
//                   },
//                   style: ElevatedButton.styleFrom(
//                     backgroundColor: VoidColors.redColor,
//                     padding: EdgeInsets.symmetric(vertical: 15.h, horizontal: 30.w),
//                     textStyle: TextStyle(fontSize: 14.sp),
//                   ),
//                   child: Text('Next', style: TextStyle(color: Colors.white)),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
