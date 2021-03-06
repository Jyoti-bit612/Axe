import 'package:axe/controller/invitationcontroller.dart';
import 'package:axe/controller/league_controller.dart';
import 'package:axe/controller/profile_controller.dart';
import 'package:axe/interface/callbackinterface.dart';
import 'package:axe/util/commoncolors.dart';
import 'package:axe/util/commonwidget.dart';
import 'package:axe/util/constants.dart';
import 'package:axe/util/global.dart';
import 'package:axe/util/strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'dart:convert';
import 'dart:io';

class Profile extends StatelessWidget  implements CallBackInterface{
   Profile({Key? key}) : super(key: key);
   var myMenuItems = <String>[
    Strings.privacy_profile,
    Strings.help_center,
    Strings.report,
    Strings.logout,
  ];

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
              //Click on no to reset/go to previous state
              onPressed: () {
                Get.back();
              },
              child: const Text('No'),
            ),
            TextButton(
              //Click on yes to perform operation according to use
              onPressed: () {
                Global.logOut(endUrl: Constant.logout);
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
    final ProfileController controller = Get.find();
    final LeagueController leagueController = Get.find();
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
          child: controller.profilePojo.value.data==null?const Center(child: CircularProgressIndicator()):Padding(
            padding: EdgeInsets.all(CommonWidget.getInstance().widthFactor(context) * 0.02),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  height: CommonWidget.getInstance().heightFactor(context) * 0.01,
                ),

              Obx(()=>Center(
                  child: GestureDetector(
                    onTap: (){
                      Global.showPicker(context,this);
                    },
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
                      child:  Padding(
                        padding: const EdgeInsets.all(1.0),
                        child: controller.pickedImage.value == ""?
                        controller.picture.value==""? CircleAvatar(
                            backgroundColor: CommonColors.textfiled_gray,
                            child: Image.asset("assets/images/camera.png")
                        ):CircleAvatar(
                            backgroundColor: CommonColors.textfiled_gray,
                            backgroundImage:NetworkImage(Constant.imageUrl+controller.picture.value)
                        ):CircleAvatar(
                            backgroundColor: CommonColors.textfiled_gray,
                            backgroundImage:FileImage(File(controller.pickedImage.value)
                            )
                        ),
                      )
                    ),
                  ))),

                SizedBox(
                  height: CommonWidget.getInstance().heightFactor(context) * 0.02,
                ),

                Center(
                  child: CommonWidget.getInstance().normalText(CommonColors.black,
                      controller.firstnameController.text+" "+controller.lastnameController.text,
                      0,CommonWidget.getInstance().widthFactor(context)*0.06,FontStyle.normal,1,FontWeight.w400),
                ),
                SizedBox(
                  height: CommonWidget.getInstance().widthFactor(context) * 0.01,
                ),
                Center(
                  child: CommonWidget.getInstance().normalText(CommonColors.darkGray,
                      controller.aboutController.text==""?"About you":controller.aboutController.text,
                      1,CommonWidget.getInstance().widthFactor(context)*0.03,FontStyle.normal,1,FontWeight.w600),
                ),

                SizedBox(
                  height: CommonWidget.getInstance().widthFactor(context) * 0.05,
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      GestureDetector(
                        onTap: (){
                          Get.toNamed('/createLeague');
                        },
                        child: SizedBox(
                            width: CommonWidget.getInstance().widthFactor(context) * 0.3,
                            height: CommonWidget.getInstance().widthFactor(context) * 0.25,
                            child: DecoratedBox(
                              decoration: const BoxDecoration(
                                  borderRadius: BorderRadius.all(Radius.circular(6)),
                                  gradient: LinearGradient(colors: [CommonColors.primaryColor1 ,CommonColors.primaryColor2],
                                    begin: Alignment.topRight,
                                    end: Alignment.bottomCenter,
                                  )),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [

                                  Image.asset("assets/images/create_league.png",width: CommonWidget.getInstance().widthFactor(context) * 0.09,),

                                  SizedBox(
                                    height: CommonWidget.getInstance().widthFactor(context) * 0.03,
                                  ),
                                  CommonWidget.getInstance().normalText(
                                      CommonColors.white, Strings.create_league,1,CommonWidget.getInstance().widthFactor(context)*0.03,FontStyle.normal,1,FontWeight.w600),

                                ],
                              ) ,
                            )),
                      ),
                      GestureDetector(
                        onTap: (){
                          Get.toNamed('/createMatch');
                          leagueController.getLeague();
                        },
                        child: SizedBox(
                            width: CommonWidget.getInstance().widthFactor(context) * 0.3,
                            height: CommonWidget.getInstance().widthFactor(context) * 0.25,
                            child: DecoratedBox(
                              decoration: const BoxDecoration(
                                  borderRadius: BorderRadius.all(Radius.circular(6)),
                                  gradient: LinearGradient(colors: [CommonColors.primaryColor1 ,CommonColors.primaryColor2],
                                    begin: Alignment.topLeft,
                                    end: Alignment.bottomCenter,
                                  )),

                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [

                                  Image.asset("assets/images/create_match2.png",width: CommonWidget.getInstance().widthFactor(context) * 0.09,),

                                  SizedBox(
                                    height: CommonWidget.getInstance().widthFactor(context) * 0.03,
                                  ),
                                  CommonWidget.getInstance().normalText(
                                      CommonColors.white, Strings.create_match,1,CommonWidget.getInstance().widthFactor(context)*0.03,FontStyle.normal,1,FontWeight.w600),
                                ],
                              ) ,
                            )),
                      ),
                      GestureDetector(
                        onTap: (){
                          Get.toNamed(Strings.screenPlayerList);
                        },
                        child: SizedBox(
                            width: CommonWidget.getInstance().widthFactor(context) * 0.3,
                            height: CommonWidget.getInstance().widthFactor(context) * 0.25,
                            child: DecoratedBox(
                              decoration: const BoxDecoration(
                                  borderRadius: BorderRadius.all(Radius.circular(6)),
                                  gradient: LinearGradient(colors: [CommonColors.primaryColor1 ,CommonColors.primaryColor2],
                                    begin: Alignment.topLeft,
                                    end: Alignment.bottomCenter,
                                  )),

                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [

                                  Image.asset("assets/images/playerprofile.png",width: CommonWidget.getInstance().widthFactor(context) * 0.09,),
                                  SizedBox(
                                    height: CommonWidget.getInstance().widthFactor(context) * 0.03,
                                  ),
                                  CommonWidget.getInstance().normalText(
                                      CommonColors.white, Strings.player,1,CommonWidget.getInstance().widthFactor(context)*0.03,FontStyle.normal,1,FontWeight.w600),
                                ],
                              ) ,
                            )),
                      )
                    ]
                ),

                SizedBox(
                  height: CommonWidget.getInstance().widthFactor(context) * 0.08,
                ),

                CommonWidget.getInstance().normalText(
                    CommonColors.black, Strings.personal_info,0,CommonWidget.getInstance().widthFactor(context)*0.06,FontStyle.normal,1,FontWeight.w400),
                SizedBox(
                  height: CommonWidget.getInstance().widthFactor(context) * 0.05,
                ),

                editTextWidget(controller.aboutFocus,controller.aboutController.text,context,Icons.info_outline,true,Strings.myStatus,
                    controller.aboutController),
                Padding(
                  padding:  EdgeInsets.only(left:CommonWidget.getInstance().widthFactor(context) * 0.05,right:CommonWidget.getInstance().widthFactor(context) * 0.05,),
                  child: const Divider(
                    height: 20,
                    thickness: 1,
                    color: CommonColors.grayColor,
                  ),
                ),

                editTextWidget(controller.firstnameFocus,controller.firstnameController.text,context,Icons.person,
                    true,Strings.firstname,controller.firstnameController),

                Padding(
                  padding:  EdgeInsets.only(left:CommonWidget.getInstance().widthFactor(context) * 0.05,right:CommonWidget.getInstance().widthFactor(context) * 0.05,),
                  child: const Divider(
                    height: 20,
                    thickness: 1,
                    color: CommonColors.grayColor,
                  ),
                ),

                editTextWidget(controller.lastnameFocus,controller.lastnameController.text,context,Icons.person,true,
                    Strings.lastname,controller.lastnameController),

                Padding(
                  padding:  EdgeInsets.only(left:CommonWidget.getInstance().widthFactor(context) * 0.05,right:CommonWidget.getInstance().widthFactor(context) * 0.05,),
                  child: const Divider(
                    height: 20,
                    thickness: 1,
                    color: CommonColors.grayColor,
                  ),
                ),

                editTextWidget(controller.emailFocus,controller.emailController.text,context,Icons.email_outlined,false,
                    Strings.email,controller.emailController),

                Padding(
                  padding: EdgeInsets.only(left:CommonWidget.getInstance().widthFactor(context) * 0.05,right:CommonWidget.getInstance().widthFactor(context) * 0.05,),
                  child: const Divider(
                    height: 20,
                    thickness: 1,
                    color: CommonColors.grayColor,
                  ),
                ),

                editTextWidget(controller.contactFocus,controller.contactController.text,context,Icons.phonelink_ring_outlined,true,
                    Strings.phone,controller.contactController),

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

                Obx(()=>addressPasswordWidget(controller.address.value,context,Icons.location_on,true,Strings.address)),

                Padding(
                  padding:  EdgeInsets.only(left:CommonWidget.getInstance().widthFactor(context) * 0.05,right:CommonWidget.getInstance().widthFactor(context) * 0.05,),
                  child: const Divider(
                    height: 20,
                    thickness: 1,
                    color: CommonColors.grayColor,
                  ),
                ),

                SizedBox(
                  height: CommonWidget.getInstance().widthFactor(context) * 0.06,
                ),

                Center(
                  child: Padding(
                    padding: const EdgeInsets.only(left:6.0),
                    child: CommonWidget.getInstance().flexibleButton(
                      context,
                      Strings.player_request,
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
          case "address":
            break;
        }
      },

      child: Row(
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
              child: Text(title),
            ),
          ),

          Visibility(
              visible: isOn,
              child: type==Strings.pass?
              const Icon(Icons.loop,color: CommonColors.darkGray,):Container()),
              // const Icon(Icons.edit,color: CommonColors.darkGray,)),

          SizedBox(
            width:  CommonWidget.getInstance().widthFactor(context) * 0.03,
          ),

        ],
      ),
    );
  }


  editTextWidget(/*String hint,*/FocusNode _focusNode,String title,BuildContext context, IconData icon, bool isOn, String type,
      var _controller){
    final ProfileController controller = Get.find();
    return   Obx(()=>Row(
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
            style: TextStyle(fontSize: CommonWidget.getInstance().widthFactor(context)*0.04),
            readOnly: type==Strings.email?true:
            type==Strings.firstname?controller.firstNameCheck.value:
            type==Strings.lastname?controller.lastNameCheck.value:
            type==Strings.myStatus?controller.myStatusCheck.value:
            controller.phoneCheck.value?true:false,
            decoration: InputDecoration(
              hintText: type,
              labelText: type,
              hintStyle: const TextStyle(
                color: CommonColors.grayColor
              ),
              labelStyle: const TextStyle(
                color: CommonColors.black, fontSize: 20.0
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

                  if(type == Strings.firstname){
                  if(!controller.firstNameCheck.value) {
                    updateprofile(context);
                  }
                  }

                  if(type == Strings.lastname){
                    if(!controller.lastNameCheck.value) {
                      updateprofile(context);
                    }
                  }

                  if(type==Strings.phone){
                    if(!controller.phoneCheck.value) {
                      updateprofile(context);
                    }
                  }

                  if(type==Strings.myStatus&&!controller.myStatusCheck.value){
                      updateprofile(context);
                  }

                  type==Strings.firstname?controller.updateFirstNameCheck():
                  type==Strings.lastname?controller.updateLastNameCheck():
                  type==Strings.myStatus?controller.updateMyStatusCheck():
                  controller.updatePhoneNameCheck();
                },
                icon: type==Strings.firstname?controller.firstNameCheck.value?
                const Icon(Icons.edit,color: CommonColors.darkGray,):
                const Icon(Icons.check,color: CommonColors.green):
                type==Strings.lastname?
                controller.lastNameCheck.value?
                const Icon(Icons.edit,color: CommonColors.darkGray,):
                const Icon(Icons.check,color: CommonColors.green):
                type==Strings.myStatus?
                controller.myStatusCheck.value?
                const Icon(Icons.edit,color: CommonColors.darkGray,):
                const Icon(Icons.check,color: CommonColors.green):
                controller.phoneCheck.value?
                const Icon(Icons.edit,color: CommonColors.darkGray,):
                const Icon(Icons.check,color: CommonColors.green)

            )
        ),
        SizedBox(
          width:  CommonWidget.getInstance().widthFactor(context) * 0.03,
        ),
      ],
    ));
  }

   // ignore: prefer_typing_uninitialized_variables
   var pickedImage;

   Future<bool> updateprofile(BuildContext context) async {
     final ProfileController controller = Get.find();
     var token=await Global.getStringValuesSF(Constant.AccessToken);

     Global.showLoaderDialog(context);
     Map<String, String> headers = {
       "Accept": "application/json",
       "Authorization": 'Bearer '+token,
     };

     var request = http.MultipartRequest(
         'POST', Uri.parse(Constant.baseUrl + Constant.update_venue_profile));
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

     await request.send().then((res) async {
       final respStr = await res.stream.bytesToString();
       var response = json.decode(respStr);

       if (res.statusCode == 201 || res.statusCode == 200) {
         Global.showSnackBar(context, response["message"]);
         Get.back();

       } else if (res.statusCode == 404) {
         Get.back();
       } else {
         Global.showSnackBar(context, response["message"]);
         Get.back();
       }
     }).catchError((error) {
       error.message = jsonDecode(error.toString())["message"];
       throw ("some arbitrary error");
     });

     return false;
   }


   @override
  Future<void> widgetCallBack(String title, String value, BuildContext context) async {
     final ProfileController controller = Get.find();
     final InvitationController invitationController = Get.find();

     switch(title){
      case Strings.player_request:
        invitationController.getInvitationDetails();
        Get.toNamed(Strings.screenNewInvitation);
        break;
        case Strings.practice_match:

        break;
        case Strings.update_profile:
        updateprofile(context);
        break;

        case Strings.camera:
        pickedImage = (await ImagePicker().pickImage(source: ImageSource.camera));
        if(pickedImage != null){
          controller.updateImage(pickedImage!.path);
          updateprofile(context);
        }
        break;

       case Strings.gallery:
        pickedImage = (await ImagePicker().pickImage(source: ImageSource.gallery));
        if(pickedImage != null){
          controller.updateImage(pickedImage!.path);
          updateprofile(context);
        }
        break;

    }
  }
}
