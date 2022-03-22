import 'dart:convert';
import 'dart:io';
import 'package:axe/controller/pasword_counter.dart';
import 'package:axe/interface/callbackinterface.dart';
import 'package:axe/util/commoncolors.dart';
import 'package:axe/util/commonwidget.dart';
import 'package:axe/util/constants.dart';
import 'package:axe/util/dropdownclass.dart';
import 'package:axe/util/global.dart';
import 'package:axe/util/strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';


class SignUp extends StatelessWidget implements CallBackInterface{
  final emailController = TextEditingController();
  final firstnameController = TextEditingController();
  final lastnameController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmpasswordController = TextEditingController();
  final contactController = TextEditingController();
  final emailFocus = FocusNode();
  final firstnameFocus = FocusNode();
  final lastnameFocus = FocusNode();
  final confirmPassFocus = FocusNode();
  final contactFocus = FocusNode();
  final passwordFocus = FocusNode();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final RxBool _isSelectUserType = true.obs;
  var roleId ="".obs;
  var userRole ="Select user role".obs;

   final list = [
     {"name": "Venue"}, // 1 for venue
     {"name": "Player"},  // 2 for player
  ];

  @override
  Widget build(BuildContext context) {
    final CounterController controller = Get.find();

    return SafeArea(
      child: Scaffold(
        backgroundColor: CommonColors.white,
        resizeToAvoidBottomInset: true,
        body:Obx(()=>
         SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                CommonWidget.getInstance().normalText(
                    CommonColors.black, Strings.signu_up,0,CommonWidget.getInstance().widthFactor(context)*0.06,FontStyle.normal,2,FontWeight.w600),

                SizedBox(
                  height: CommonWidget.getInstance().heightFactor(context) * 0.01,
                ),

                GestureDetector(
                  behavior: HitTestBehavior.translucent,
                  onTap: (){
                   Global.showPicker(context,this);

                  },
                  child: Center(
                    child: controller.pickedImage.value == ""?Container(
                      width:  CommonWidget.getInstance().widthFactor(context) * 0.25,
                      height:  CommonWidget.getInstance().widthFactor(context) * 0.25,
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
                            child:
                            controller.pickedImage.value == "" ?
                            Image.asset("assets/images/camera.png")
                                : Image.file(File(controller.pickedImage.value),fit: BoxFit.contain,
                              width:  CommonWidget.getInstance().widthFactor(context) * 0.20,
                              height:  CommonWidget.getInstance().widthFactor(context) * 0.20,
                            )),
                      ),
                    ):CircleAvatar(
                      backgroundImage: FileImage(File(controller.pickedImage.value),),
                      radius: CommonWidget.getInstance().widthFactor(context) * 0.1,
                    ),
                  ),
                ),

                SizedBox(
                  height: CommonWidget.getInstance().heightFactor(context) * 0.02,
                ),

                Padding(
                  padding: const EdgeInsets.only(left: 18.0,right:18),
                  child: Form(
                      key: formKey,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [

                          CommonWidget.getInstance().normalText(
                            CommonColors.black, Strings.firstname,0,CommonWidget.getInstance().widthFactor(context)*0.04,FontStyle.normal,1,FontWeight.w600),

                          SizedBox(
                            height: CommonWidget.getInstance().heightFactor(context) * 0.02,
                          ),

                          CommonWidget.getInstance().editTextField(
                              "name",
                              context,
                              false,
                              CommonColors.textfiled_gray,
                              Strings.enter_name_first,
                              "",
                              firstnameController,
                              TextInputType.emailAddress,
                              firstnameFocus,
                              lastnameFocus,
                              false, //hide text
                              false, //read text
                              "email",
                              0),

                          SizedBox(
                            height:
                            CommonWidget.getInstance().heightFactor(context) *
                                0.02,
                          ),


                          CommonWidget.getInstance().normalText(
                              CommonColors.black, Strings.lastname,0,CommonWidget.getInstance().widthFactor(context)*0.04,FontStyle.normal,1,FontWeight.w600),

                          SizedBox(
                            height: CommonWidget.getInstance().heightFactor(context) * 0.02,
                          ),

                          CommonWidget.getInstance().editTextField(
                              "name",
                              context,
                              false,
                              CommonColors.textfiled_gray,
                              Strings.enter_name_last,
                              "",
                              lastnameController,
                              TextInputType.emailAddress,
                              lastnameFocus,
                              emailFocus,
                              false, //hide text
                              false, //read text
                              "email",
                              0),

                          SizedBox(
                            height:
                            CommonWidget.getInstance().heightFactor(context) *
                                0.02,
                          ),

                          CommonWidget.getInstance().normalText(
                              CommonColors.black, Strings.userType,0,CommonWidget.getInstance().widthFactor(context)*0.04,FontStyle.normal,1,FontWeight.w600),

                          SizedBox(
                            height: CommonWidget.getInstance().heightFactor(context) * 0.02,
                          ),

                          SizedBox(
                              height:
                              CommonWidget.getInstance().heightFactor(context) *
                                  0.09,
                              child: DropDownClass(
                                  roleId.value==""&&!_isSelectUserType.value?CommonColors.red:CommonColors.darkGray, "usertypeDropdown",
                                  userRole.value, list,
                                  this, "0",false, true)),


                          CommonWidget.getInstance().normalText(
                            CommonColors.black, Strings.email,0,CommonWidget.getInstance().widthFactor(context)*0.04,FontStyle.normal,1,FontWeight.w600),

                          SizedBox(
                            height: CommonWidget.getInstance().heightFactor(context) * 0.02,
                          ),

                          CommonWidget.getInstance().editTextField(
                              "email",
                              context,
                              false,
                              CommonColors.textfiled_gray,
                              Strings.enter_email,
                              "This  field is mandatory",
                              emailController,
                              TextInputType.emailAddress,
                              emailFocus,
                              contactFocus,
                              false,
                              false,
                              "email",
                              0),

                          SizedBox(
                            height: CommonWidget.getInstance().heightFactor(context) * 0.015,
                          ),

                          CommonWidget.getInstance().normalText(
                              CommonColors.black, Strings.contact,0,CommonWidget.getInstance().widthFactor(context)*0.04,FontStyle.normal,1,FontWeight.w600),

                          SizedBox(
                            height: CommonWidget.getInstance().heightFactor(context) * 0.02,
                          ),

                          CommonWidget.getInstance().editTextField(
                              "phone",
                              context,
                              false,
                              CommonColors.textfiled_gray,
                              Strings.enter_contact,
                              "This  field is mandatory",
                              contactController,
                              TextInputType.phone,
                              contactFocus,
                              passwordFocus,
                              false,
                              false,
                              "phone",
                              0),

                          SizedBox(
                            height: CommonWidget.getInstance().heightFactor(context) * 0.015,
                          ),

                          CommonWidget.getInstance().normalText(
                              CommonColors.black, Strings.pass,0,CommonWidget.getInstance().widthFactor(context)*0.04,FontStyle.normal,1,FontWeight.w600),

                          SizedBox(
                            height: CommonWidget.getInstance().heightFactor(context) * 0.02,
                          ),
                          CommonWidget.getInstance().editTextField(
                              "password",
                              context,
                              true,
                              CommonColors.textfiled_gray,
                              Strings.pass,
                              "This  field is mandatory",
                              passwordController,
                              TextInputType.emailAddress,
                              passwordFocus,
                              confirmPassFocus,
                              controller.isValue.value,
                              false,
                              "email",
                              0),

                          SizedBox(
                            height: CommonWidget.getInstance().heightFactor(context) * 0.015,
                          ),
                          CommonWidget.getInstance().normalText(
                              CommonColors.black, Strings.conirm_pass,0,CommonWidget.getInstance().widthFactor(context)*0.04,FontStyle.normal,1,FontWeight.w600),

                          SizedBox(
                            height: CommonWidget.getInstance().heightFactor(context) * 0.02,
                          ),

                          CommonWidget.getInstance().editTextField(
                              "password",
                              context,
                              true,
                              CommonColors.textfiled_gray,
                              Strings.re_enter_pass,
                              "This  field is mandatory",
                              confirmpasswordController,
                              TextInputType.emailAddress,
                              confirmPassFocus,
                              null,
                              controller.isValue.value,
                              false,
                              "email",
                              0),

                          SizedBox(
                            height: CommonWidget.getInstance().heightFactor(context) * 0.04,
                          ),

                          Padding(
                            padding: const EdgeInsets.only(left:6.0),
                            child: CommonWidget.getInstance().flexibleButton(
                              context,
                              Strings.sign_up,
                              double.infinity,
                              CommonWidget.getInstance().widthFactor(context) * 0.13,
                              CommonColors.primaryColor1,
                              CommonColors.primaryColor1,
                              CommonColors.white,
                              this,
                            ),
                          ),

                          SizedBox(
                            height: CommonWidget.getInstance().heightFactor(context) * 0.04,
                          ),

                          GestureDetector(
                            onTap: (){
                              Get.toNamed('/login');


                            },
                            child: Container(
                              alignment: Alignment.bottomCenter,
                              child: RichText(
                                text: TextSpan(
                                  style:  TextStyle(
                                    fontSize: CommonWidget.getInstance().widthFactor(context) * 0.03,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
                                  children: const <TextSpan>[
                                    TextSpan(text: Strings.already_account,
                                      style: TextStyle(color: CommonColors.black,
                                        fontFamily: 'nunito_regular.ttf',
                                        letterSpacing: 1

                                      ),
                                    ),
                                    TextSpan(
                                        text: Strings.login,
                                        style: TextStyle(color: CommonColors.primaryColor1,
                                          fontFamily: 'nunito_regular.ttf',
                                            letterSpacing: 1

                                        )),
                                    TextSpan(
                                        text: Strings.here,
                                        style: TextStyle(color: CommonColors.black,
                                          fontFamily: 'nunito_regular.ttf',
                                            letterSpacing: 1

                                        )),
                                  ],
                                ),
                              ),
                            ),
                          ),

                          SizedBox(
                            height: CommonWidget.getInstance().heightFactor(context) * 0.04,
                          ),


                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [

                               const Expanded(child: Divider(height:10,thickness:1,color: CommonColors.grayColor,)),
                              SizedBox(
                                width: CommonWidget.getInstance().widthFactor(context) * 0.04,
                              ),

                              CommonWidget.getInstance().normalText(
                                CommonColors.grayColor, Strings.or_signup_with,0,CommonWidget.getInstance().widthFactor(context)*0.04,FontStyle.normal,1,FontWeight.w600),

                              SizedBox(
                                width: CommonWidget.getInstance().widthFactor(context) * 0.04,
                              ),

                              const Expanded(child: Divider(height:10,thickness:1,color: CommonColors.grayColor,)),

                            ],
                          ),


                          SizedBox(
                            height: CommonWidget.getInstance().heightFactor(context) * 0.02,
                          ),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Image.asset("assets/images/apple.png"),
                              Image.asset("assets/images/fb.png"),
                              Image.asset("assets/images/google.png"),
                            ],
                          )
                        ],
                      )),
                ),
              ],
            ),
          ),
        ))
      ),
    );
  }

  XFile? pickedImage;


   Future<bool> signUp(BuildContext context) async {

     Global.showLoaderDialog(context);
     Map<String, String> headers = {
       "Accept": "application/json",
     };

     var request = http.MultipartRequest(
         'POST', Uri.parse(Constant.baseUrl + Constant.signup));
     request.headers.addAll(headers);
     if (pickedImage != null) {
       request.files.add(await http.MultipartFile.fromPath(
           "user_picture", pickedImage!.path));
     }

     request.fields['first_name'] = firstnameController.text;
     request.fields['last_name'] = lastnameController.text;
     request.fields['user_type'] = roleId.value;
     request.fields['email'] = emailController.text;
     request.fields['password'] = passwordController.text;
     request.fields['c_password'] = confirmpasswordController.text;
     request.fields['device_token'] = Constant.deviceToken;

     await request.send().then((res) async {
       final respStr = await res.stream.bytesToString();
       var response = json.decode(respStr);

       if (res.statusCode == 201 || res.statusCode == 200) {
         Get.back();
         Global.showSnackBar(context, response["message"]);
         Global.addStringToSF( response["user"]["first_name"], Constant.firstname);
         Global.addStringToSF( response["user"]["last_name"], Constant.lastname);
         await Global.addStringToSF(response["user"]["user_type"].toString(),Constant.LoginType);  // 1 for user 2 for vender
         Global.loginType=response["user"]["user_type"].toString();
         Global.addStringToSF( response["access_token"],Constant.AccessToken);
         Global.addStringToSF(response["user"]["email"],Constant.email);

         Get.toNamed('/home');


       } else if (res.statusCode == 404) {
         Get.back();
         if (json.decode(respStr)["data"]["email"] != null) {
           Global.showSnackBar(context, json.decode(respStr)["data"]["email"][0].toString());
         } else if (json.decode(respStr)["data"]["c_password"] != null) {
           Global.showSnackBar(context, json.decode(respStr)["data"]["c_password"][0].toString());
         }
       } else {
         Get.back();
         Global.showSnackBar(context, response["error"]);
       }
     }).catchError((error) {
       error.message = jsonDecode(error.toString())["message"];
       throw ("some arbitrary error");
     });

     return false;
   }


   @override
    Future<void> widgetCallBack(String title, String value, BuildContext context) async {
     final CounterController controller =Get.find();
     switch(title){
      case Strings.sign_up:
        print(roleId);
        if(CommonWidget.getInstance().isValidate(formKey)){
          if(roleId.value !=""){
          if(passwordController.text==confirmpasswordController.text){
            FocusScopeNode currentFocus = FocusScope.of(context);
            if (!currentFocus.hasPrimaryFocus) {
              currentFocus.unfocus();
            }
            signUp(context);
          }else {
            Global.showSnackBar(context,"Password does not match");
          }
          }else {
            _isSelectUserType.value = false;
            Global.showSnackBar(context,"Please select user role");
          }
        }

        break;

      case "usertypeDropdown":
        var map = json.decode(value);
        var type = map["name"];
        userRole.value = map["name"];
        // type=="Venue"?roleId="1":roleId="2";
        roleId.value= type=="Venue"?"1":"2";
        break;

      case "Camera":
         pickedImage = (await ImagePicker().pickImage(source: ImageSource.camera)) ;
         controller.updateImage(pickedImage!.path);

        break;

      case "Gallery":
         pickedImage = (await ImagePicker().pickImage(source: ImageSource.gallery)) ;
         controller.updateImage(pickedImage!.path);

    }
  }
}
