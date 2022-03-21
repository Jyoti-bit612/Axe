import 'dart:convert';
import 'package:axe/controller/score_controller.dart';
import 'package:http/http.dart' as http;
import 'package:axe/controller/invitationcontroller.dart';
import 'package:axe/controller/profile_controller.dart';
import 'package:axe/interface/callbackinterface.dart';
import 'package:axe/util/commoncolors.dart';
import 'package:axe/util/commonwidget.dart';
import 'package:axe/util/constants.dart';
import 'package:axe/util/global.dart';
import 'package:axe/util/strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class UserProfile extends StatelessWidget  implements CallBackInterface{
  UserProfile({Key? key}) : super(key: key);

  final myMenuItems = <String>[
    Strings.privacy_profile,
    Strings.help_center,
    Strings.report,
    Strings.logout,
  ];
  var pickedImage;

  void onSelect(item) {
    switch (item) {
      case Strings.privacy_profile:
        break;
      case Strings.help_center:
        break;
      case Strings.report:
        break;
      case Strings.logout:
        Get.defaultDialog(
            title:  "Do yo want to logout?",
            barrierDismissible: true,
            middleText: "",
            actions: [
              TextButton(
                onPressed: () {
                  Get.back();
                },
                child: const Text('No'),
              ),
              TextButton(
                onPressed: () {
                  Global.logOut(endUrl: Constant.playerLogout);
                },
                child: const Text('Yes'),
              ),
            ]
        );
        break;
    }
  }

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

            actions: <Widget>[
              IconButton(
                  onPressed: (){
                    Get.toNamed('/notificationClass');

                  },
                  icon: const Icon(Icons.notifications,color: CommonColors.black,)
              ),

              PopupMenuButton<String>(
                icon: const Icon(Icons.more_vert_rounded,color: CommonColors.black),
                  onSelected: onSelect,
                  itemBuilder: (BuildContext context) {
                    return myMenuItems.map((String choice) {
                      return PopupMenuItem<String>(
                        child: Text(choice),
                        value: choice,
                      );
                    }).toList();
                  })
            ],
          ),

        body: Obx(()=>SingleChildScrollView(
          child: profileController.playerProfilePojo.value.data==null?const Center(child: CircularProgressIndicator()):Padding(
            padding: EdgeInsets.all(CommonWidget.getInstance().widthFactor(context) * 0.02),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [

                SizedBox(
                  height: CommonWidget.getInstance().heightFactor(context) * 0.01,
                ),

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
                      child: DecoratedBox(
                          decoration:  const BoxDecoration(
                            color: CommonColors.textfiled_gray,
                            shape: BoxShape.circle,
                          ),
                          child: Image.asset("assets/images/camera.png")),
                    ),
                  ),
                ),

                SizedBox(
                  height: CommonWidget.getInstance().heightFactor(context) * 0.02,
                ),

                Center(
                  child: CommonWidget.getInstance().normalText(CommonColors.black,
                      profileController.firstnameController.text+" "+profileController.lastnameController.text,
                      0,CommonWidget.getInstance().widthFactor(context)*0.05,FontStyle.normal,1,FontWeight.w400),
                ),
                SizedBox(
                  height: CommonWidget.getInstance().widthFactor(context) * 0.01,
                ),
                Center(
                  child: CommonWidget.getInstance().normalText(CommonColors.darkGray,
                      profileController.aboutController.text==""?"About you":profileController.aboutController.text,
                      1,CommonWidget.getInstance().widthFactor(context)*0.03,FontStyle.normal,1,FontWeight.w600),
                ),

                SizedBox(
                  height: CommonWidget.getInstance().widthFactor(context) * 0.05,
                ),

                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        children: [
                          CommonWidget.getInstance().normalText(
                              CommonColors.black, "Big Axe",1,CommonWidget.getInstance().widthFactor(context)*0.035,FontStyle.normal,1,FontWeight.w600,fontfamily: true),
                          SizedBox(
                            height: CommonWidget.getInstance().widthFactor(context) * 0.02,
                          ),
                          CommonWidget.getInstance().normalText(CommonColors.primaryColor1,
                              profileController.playerProfilePojo.value.data!.bigaxeScore!.toString(),
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
                              CommonColors.black, "Hatchets",1,CommonWidget.getInstance().widthFactor(context)*0.035,FontStyle.normal,1,FontWeight.w600,fontfamily: true),
                          SizedBox(
                            height: CommonWidget.getInstance().widthFactor(context) * 0.02,
                          ),
                          CommonWidget.getInstance().normalText(CommonColors.primaryColor1,
                              profileController.playerProfilePojo.value.data!.hatchetsScore!.toString(),
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
                              "Teamplay",
                              1,CommonWidget.getInstance().widthFactor(context)*0.035,FontStyle.normal,1,FontWeight.w600,fontfamily: true),
                          SizedBox(
                            height: CommonWidget.getInstance().widthFactor(context) * 0.02,
                          ),
                          CommonWidget.getInstance().normalText(CommonColors.primaryColor1,
                              profileController.playerProfilePojo.value.data!.teamplayScore!.toString(),
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
                              CommonColors.black, "P. Score",1,CommonWidget.getInstance().widthFactor(context)*0.035,FontStyle.normal,1,FontWeight.w600,fontfamily: true),
                          SizedBox(
                            height: CommonWidget.getInstance().widthFactor(context) * 0.02,
                          ),
                          CommonWidget.getInstance().normalText(
                              CommonColors.primaryColor1, "36",1,CommonWidget.getInstance().widthFactor(context)*0.05,FontStyle.normal,1,FontWeight.w600,fontfamily: true),
                        ],
                      ),

                    ]
                ),

                SizedBox(
                  height: CommonWidget.getInstance().widthFactor(context) * 0.06,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      GestureDetector(
                        onTap: (){
                          final InvitationController invitationController = Get.find();
                          Get.toNamed('/newInvitaton');
                          invitationController.getInvitationList();
                          invitationController.getAcceptedList();
                        },
                        child: SizedBox(
                            width: CommonWidget.getInstance().widthFactor(context) * 0.3,
                            height: CommonWidget.getInstance().widthFactor(context) * 0.12,
                            child: DecoratedBox(
                              decoration: const BoxDecoration(
                                  borderRadius: BorderRadius.all(Radius.circular(6)),
                                  gradient: LinearGradient(colors: [CommonColors.primaryColor1 ,CommonColors.primaryColor2],
                                    begin: Alignment.topRight,
                                    end: Alignment.bottomCenter,
                                  )),

                              child: Center(
                                child: CommonWidget.getInstance().normalText(
                                        CommonColors.white, Strings.invitaion,1,CommonWidget.getInstance().widthFactor(context)*0.03,FontStyle.normal,1,FontWeight.w600,fontfamily: true),
                              ),
                            )),
                      ),
                      GestureDetector(
                        onTap: (){
                          final ScoreDashController scoreController = Get.find();
                          Get.toNamed('/editScore');
                          scoreController.getPlayerPersonalScores();
                        },
                        child: SizedBox(
                            width: CommonWidget.getInstance().widthFactor(context) * 0.22,
                            height: CommonWidget.getInstance().widthFactor(context) * 0.12,
                            child: DecoratedBox(
                              decoration: const BoxDecoration(
                                  borderRadius: BorderRadius.all(Radius.circular(6)),
                                  gradient: LinearGradient(colors: [CommonColors.primaryColor1 ,CommonColors.primaryColor2],
                                    begin: Alignment.topLeft,
                                    end: Alignment.bottomCenter,
                                  )),

                              child: Center(
                                child: CommonWidget.getInstance().normalText(
                                        CommonColors.white, Strings.score,1,CommonWidget.getInstance().widthFactor(context)*0.03,FontStyle.normal,1,FontWeight.w600,fontfamily: true),
                              ),

                            )),
                      ),
                      GestureDetector(
                        onTap: (){
                          Get.toNamed('/practiceMatch');
                        },
                        child: SizedBox(
                            width: CommonWidget.getInstance().widthFactor(context) * 0.35,
                            height: CommonWidget.getInstance().widthFactor(context) * 0.12,
                            child: DecoratedBox(
                              decoration: const BoxDecoration(
                                  borderRadius: BorderRadius.all(Radius.circular(6)),
                                  gradient: LinearGradient(colors: [CommonColors.primaryColor1 ,CommonColors.primaryColor2],
                                    begin: Alignment.topLeft,
                                    end: Alignment.bottomCenter,
                                  )),

                              child: Center(
                                child: CommonWidget.getInstance().normalText(
                                        CommonColors.white, Strings.practice_match,1,CommonWidget.getInstance().widthFactor(context)*0.03,FontStyle.normal,1,FontWeight.w600,fontfamily: true),
                              ),

                            )),
                      )
                    ]
                ),

                SizedBox(
                  height: CommonWidget.getInstance().widthFactor(context) * 0.08,
                ),

                CommonWidget.getInstance().normalText(
                    CommonColors.black, Strings.personal_info,0,CommonWidget.getInstance().widthFactor(context)*0.06,FontStyle.normal,1,FontWeight.w400),
                SizedBox(height: CommonWidget.getInstance().widthFactor(context) * 0.05,),

                editTextWidget(profileController.aboutController.text,context,Icons.info_outline,true,Strings.myStatus,
                    profileController.aboutFocus,profileController.aboutController),

                Padding(
                  padding:  EdgeInsets.only(left:CommonWidget.getInstance().widthFactor(context) * 0.05,right:CommonWidget.getInstance().widthFactor(context) * 0.05,),
                  child: const Divider(
                    height: 20,
                    thickness: 1,
                    color: CommonColors.grayColor,
                  ),
                ),

                editTextWidget(profileController.firstnameController.text,context,Icons.person,true,Strings.firstname,
                    profileController.firstnameFocus,profileController.firstnameController),

                Padding(
                  padding:  EdgeInsets.only(left:CommonWidget.getInstance().widthFactor(context) * 0.05,right:CommonWidget.getInstance().widthFactor(context) * 0.05,),
                  child: const Divider(
                    height: 20,
                    thickness: 1,
                    color: CommonColors.grayColor,
                  ),
                ),

                editTextWidget(profileController.lastnameController.text,context,Icons.person,true,Strings.lastname,
                    profileController.lastnameFocus,profileController.lastnameController),

                Padding(
                  padding:  EdgeInsets.only(left:CommonWidget.getInstance().widthFactor(context) * 0.05,right:CommonWidget.getInstance().widthFactor(context) * 0.05,),
                  child: const Divider(
                    height: 20,
                    thickness: 1,
                    color: CommonColors.grayColor,
                  ),
                ),

                editTextWidget(profileController.emailController.text,context,Icons.email_outlined,false,Strings.email,
                    profileController.emailFocus,profileController.emailController),

                Padding(
                  padding:  EdgeInsets.only(left:CommonWidget.getInstance().widthFactor(context) * 0.05,right:CommonWidget.getInstance().widthFactor(context) * 0.05,),
                  child: const Divider(
                    height: 20,
                    thickness: 1,
                    color: CommonColors.grayColor,
                  ),
                ),

                editTextWidget(profileController.contactController.text,context,Icons.phonelink_ring_outlined,true,Strings.phone,
                    profileController.contactFocus,profileController.contactController),

                Padding(
                  padding:  EdgeInsets.only(left:CommonWidget.getInstance().widthFactor(context) * 0.05,right:CommonWidget.getInstance().widthFactor(context) * 0.05,),
                  child: const Divider(
                    height: 20,
                    thickness: 1,
                    color: CommonColors.grayColor,
                  ),
                ),

                addressPasswordWidget("password",context,Icons.remove_red_eye_outlined,true,Strings.pass),

                Padding(
                  padding:  EdgeInsets.only(left:CommonWidget.getInstance().widthFactor(context) * 0.05,right:CommonWidget.getInstance().widthFactor(context) * 0.05,),
                  child: const Divider(
                    height: 20,
                    thickness: 1,
                    color: CommonColors.grayColor,
                  ),
                ),

                addressPasswordWidget(profileController.address.value,context,Icons.location_on,true,Strings.address),

                Padding(
                  padding:  EdgeInsets.only(left:CommonWidget.getInstance().widthFactor(context) * 0.05,right:CommonWidget.getInstance().widthFactor(context) * 0.05,),
                  child: const Divider(
                    height: 20,
                    thickness: 1,
                    color: CommonColors.grayColor,
                  ),
                ),

                SizedBox(
                  height: CommonWidget.getInstance().widthFactor(context) * 0.05,
                ),

          ]),
        ),

    ))));
  }

  addressPasswordWidget(String title,BuildContext context, IconData icon, bool isOn, String type){
    return GestureDetector(
      onTap: (){
        switch(type){
          case Strings.pass:
            Get.toNamed('/changePassword');
            break;

          case Strings.address:

            break;
        }
      },

      child: Row(
        //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SizedBox(
            width:  CommonWidget.getInstance().widthFactor(context) * 0.01,
          ),
          Icon(icon,color: CommonColors.primaryColor1,),

          SizedBox(
            width:  CommonWidget.getInstance().widthFactor(context) * 0.03,
          ),

          Expanded(
            child: Padding(
              padding: EdgeInsets.all(CommonWidget.getInstance().widthFactor(context) * 0.045),
              child: Text(
              title
              ),
            ),
          ),

          Visibility(
              visible: isOn,
              child: type==Strings.pass?
              const Icon(Icons.loop,color: CommonColors.darkGray,):
              const Icon(Icons.edit,color: CommonColors.darkGray,)),

          SizedBox(
            width:  CommonWidget.getInstance().widthFactor(context) * 0.03,
          ),

        ],
      ),
    );

  }


  editTextWidget(String title,BuildContext context, IconData icon, bool isOn, String type,FocusNode _focusNode,
      var _controller){
    final ProfileController profileController = Get.find();
    return Row(
      //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        SizedBox(
          width:  CommonWidget.getInstance().widthFactor(context) * 0.01,
        ),
        Icon(icon,color: CommonColors.primaryColor1,),

        SizedBox(
          width:  CommonWidget.getInstance().widthFactor(context) * 0.03,
        ),

        Expanded(
          child: TextField(
            controller: _controller,
            focusNode: _focusNode,
            keyboardType: type==Strings.phone?TextInputType.phone:TextInputType.name,
            readOnly: type==Strings.email?true:
            type==Strings.firstname?profileController.firstNameCheck.value:
            type==Strings.lastname?profileController.lastNameCheck.value:
            type==Strings.myStatus?profileController.myStatusCheck.value:
            profileController.phoneCheck.value,
            decoration: InputDecoration(
              hintText: type,
              labelText: type,
              hintStyle: const TextStyle(
                  color: CommonColors.grayColor
              ),
              labelStyle: const TextStyle(
                  color: CommonColors.black
              ),
              filled: true,
              fillColor:CommonColors.white,
              border: InputBorder.none,
            ),
          ),
        ),

        Visibility(
            visible: isOn,
            child: IconButton(
                onPressed: (){
                  FocusScope.of(context).requestFocus(_focusNode);

                  if(type==Strings.firstname){
                    if(!profileController.firstNameCheck.value) {
                      updatePlayerProfile(context);
                    }
                  }

                  if(type==Strings.lastname){
                    if(!profileController.lastNameCheck.value) {
                      updatePlayerProfile(context);
                    }
                  }

                  if(type==Strings.phone){
                    if(!profileController.phoneCheck.value) {
                      updatePlayerProfile(context);
                    }
                  }

                  if(type==Strings.myStatus){
                    if(!profileController.myStatusCheck.value) {
                      updatePlayerProfile(context);
                    }
                  }

                  type==Strings.firstname?profileController.updateFirstNameCheck():
                  type==Strings.lastname?profileController.updateLastNameCheck():
                  type==Strings.myStatus?profileController.updateMyStatusCheck():
                  profileController.updatePhoneNameCheck();
                },
                icon: type==Strings.firstname?profileController.firstNameCheck.value?
                const Icon(Icons.edit,color: CommonColors.darkGray,):
                const Icon(Icons.check,color: CommonColors.green):
                type==Strings.lastname?
                profileController.lastNameCheck.value?
                const Icon(Icons.edit,color: CommonColors.darkGray):
                const Icon(Icons.check,color: CommonColors.green):
                type==Strings.myStatus?
                profileController.myStatusCheck.value?
                const Icon(Icons.edit,color: CommonColors.darkGray):
                const Icon(Icons.check,color: CommonColors.green):
                profileController.phoneCheck.value?
                const Icon(Icons.edit,color: CommonColors.darkGray,):
                const Icon(Icons.check,color: CommonColors.green)

            )
        ),
        SizedBox(width:  CommonWidget.getInstance().widthFactor(context) * 0.03),
      ],
    );

  }

  Future<bool> updatePlayerProfile(BuildContext context) async {
    final ProfileController controller = Get.find();
    var token=await Global.getStringValuesSF(Constant.AccessToken);

    Global.showLoaderDialog(context);
    Map<String, String> headers = {
      "Accept": "application/json",
      "Authorization": 'Bearer '+token,
    };

    var request = http.MultipartRequest(
        'POST', Uri.parse(Constant.baseUrl + Constant.update_player_profile));
    request.headers.addAll(headers);
    if (pickedImage != null) {
      request.files.add(await http.MultipartFile.fromPath(
          "user_picture", pickedImage!.path));
    }

    request.fields['first_name'] = controller.firstnameController.text;
    request.fields['last_name'] = controller.lastnameController.text;
    request.fields['phone'] = controller.contactController.text;
    request.fields['address'] = "91 Heritage Lawn,Mohali";
    request.fields['user_type'] = Global.loginType.toString();
    request.fields['about'] = controller.aboutController.text;

    print(request.fields);

    await request.send().then((res) async {
      final respStr = await res.stream.bytesToString();
      var response = json.decode(respStr);

      if (res.statusCode == 201 || res.statusCode == 200) {
        Global.showSnackBar(context, response["message"]);
        Get.back();

      } else if (res.statusCode == 404) {
        Get.back();
      } else {
        Global.showSnackBar(context, response["message"]??response["error"]);
        Get.back();
      }
    }).catchError((error) {
      print(error);
      throw ("some arbitrary error");
    });

    return false;
  }

  @override
  Future<void> widgetCallBack(String title, String value, BuildContext context) async {
    final ProfileController profileController = Get.find();
    switch(title){
      case "Camera":
        pickedImage = (await ImagePicker().pickImage(source: ImageSource.camera)) ;
        profileController.updateImage(pickedImage!.path);

        break;

      case "Gallery":
        pickedImage = (await ImagePicker().pickImage(source: ImageSource.gallery)) ;
        profileController.updateImage(pickedImage!.path);
        break;

    }
  }

}
