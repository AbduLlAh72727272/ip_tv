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
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/image.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [
            SizedBox(height: 20.0.h,),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.0.w, vertical: 15.0.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    color: Theme.of(context).colorScheme.primary,
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 5.0.w, vertical: 3.0.h),
                      child: Icon(Icons.keyboard_backspace, color: VoidColors.whiteColor,
                      size: 10.sp,),
                    ),
                  ),
                  SizedBox(width: 10.0.w,),
                  Text(LocaleKeys.SelectLanguage.tr, style: TextStyle(
                      fontSize: 10.sp,
                      fontWeight: FontWeight.w500,
                      color: VoidColors.whiteColor
                  ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                // width: 230.w,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0.r),
                  color: VoidColors.blackColor.withOpacity(0.3),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 10.0.h, horizontal: 10.0.w),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        LanguageCardWidget(img: 'assets/images/englishFlag.png',
                          language: LocaleKeys.English.tr, onTap: () async {
                            setState(() {
                              selected = 0;
                            });
                            selectLanguage = LocaleKeys.English.tr;
                            await SelectLanguageController()
                                .changeLanguage(selectLanguage.toCode);

                            Get.updateLocale(Locale(selectLanguage.toCode,
                                selectLanguage.toCode.toUpperCase()));
                            setState(() {});
                          }, color: selected == 0 ?
                          Theme.of(context).colorScheme.primary :
                          VoidColors.whiteColor.withOpacity(0.3),),

                        SizedBox(height: 10.0.h,),

                        LanguageCardWidget(img: 'assets/images/spanishFlag.png',
                          language: LocaleKeys.Spanish.tr, onTap: () async {
                            setState(() {
                              selected = 1;
                            });
                            selectLanguage = LocaleKeys.Spanish.tr;
                            await SelectLanguageController()
                                .changeLanguage(selectLanguage.toCode);

                            Get.updateLocale(Locale(selectLanguage.toCode,
                                selectLanguage.toCode.toUpperCase()));
                            setState(() {});
                          }, color: selected == 1 ? Theme.of(context).colorScheme.primary :
                            VoidColors.whiteColor.withOpacity(0.3)),

                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );

    //   Container(
    //   decoration: BoxDecoration(
    //       color: const Color(0xffFAFAFA),
    //       borderRadius: BorderRadius.only(
    //         topLeft: Radius.circular(20.r),
    //         topRight: Radius.circular(20.r),
    //       )),
    //   // width: 200.w,
    //   child: SingleChildScrollView(
    //     child: Column(
    //       // mainAxisSize: MainAxisSize.min,
    //       mainAxisSize: MainAxisSize.max,
    //       children: [
    //         Padding(
    //           padding: EdgeInsets.only(left: 20.w, top: 20.h, right: 20.w),
    //           child: Column(
    //             crossAxisAlignment: CrossAxisAlignment.center,
    //             children: [
    //               Row(
    //                 mainAxisAlignment: MainAxisAlignment.center,
    //                 children: [
    //                   Text(
    //                     LocaleKeys.SelectLanguage.tr,
    //                     style: TextStyle(
    //                       fontWeight: FontWeight.w600,
    //                       fontSize: 18.sp,
    //                       color: const Color(0xFF000000),
    //                     ),
    //                   ),
    //                 ],
    //               ),
    //               SizedBox(
    //                 height: 20.h,
    //               ),
    //               GestureDetector(
    //                 onTap: () async {
    //                   setState(() {
    //                     selected = 0;
    //                   });
    //                   selectLanguage = LocaleKeys.English.tr;
    //                   await SelectLanguageController()
    //                       .changeLanguage(selectLanguage.toCode);
    //
    //                   Get.updateLocale(Locale(selectLanguage.toCode,
    //                       selectLanguage.toCode.toUpperCase()));
    //                   setState(() {});
    //                   // Get.back();
    //                   // Get.back();
    //                 },
    //                 child: Container(
    //                   padding: EdgeInsets.symmetric(
    //                       horizontal: 20.w, vertical: 15.h),
    //                   decoration: BoxDecoration(
    //                     borderRadius: BorderRadius.circular(8.r),
    //                     color: selected == 0
    //                         ? const Color(0xff064DAE).withOpacity(0.12)
    //                         : Colors.white,
    //                     border: Border.all(
    //                       color: selected == 0
    //                           ? const Color(0xff064DAE)
    //                           : Colors.black.withOpacity(0.1),
    //                     ),
    //                   ),
    //                   child: Row(
    //                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //                     children: [
    //                       Text(
    //                         LocaleKeys.English.tr,
    //                         style: TextStyle(
    //                           fontWeight: FontWeight.w700,
    //                           fontSize: 14.sp,
    //                           color: selected == 0
    //                               ? const Color(0xff064DAE)
    //                               : const Color(0xFF0A1828),
    //                         ),
    //                       ),
    //                       selected == 0
    //                           ? Icon(
    //                         Icons.check,
    //                         color: const Color(0xff064DAE),
    //                         size: 20.sp,
    //                       )
    //                           : Container()
    //                     ],
    //                   ),
    //                 ),
    //               ),
    //               SizedBox(
    //                 height: 20.h,
    //               ),
    //               GestureDetector(
    //                 onTap: () async {
    //                   setState(() {
    //                     selected = 1;
    //                   });
    //                   selectLanguage = LocaleKeys.Spanish.tr;
    //                   await SelectLanguageController()
    //                       .changeLanguage(selectLanguage.toCode);
    //
    //                   Get.updateLocale(Locale(selectLanguage.toCode,
    //                       selectLanguage.toCode.toUpperCase()));
    //                   setState(() {});
    //                   // Get.back();
    //                   // Get.back();
    //                 },
    //                 child: Container(
    //                   padding: EdgeInsets.symmetric(
    //                       horizontal: 20.w, vertical: 15.h),
    //                   decoration: BoxDecoration(
    //                     borderRadius: BorderRadius.circular(8.r),
    //                     color: selected == 1
    //                         ? const Color(0xff064DAE).withOpacity(0.12)
    //                         : Colors.white,
    //                     border: Border.all(
    //                       color: selected == 1
    //                           ? const Color(0xff064DAE)
    //                           : Colors.black.withOpacity(0.1),
    //                     ),
    //                   ),
    //                   child: Row(
    //                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //                     children: [
    //                       Text(
    //                         LocaleKeys.Spanish.tr,
    //                         style: TextStyle(
    //                           fontWeight: FontWeight.w700,
    //                           fontSize: 14.sp,
    //                           color: selected == 1
    //                               ? const Color(0xff064DAE)
    //                               : const Color(0xFF0A1828),
    //                         ),
    //                       ),
    //                       selected == 1
    //                           ? Icon(
    //                         Icons.check,
    //                         color: const Color(0xff064DAE),
    //                         size: 20.sp,
    //                       )
    //                           : Container()
    //                     ],
    //                   ),
    //                 ),
    //               ),
    //               SizedBox(
    //                 height: 20.h,
    //               ),
    //             ],
    //           ),
    //         ),
    //       ],
    //     ),
    //   ),
    // );
  }
}

class LanguageCardWidget extends StatelessWidget {
  final String img;
  final String language;
  final VoidCallback onTap;
  final Color color;
  const LanguageCardWidget({
    super.key, required this.img,
    required this.language, required this.onTap, required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 170.w,
        height: 50.h,
        decoration: BoxDecoration(
            // color: VoidColors.whiteColor.withOpacity(0.3),
          color: color,
            borderRadius: BorderRadius.circular(8.0.r)
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 5.0.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Image.asset(img,
                height: 30.0.h,
                width: 30.0.w,),
              SizedBox(width: 25.0.w),
              Text(language, style: TextStyle(
                  fontSize: 8.sp,
                  fontWeight: FontWeight.w300,
                  color: VoidColors.whiteColor
              ),
              ),
            ],
          ),
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
