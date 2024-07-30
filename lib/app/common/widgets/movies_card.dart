import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


Widget buildMovieCard(String imagePath, String label) {
  return Padding(
    padding: EdgeInsets.only(right: 8.0.w),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 100.w,
          height: 150.h,
          // child: Image.network(imagePath, fit: BoxFit.cover,),
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(imagePath),
              fit: BoxFit.cover,
            ),
          ),
        ),
        SizedBox(height: 4.h),
        SizedBox(
          width: 80.w,
          child: Text(
            label,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontSize: 7.sp,
              color: Colors.white,
            ),
          ),
        ),
      ],
    ),
  );
}
