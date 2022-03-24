import 'package:axe/controller/profile_controller.dart';
import 'package:axe/interface/callbackinterface.dart';
import 'package:axe/util/commoncolors.dart';
import 'package:axe/util/commonwidget.dart';
import 'package:axe/util/constants.dart';
import 'package:axe/util/global.dart';
import 'package:axe/util/strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OtherUserProfile extends StatelessWidget  implements CallBackInterface{
  const OtherUserProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ProfileController profileController = Get.find();
    return SafeArea(
      child: Scaffold(
        backgroundColor: CommonColors.white,
        resizeToAvoidBottomInset: true,
          appBar: AppBar(
            elevation: 0,
            backgroundColor: CommonColors.white,
            title: const Text(""),
            leading:  IconButton(
                padding: EdgeInsets.zero,
                constraints: const BoxConstraints(),
                onPressed: (){
                  Get.back();
                }, icon: const Icon(Icons.arrow_back_rounded,color: CommonColors.black,)),
          ),

        body: Obx(()=>SingleChildScrollView(
          child: profileController.userInfoPojo.value.firstName == null?const Center(child: CircularProgressIndicator()):Padding(
            padding: EdgeInsets.all(CommonWidget.getInstance().widthFactor(context) * 0.02),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Center(
                  child: Container(
                    width: CommonWidget.getInstance().widthFactor(context) * 0.30,
                    height: CommonWidget.getInstance().widthFactor(context) * 0.30,
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(colors: [CommonColors.primaryColor1 ,CommonColors.imageRed],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomCenter,
                      ),
                      shape: BoxShape.circle,
                    ),
                    child: Padding(
                        padding: const EdgeInsets.all(1.0),
                        child: profileController.userInfoPojo.value.picture== null ?CircleAvatar(
                            backgroundColor: CommonColors.textfiled_gray,
                            child: Image.asset("assets/images/camera.png")

                        ):CircleAvatar(
                          backgroundColor: CommonColors.textfiled_gray,
                          backgroundImage:
                          NetworkImage(Constant.imageUrl + profileController.userInfoPojo.value.picture!),
                        )
                    ),
                  ),
                ),

                SizedBox(
                  height: CommonWidget.getInstance().heightFactor(context) * 0.02,
                ),

                Center(
                  child: CommonWidget.getInstance().normalText(CommonColors.black,
                      profileController.userInfoPojo.value.firstName!+" "+ profileController.userInfoPojo.value.lastName!,
                      0,CommonWidget.getInstance().widthFactor(context)*0.05,FontStyle.normal,2,FontWeight.w600,fontfamily: true),
                ),
                SizedBox(
                  height: CommonWidget.getInstance().widthFactor(context) * 0.01,
                ),
                Center(
                  child: CommonWidget.getInstance().normalText(CommonColors.primaryColor1,
                      profileController.userInfoPojo.value.email!,
                      1,CommonWidget.getInstance().widthFactor(context)*0.035,FontStyle.normal,1,FontWeight.w600,fontfamily: true),
                ),

                SizedBox(
                  height: CommonWidget.getInstance().widthFactor(context) * 0.01,
                ),

                Center(
                  child: CommonWidget.getInstance().normalText(CommonColors.black,
                      "Ph: "+profileController.userInfoPojo.value.phone!,
                      1,CommonWidget.getInstance().widthFactor(context)*0.035,FontStyle.normal,1,FontWeight.w600,fontfamily: true),
                ),

                SizedBox(
                  height: CommonWidget.getInstance().widthFactor(context) * 0.01,
                ),

                Center(
                  child: CommonWidget.getInstance().normalText(CommonColors.darkGray,
                      profileController.userInfoPojo.value.city!+", "+profileController.userInfoPojo.value.state!,
                      1, CommonWidget.getInstance().widthFactor(context)*0.035,FontStyle.normal,1,FontWeight.w600,fontfamily: true),
                ),

                SizedBox(
                  height: CommonWidget.getInstance().widthFactor(context) * 0.07,
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        children: [
                          CommonWidget.getInstance().normalText(
                              CommonColors.black, "Big Axe",1,CommonWidget.getInstance().widthFactor(context)*0.04,FontStyle.normal,1,FontWeight.w600,fontfamily: true),
                          SizedBox(
                            height: CommonWidget.getInstance().widthFactor(context) * 0.02,
                          ),
                          CommonWidget.getInstance().normalText(CommonColors.primaryColor1,
                              profileController.userInfoPojo.value.bigaxeScore!.toString(),
                              1,CommonWidget.getInstance().widthFactor(context)*0.05,FontStyle.normal,1,FontWeight.w600,fontfamily: true),
                        ],
                      ),

                      Container(
                        color: CommonColors.grayColor,
                        width: 1,
                        height: CommonWidget.getInstance().widthFactor(context)*0.2,

                      ),

                      Column(
                        children: [
                          CommonWidget.getInstance().normalText(CommonColors.black,
                              "Hatchets",
                              1,CommonWidget.getInstance().widthFactor(context)*0.04,FontStyle.normal,1,FontWeight.w600,fontfamily: true),
                          SizedBox(
                            height: CommonWidget.getInstance().widthFactor(context) * 0.02,
                          ),
                          CommonWidget.getInstance().normalText(CommonColors.primaryColor1,
                              profileController.userInfoPojo.value.hatchetsScore!.toString(),
                              1,CommonWidget.getInstance().widthFactor(context)*0.05,FontStyle.normal,1,FontWeight.w600,fontfamily: true),
                        ],
                      ),
                      Container(
                        color: CommonColors.grayColor,
                        width: 1,
                        height: CommonWidget.getInstance().widthFactor(context)*0.2,

                      ),
                      Column(
                        children: [
                          CommonWidget.getInstance().normalText(
                              CommonColors.black, "Teamplay",1,CommonWidget.getInstance().widthFactor(context)*0.04,FontStyle.normal,1,FontWeight.w600,fontfamily: true),
                          SizedBox(
                            height: CommonWidget.getInstance().widthFactor(context) * 0.02,
                          ),
                          CommonWidget.getInstance().normalText(CommonColors.primaryColor1,
                              profileController.userInfoPojo.value.teamplayScore!.toString(),
                              1,CommonWidget.getInstance().widthFactor(context)*0.05,FontStyle.normal,1,FontWeight.w600,fontfamily: true),
                        ],
                      ),
                    ]
                ),
                SizedBox(height: CommonWidget.getInstance().widthFactor(context) * 0.15),
                Global.loginType==Constant.userPlayer?Container():Center(
                  child: Padding(
                    padding: const EdgeInsets.only(left:6.0),
                    child: CommonWidget.getInstance().flexibleButton(
                      context,
                      Strings.edit_scrore,
                      CommonWidget.getInstance().widthFactor(context) * 0.6,
                      CommonWidget.getInstance().widthFactor(context) * 0.13,
                      CommonColors.primaryColor1,
                      CommonColors.primaryColor1,
                      CommonColors.white,
                      this,
                    ),
                  ),
                ),
                SizedBox(
                  height: CommonWidget.getInstance().widthFactor(context) * 0.05,
                ),
              ]
            ),
          ),
        ))
      )
    );
  }

  @override
  Future<void> widgetCallBack(String title, String value, BuildContext context) async {
    switch(title){
      case Strings.edit_scrore:
        Get.toNamed('/editScore');
        break;

    }
  }

}
