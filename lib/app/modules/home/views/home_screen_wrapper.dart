import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeScreenWrapper extends GetView {
  HomeScreenWrapper({super.key});

  final HomeController homeController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() => homeController.currentAppTheme.value.homeScreenWidget),
      // Container(
      //   decoration: const BoxDecoration(
      //     image: DecorationImage(
      //       image: AssetImage('assets/images/bg2.png'),
      //       fit: BoxFit.cover,
      //     ),
      //   ),
      //   child: const Center(
      //     child: Text(
      //       'First home Screen'
      //     ),
      //   ),
      // ),
    );
  }
}
