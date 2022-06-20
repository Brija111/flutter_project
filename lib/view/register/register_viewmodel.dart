import 'dart:html';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vgts_plugin/form/utils/form_field_controller.dart';
import '../../core/enum/view_state.dart';
import '../../locator.dart';
import '../../vgts_base_view_model.dart';
import '../../widgets/check_box.dart';
//import '../views/vgts_base_view_model.dart';

class RegisterViewModel extends VGTSBaseViewModel {



  final GlobalKey<FormState> registerFormKey = GlobalKey<FormState>();

  ScrollController regScrollController = ScrollController();

  NameFormFieldController nameController= NameFormFieldController(ValueKey("txtName"),
      required: true,requiredText: "Please enter your Name");

  NameFormFieldController orgController=NameFormFieldController(ValueKey("txtOrg"),
      required: true,requiredText: "Please enter your Organization Name"
  );

  EmailFormFieldController emailController=EmailFormFieldController(ValueKey("txtEmail"),
      required: true,requiredText: "Please enter an Email"
  );

  PasswordFormFieldController passwordController= PasswordFormFieldController(ValueKey("txtPassword"),
      required: true,requiredText: "Password field is Required");


  register() async {

    if(registerFormKey.currentState?.validate() != true) {
      return;
    }
    else{navigationService.pushNamed("/verification");}


    setState(ViewState.Busy);
    // LoginAuth? auth = await request<LoginAuth>(AuthRequest.login(mobileNumController.text));
    // if (auth != null) {
    //   locator<PushNotificationService>().configure(mobileNumController.text);
    //   navigationService.pushNamed(Routes.otp,arguments:mobileNumController.text);
    // }
    setState(ViewState.Idle);
    notifyListeners();
  }


}