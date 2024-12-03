import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:ip_tv/app/utils/extensions/cap_extension.dart';
import '../../../../generated/locales.g.dart';
import '../../../utils/constraints/colors.dart';
import '../controllers/select_language_controller.dart';

class SelectLanguageView extends StatefulWidget {
  const SelectLanguageView({super.key});

  @override
  State<SelectLanguageView> createState() => _ChangeLanguageSheet();
}

class _ChangeLanguageSheet extends State<SelectLanguageView> {
  int selected = 0;
  var selectLanguage = LocaleKeys.English.tr;
  final SelectLanguageController languageController = Get.put(SelectLanguageController());

  @override
  void initState() {
    super.initState();
    initLanguage();
  }

  Future<void> initLanguage() async {
    final savedLanguage = await languageController.loadSavedLanguage();
    selectLanguage = savedLanguage.tr;
    switch (savedLanguage) {
      case 'en':
        selected = 0;
        break;
      case 'es':
        selected = 1;
        break;
      case 'pl':
        selected = 2;
        break;
      case 'it':
        selected = 3;
        break;
      case 'de':
        selected = 4;
        break;
      default:
        selected = 0;
    }
    setState(() {});
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
            SizedBox(height: 20.0.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.0.w, vertical: 15.0.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: () {
                      Get.back();
                    },
                    child: Container(
                      color: Theme.of(context).colorScheme.primary,
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 5.0.w, vertical: 3.0.h),
                        child: Icon(
                          Icons.keyboard_backspace,
                          color: VoidColors.whiteColor,
                          size: 10.sp,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 10.0.w),
                  Text(
                    LocaleKeys.SelectLanguage.tr,
                    style: TextStyle(
                      fontSize: 10.sp,
                      fontWeight: FontWeight.w500,
                      color: VoidColors.whiteColor,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0.r),
                  color: VoidColors.blackColor.withOpacity(0.3),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 10.0.h, horizontal: 10.0.w),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        LanguageCardWidget(
                          img: 'assets/images/englishFlag.png',
                          language: LocaleKeys.English.tr,
                          onTap: () async {
                            setState(() {
                              selected = 0;
                            });
                            selectLanguage = LocaleKeys.English.tr;
                            await languageController.changeLanguage('en');
                            Get.updateLocale(Locale('en', 'US'));
                            setState(() {});
                          },
                          color: selected == 0
                              ? Theme.of(context).colorScheme.primary
                              : VoidColors.whiteColor.withOpacity(0.3),
                        ),
                        SizedBox(height: 10.0.h),
                        LanguageCardWidget(
                          img: 'assets/images/spanishFlag.png',
                          language: LocaleKeys.Spanish.tr,
                          onTap: () async {
                            setState(() {
                              selected = 1;
                            });
                            selectLanguage = LocaleKeys.Spanish.tr;
                            await languageController.changeLanguage('es');
                            Get.updateLocale(Locale('es', 'ES'));
                            setState(() {});
                          },
                          color: selected == 1
                              ? Theme.of(context).colorScheme.primary
                              : VoidColors.whiteColor.withOpacity(0.3),
                        ),
                        SizedBox(height: 10.0.h),
                        LanguageCardWidget(
                          img: 'assets/images/polishFlag.png',
                          language: LocaleKeys.Polish.tr,
                          onTap: () async {
                            setState(() {
                              selected = 2;
                            });
                            selectLanguage = LocaleKeys.Polish.tr;
                            await languageController.changeLanguage('pl');
                            Get.updateLocale(Locale('pl', 'PL'));
                            setState(() {});
                          },
                          color: selected == 2
                              ? Theme.of(context).colorScheme.primary
                              : VoidColors.whiteColor.withOpacity(0.3),
                        ),
                        SizedBox(height: 10.0.h),
                        LanguageCardWidget(
                          img: 'assets/images/italianFlag.png',
                          language: LocaleKeys.Italian.tr,
                          onTap: () async {
                            setState(() {
                              selected = 3;
                            });
                            selectLanguage = LocaleKeys.Italian.tr;
                            await languageController.changeLanguage('it');
                            Get.updateLocale(Locale('it', 'IT'));
                            setState(() {});
                          },
                          color: selected == 3
                              ? Theme.of(context).colorScheme.primary
                              : VoidColors.whiteColor.withOpacity(0.3),
                        ),
                        SizedBox(height: 10.0.h),
                        LanguageCardWidget(
                          img: 'assets/images/germanFlag.png',
                          language: LocaleKeys.German.tr,
                          onTap: () async {
                            setState(() {
                              selected = 4;
                            });
                            selectLanguage = LocaleKeys.German.tr;
                            await languageController.changeLanguage('de');
                            Get.updateLocale(Locale('de', 'DE'));
                            setState(() {});
                          },
                          color: selected == 4
                              ? Theme.of(context).colorScheme.primary
                              : VoidColors.whiteColor.withOpacity(0.3),
                        ),
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
  }
}

class LanguageCardWidget extends StatelessWidget {
  final String img;
  final String language;
  final VoidCallback onTap;
  final Color color;

  const LanguageCardWidget({
    super.key,
    required this.img,
    required this.language,
    required this.onTap,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 170.w,
        height: 50.h,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(8.0.r),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 5.0.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Image.asset(
                img,
                height: 30.0.h,
                width: 30.0.w,
              ),
              SizedBox(width: 25.0.w),
              Text(
                language,
                style: TextStyle(
                  fontSize: 8.sp,
                  fontWeight: FontWeight.w300,
                  color: VoidColors.whiteColor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
