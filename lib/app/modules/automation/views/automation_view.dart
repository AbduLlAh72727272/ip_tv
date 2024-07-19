import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart'; // Import ScreenUtil
import '../controllers/automation_controller.dart';

class AutomationView extends GetView<AutomationController> {
  const AutomationView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Initialize ScreenUtil
    //ScreenUtil.init(context, designSize: Size(360, 690), minTextAdapt: true, splitScreenMode: true);

    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          // Background image
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/image.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Settings title
          Positioned(
            top: 20.h, // Adjusted position using ScreenUtil
            left: 25.w, // Adjusted position using ScreenUtil
            child: Text(
              'Settings',
              style: TextStyle(
                color: Colors.white,
                fontSize: 10.sp, // Adjusted font size using ScreenUtil
              ),
            ),
          ),
          // Form content
          Center(
            child: Container(
              width: 300.w, // Adjusted width using ScreenUtil
              padding: EdgeInsets.all(16.0.w), // Adjusted padding using ScreenUtil
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.5),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Automation',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12.sp, // Adjusted font size using ScreenUtil
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 20.h), // Adjusted spacing using ScreenUtil
                  _buildCheckboxItem('Auto update channels & movies daily'),
                  SizedBox(height: 20.h), // Adjusted spacing using ScreenUtil
                  _buildCheckboxItemWithDropdown('Auto update EPG after every', 'day'),
                ],
              ),
            ),
          ),
          // Buttons
          Positioned(
            bottom: 10.h, // Adjusted position using ScreenUtil
            left: MediaQuery.of(context).size.width / 4,
            right: MediaQuery.of(context).size.width / 4,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Get.back(); // Navigate back to previous screen
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black.withOpacity(0.4),
                    padding: EdgeInsets.symmetric(horizontal: 22.0.w, vertical: 10.0.h), // Adjusted padding using ScreenUtil
                    textStyle: TextStyle(fontSize: 9.sp), // Adjusted font size using ScreenUtil
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.r), // Adjusted border radius using ScreenUtil
                    ),
                  ),
                  child: Text(
                    'Back',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    // Handle save action
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    padding: EdgeInsets.symmetric(horizontal: 22.0.w, vertical: 10.0.h), // Adjusted padding using ScreenUtil
                    textStyle: TextStyle(fontSize: 9.sp), // Adjusted font size using ScreenUtil
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.r), // Adjusted border radius using ScreenUtil
                    ),
                  ),
                  child: Text(
                    'Save',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCheckboxItem(String title) {
    bool isChecked = title == 'Auto update channels & movies daily';
    return StatefulBuilder(
      builder: (BuildContext context, StateSetter setState) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Checkbox(
              value: isChecked,
              onChanged: (bool? value) {
                setState(() {
                  isChecked = value ?? false;
                });
              },
              checkColor: Colors.black,
              activeColor: Colors.white,
            ),
            SizedBox(width: 10.w), // Adjusted spacing using ScreenUtil
            Text(
              title,
              style: TextStyle(color: Colors.white, fontSize: 9.sp), // Adjusted font size using ScreenUtil
            ),
          ],
        );
      },
    );
  }

  Widget _buildCheckboxItemWithDropdown(String title, String unit) {
    bool isChecked = false;
    return StatefulBuilder(
      builder: (BuildContext context, StateSetter setState) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Checkbox(
              value: isChecked,
              onChanged: (bool? value) {
                setState(() {
                  isChecked = value ?? false;
                });
              },
              checkColor: Colors.black,
              activeColor: Colors.white,
            ),
            SizedBox(width: 10.w), // Adjusted spacing using ScreenUtil
            Text(
              title,
              style: TextStyle(color: Colors.white, fontSize: 9.sp), // Adjusted font size using ScreenUtil
            ),
            SizedBox(width: 10.w), // Adjusted spacing using ScreenUtil
            DropdownButton<String>(
              dropdownColor: Colors.black,
              value: '1',
              icon: Icon(Icons.arrow_drop_down, color: Colors.white),
              items: <String>['1', '2', '3', '4', '5']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value, style: TextStyle(color: Colors.white)),
                );
              }).toList(),
              onChanged: (String? newValue) {
                // Handle dropdown change
              },
            ),
            SizedBox(width: 10.w), // Adjusted spacing using ScreenUtil
            Text(
              unit,
              style: TextStyle(color: Colors.white, fontSize: 9.sp), // Adjusted font size using ScreenUtil
            ),
          ],
        );
      },
    );
  }
}
