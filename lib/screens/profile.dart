
import 'package:axe/controller/profile_controller.dart';
import 'package:axe/interface/CallBackInterface.dart';
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
        print('Home clicked');
        break;
      case Strings.help_center:
        print('Profile clicked');
        break;
      case Strings.report:
        print('Setting clicked');
        break;

      case Strings.logout:
        print('Setting clicked');
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    final ProfileController controller = Get.find();

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
                icon: Icon(Icons.more_vert_rounded,color: CommonColors.black),
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

        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(CommonWidget.getInstance().widthFactor(context) * 0.02),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  height: CommonWidget.getInstance().heightFactor(context) * 0.01,
                ),

              Center(
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
                        child: controller.pickedImage.value == "" ?CircleAvatar(
                            backgroundColor: CommonColors.textfiled_gray,
                            child: Image.asset("assets/images/camera.png")

                        ):CircleAvatar(
                            backgroundColor: CommonColors.textfiled_gray,
                            backgroundImage:FileImage(File(controller.pickedImage.value)
                            )
                        ),
                      )
                    ),
                  )),

                SizedBox(
                  height: CommonWidget.getInstance().heightFactor(context) * 0.02,
                ),

                Center(
                  child: CommonWidget.getInstance().normalText(
                      CommonColors.black, "John D. McHenry",0,CommonWidget.getInstance().widthFactor(context)*0.06,FontStyle.normal,1,FontWeight.w400),
                ),
                SizedBox(
                  height: CommonWidget.getInstance().widthFactor(context) * 0.01,
                ),
                Center(
                  child: CommonWidget.getInstance().normalText(
                      CommonColors.darkGray, "Spending some budget in the axe tournaments. event coordinator Texas",1,CommonWidget.getInstance().widthFactor(context)*0.03,FontStyle.normal,1,FontWeight.w600),
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
                          Get.toNamed('/playerlist');
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

                editTextWidget(Constant.firstname,context,Icons.person,true,"name",controller.firstnameController),

                Padding(
                  padding:  EdgeInsets.only(left:CommonWidget.getInstance().widthFactor(context) * 0.05,right:CommonWidget.getInstance().widthFactor(context) * 0.05,),
                  child: const Divider(
                    height: 20,
                    thickness: 1,
                    color: CommonColors.grayColor,
                  ),
                ),


                editTextWidget(Constant.lastname,context,Icons.person,true,"name",controller.lastnameController),

                Padding(
                  padding:  EdgeInsets.only(left:CommonWidget.getInstance().widthFactor(context) * 0.05,right:CommonWidget.getInstance().widthFactor(context) * 0.05,),
                  child: const Divider(
                    height: 20,
                    thickness: 1,
                    color: CommonColors.grayColor,
                  ),
                ),

                editTextWidget(Constant.email,context,Icons.email_outlined,false,"email",controller.emailController),

                Padding(
                  padding: EdgeInsets.only(left:CommonWidget.getInstance().widthFactor(context) * 0.05,right:CommonWidget.getInstance().widthFactor(context) * 0.05,),
                  child: const Divider(
                    height: 20,
                    thickness: 1,
                    color: CommonColors.grayColor,
                  ),
                ),

                editTextWidget("+915263254563",context,Icons.phonelink_ring_outlined,true,"phone",controller.contactController),

                Padding(
                  padding:  EdgeInsets.only(left:CommonWidget.getInstance().widthFactor(context) * 0.05,right:CommonWidget.getInstance().widthFactor(context) * 0.05,),
                  child: const Divider(
                    height: 20,
                    thickness: 1,
                    color: CommonColors.grayColor,
                  ),
                ),

                addressPasswordWidget("password",context,Icons.remove_red_eye_outlined,true,"password"),

                Padding(
                  padding:  EdgeInsets.only(left:CommonWidget.getInstance().widthFactor(context) * 0.05,right:CommonWidget.getInstance().widthFactor(context) * 0.05,),
                  child: const Divider(
                    height: 20,
                    thickness: 1,
                    color: CommonColors.grayColor,
                  ),
                ),

                addressPasswordWidget("91 Heritage Lawn",context,Icons.location_on,true,"address"),

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
                      Strings.update_profile,
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

    )));
  }

  addressPasswordWidget(String title,BuildContext context, IconData icon, bool isOn, String type){
    return GestureDetector(
      onTap: (){
        switch(type){
          case "password":
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
              child: Text(
              title
              ),
            ),
          ),

          Visibility(
              visible: isOn,
              child: type=="password"?
              Icon(Icons.loop,color: CommonColors.darkGray,):
              Icon(Icons.edit,color: CommonColors.darkGray,)),

          SizedBox(
            width:  CommonWidget.getInstance().widthFactor(context) * 0.03,
          ),

        ],
      ),
    );
  }


  editTextWidget(String title,BuildContext context, IconData icon, bool isOn, String type,var _controller){
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
            readOnly: type=="email"?true:false,
            decoration: InputDecoration(
              hintText: title,
              filled: true,
              fillColor:CommonColors.white,
              border: InputBorder.none,
            ),
          ),
        ),

        Visibility(
            visible: isOn,
            child: type=="password"?
            Icon(Icons.loop,color: CommonColors.darkGray,):
            Icon(Icons.edit,color: CommonColors.darkGray,)),

        SizedBox(
          width:  CommonWidget.getInstance().widthFactor(context) * 0.03,
        ),
      ],
    );
  }

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

     await request.send().then((res) async {
       final respStr = await res.stream.bytesToString();
       var response = json.decode(respStr);

       if (res.statusCode == 201 || res.statusCode == 200) {
         Global.showSnackBar(context, response["message"]);
         Global.addStringToSF( response["user"]["first_name"], Constant.firstname);
         Global.addStringToSF( response["user"]["last_name"], Constant.lastname);

       } else if (res.statusCode == 404) {
       } else {
         Global.showSnackBar(context, response["message"]);

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

     switch(title){
      case Strings.player_request:
        Get.toNamed('/newInvitaton');

        break;

        case Strings.practice_match:

        break;

      case Strings.update_profile:
        updateprofile(context);
        break;

      case "Camera":
        pickedImage = (await ImagePicker().pickImage(source: ImageSource.camera)) ;
        controller.updateImage(pickedImage!.path);

        break;

      case "Gallery":
        pickedImage = (await ImagePicker().pickImage(source: ImageSource.gallery)) ;
        controller.updateImage(pickedImage!.path);
        break;

    }
  }
}
