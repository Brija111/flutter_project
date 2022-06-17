import 'package:asset_management/locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:responsive_framework/responsive_value.dart';
import 'package:responsive_framework/responsive_wrapper.dart';
import 'package:stacked/stacked.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../core/enum/view_state.dart';
import '../../core/res/colors.dart';
import '../../core/res/images.dart';
import '../../core/res/spacing.dart';
import '../../core/res/styles.dart';
import '../../widgets/button.dart';
import '../../widgets/check_box.dart';
import '../../widgets/edit_text_field.dart';
import '../../widgets/tap_outside_unfocus.dart';
import 'forgot_pwd_viewmodel.dart';
//import '../widgets/button.dart';
//import '../widgets/edit_text_field.dart';
//import '../widgets/tap_outside_unfocus.dart';

//import 'login_view_model.dart';

class ForgotPwdPage extends ViewModelBuilderWidget<ForgotPwdViewModel>{

  @override
  Widget builder(BuildContext context, ForgotPwdViewModel viewModel, Widget? child) {

    return Scaffold(
      backgroundColor: AppColor.background,

      body: SafeArea(
        child: TapOutsideUnFocus(
          child: Form(
            key: viewModel.registerFormKey,
            child: Row(
              children: [
                ResponsiveVisibility(
                  hiddenWhen: [Condition.smallerThan(name: TABLET)],
                  child: Expanded(
                    flex: 5,
                    child: Container(
                      decoration: BoxDecoration(color: AppColor.background,
                          image: DecorationImage(image: AssetImage(Images.forgot_pwd),alignment: Alignment.center)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 35.0,top: 31),
                            child: Image.asset(Images.appLogo,),
                          ),
                          SizedBox(height: 90,),
                          //Expanded(child: Image.asset(Images.backGround,width: 992.w,height: 853.h,fit: BoxFit.contain,)),
                        ],
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex:2,
                  child: Container(
                    padding: EdgeInsets.fromLTRB(35, 31, 35, 0),
                    color: AppColor.white,
                    height: double.infinity,
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ResponsiveVisibility(
                              visible: false,
                              visibleWhen: [Condition.smallerThan(name: TABLET)],
                              child: Image.asset(Images.appLogo,)),
                          Padding(
                            padding:EdgeInsets.symmetric(
                                horizontal:ResponsiveValue(context,defaultValue:0,valueWhen:[
                                  Condition.smallerThan(name:TABLET,value: 180.0),
                                  Condition.smallerThan(name:"2K",value: 100.0),
                                  Condition.smallerThan(name:"K",),
                                ]).value),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [

                                VerticalSpacing.custom(value: 100),

                                Text("Forgot Password 🔒",
                                  style: AppTextStyle.h5Heading.copyWith(
                                      fontSize: 24,
                                      color: AppColor.textOnPrimary.withOpacity(0.87)),),

                                VerticalSpacing.custom(value: 8),

                                Text(
                                  "Enter your email and we'll send you instructions to reset your password",
                                  style: AppTextStyle.body2.copyWith(
                                      fontSize: 14,
                                      color: AppColor.textOnSecondary),),


                                VerticalSpacing.d20px(),

                                EditTextField(
                                  "",
                                  textStyle: AppTextStyle.inputText.copyWith(fontSize: 16),
                                  viewModel.emailController,
                                  placeholder: "Email",
                                  prefixIcon: Padding(
                                    padding: EdgeInsets.only(right: 4.0, left: 4.0),
                                  ),
                                  onChanged: (value) {},
                                  onSubmitted: (val) {
                                    FocusNode().requestFocus();
                                  },
                                ),


                                VerticalSpacing.custom(value: 24.0),

                                Button(
                                  "SUBMIT",textStyle: AppTextStyle.buttonLarge.copyWith(fontSize: 14,color: AppColor.white),
                                  key: const ValueKey("btnContinue"),
                                  width: double.infinity,
                                  isLoading: viewModel.state == ViewState.Busy,
                                  onPressed: () {
                                    viewModel.register();
                                    //navigationService.popAllAndPushNamed("/main");
                                  },
                                ),

                                VerticalSpacing.custom(value: 15.0),
                                TextButton(
                                        onPressed: () {
                                          navigationService.pushNamed("/login");
                                        },
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            Icon(Icons.arrow_back_ios,color: AppColor.primary,size: 16,),
                                            Text("Back to login",
                                                style: AppTextStyle.inputText.copyWith(
                                                  fontSize: 16,
                                                  color: AppColor.primary,
                                                )),
                                          ],
                                        ),
                                      ),


                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );

  }

  @override
  ForgotPwdViewModel viewModelBuilder(BuildContext context) => ForgotPwdViewModel();

}