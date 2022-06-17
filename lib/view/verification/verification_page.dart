import 'package:asset_management/core/res/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:responsive_framework/responsive_framework.dart';

import '../../core/res/colors.dart';
import '../../core/res/images.dart';

class VerificationPage extends StatelessWidget {
  const VerificationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            width: double.infinity,
            decoration: BoxDecoration(color: AppColor.background,
                image: DecorationImage(image: AssetImage(Images.ver_background),fit: BoxFit.fitWidth,alignment: Alignment.bottomCenter)),

              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(Images.ver_Icon,alignment: Alignment.center,),
                  SizedBox(height: 40,),
                  Text("Verfication Link Sent",style: AppTextStyle.h5Heading.copyWith(fontSize: 24),),
                  SizedBox(height: 10,),
                  Text("Check your inbox we have sent you a verification mail.",style: AppTextStyle.body2.copyWith(fontSize: 14),)
                ],
              ),
            ),

    );
  }
}

/*
child: Padding(
padding: EdgeInsets.symmetric(horizontal: ResponsiveValue(context,defaultValue: 100.0,valueWhen: [
Condition.smallerThan(name: TABLET,value: 50.0),
Condition.smallerThan(name: "2K"),
]).value,
vertical: ResponsiveValue(context,defaultValue: 100,valueWhen: [
Condition.smallerThan(name: TABLET,value: 70,),
Condition.smallerThan(name: "2K",value: 50),
Condition.equals(name: "K"),
]).value),
)

 */
