import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../widget/ui_helper.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [Image.asset("assets/images/w.png")],
            ),
            SizedBox(height: 20.h),
            UiHelper.CustomImage(
              imgurl: "assets/images/e.png",
              height: 300.h,
              isnetwork: false,
            ),
            SizedBox(height: 10.h),
            UiHelper.CustomText(
              text: "Explore More Todo",
              fontsize: 26.sp,
              fontfamily: "Bold",
              color: const Color(0XFF213BC5),
            ),
            SizedBox(height: 10.h),
            UiHelper.CustomText(
              text: "explore all the existing todo’s here based",
              fontsize: 16.sp,
              fontfamily: "Regular",
            ),
            UiHelper.CustomText(
              text: "upon all your tasks to do.",
              fontsize: 16.sp,
              fontfamily: "Regular",
            ),
            SizedBox(height: 60.h),
            UiHelper.CustomButton(callback: () {}, text: "Get Started"),
          ],
        ),
      ),
    );
  }
}
