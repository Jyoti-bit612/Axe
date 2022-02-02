import 'package:axe/controller/pasword_counter.dart';
import 'package:axe/interface/CallBackInterface.dart';
import 'package:axe/screens/dashbaord.dart';
import 'package:axe/util/commoncolors.dart';
import 'package:axe/util/commonwidget.dart';
import 'package:axe/util/strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class ChangePassword extends StatelessWidget  implements CallBackInterface{

 final oldlController = TextEditingController();
 final newController = TextEditingController();
 final confirmController = TextEditingController();
 final oldFocus = FocusNode();
 final newFocus = FocusNode();
 final confirmFocus = FocusNode();
 final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  ChangePassword({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    final CounterController controller = Get.put(CounterController());
    return SafeArea(
      child: Scaffold(
        backgroundColor: CommonColors.white,
        resizeToAvoidBottomInset: true,
        body: Obx(()=>SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              IconButton(
                  onPressed: (){
                    Get.back();
                  }, icon: Icon(Icons.arrow_back_rounded)),

              Center(
                child: Image.asset(
                  "assets/images/forgot_password_logo.png",
                  width: CommonWidget.getInstance().widthFactor(context) * 0.65,
                ),
              ),


              Padding(
                padding: const EdgeInsets.only(left:16.0,right:16),
                child: CommonWidget.getInstance().normalText(
                    CommonColors.black, Strings.change_pass,0,CommonWidget.getInstance().widthFactor(context)*0.06,FontStyle.normal,2,FontWeight.w600),
              ),

              Padding(
                padding: const EdgeInsets.only(left: 32.0,right:32),
                child: Form(
                    key: formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [

                        SizedBox(
                          height: CommonWidget.getInstance().heightFactor(context) * 0.045,
                        ),

                        CommonWidget.getInstance().normalText(
                            CommonColors.black, Strings.old_pass,0,CommonWidget.getInstance().widthFactor(context)*0.04,FontStyle.normal,1,FontWeight.w600,fontfamily: true),

                        SizedBox(
                          height: CommonWidget.getInstance().heightFactor(context) * 0.02,
                        ),


                        CommonWidget.getInstance().editTextField(
                            Strings.pass,
                            context,
                            true,
                            CommonColors.textfiled_gray,
                            Strings.enter_old_pass,
                            "This  field is mandatory",
                            oldlController,
                            TextInputType.multiline,
                            oldFocus,
                            newFocus,
                            controller.isValue.value,
                            false,
                            "password",
                            0),

                        SizedBox(
                          height: CommonWidget.getInstance().heightFactor(context) * 0.03,
                        ),
                        CommonWidget.getInstance().normalText(
                            CommonColors.black, Strings.new_pass,0,CommonWidget.getInstance().widthFactor(context)*0.04,FontStyle.normal,1,FontWeight.w600,fontfamily: true),

                        SizedBox(
                          height: CommonWidget.getInstance().heightFactor(context) * 0.02,
                        ),

                        CommonWidget.getInstance().editTextField(
                            Strings.pass,
                            context,
                            true,
                            CommonColors.textfiled_gray,
                            Strings.enter_new_pass,
                            "This  field is mandatory",
                            newController,
                            TextInputType.multiline,
                            newFocus,
                            confirmFocus,
                            controller.isValueNew.value,
                            false,
                            "password",
                            0),

                        SizedBox(
                          height: CommonWidget.getInstance().heightFactor(context) * 0.03,
                        ),

                        CommonWidget.getInstance().normalText(
                            CommonColors.black, Strings.conirm_pass,0,CommonWidget.getInstance().widthFactor(context)*0.04,FontStyle.normal,1,FontWeight.w600,fontfamily: true),

                        SizedBox(
                          height: CommonWidget.getInstance().heightFactor(context) * 0.02,
                        ),

                        CommonWidget.getInstance().editTextField(
                            Strings.pass,
                            context,
                            true,
                            CommonColors.textfiled_gray,
                            Strings.re_enter_pass,
                            "This  field is mandatory",
                            confirmController,
                            TextInputType.multiline,
                            confirmFocus,
                            null,
                            controller.isValueConfirm.value,
                            false,
                            "key",
                            0),

                        SizedBox(
                          height: CommonWidget.getInstance().heightFactor(context) * 0.03,
                        ),


                        CommonWidget.getInstance().flexibleButton(
                          context,
                          Strings.change_pass,
                          double.infinity,
                          CommonWidget.getInstance().widthFactor(context) * 0.13,
                          CommonColors.primaryColor1,
                          CommonColors.primaryColor1,
                          CommonColors.white,
                          this,
                        ),

                        SizedBox(
                          height: CommonWidget.getInstance().heightFactor(context) * 0.04,
                        ),

                      ],
                    )),
              ),
            ],
          ),
        ),)
      ),
    );
  }

  @override
  Future<void> widgetCallBack(String title, String value, BuildContext context) async {
    switch(title){
      case Strings.reset_password:

        Get.to(()=>DashBoard(0));

        break;

    }
  }

}
