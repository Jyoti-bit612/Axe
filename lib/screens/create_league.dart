import 'dart:convert';
import 'dart:io';
import 'package:axe/controller/league_controller.dart';
import 'package:axe/interface/CallBackInterface.dart';
import 'package:axe/screens/login.dart';
import 'package:axe/util/commoncolors.dart';
import 'package:axe/util/commonwidget.dart';
import 'package:axe/util/constants.dart';
import 'package:axe/util/dropdownclass.dart';
import 'package:axe/util/global.dart';
import 'package:axe/util/strings.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';

class CreateLeague extends  StatelessWidget  implements CallBackInterface{

 final titleController = TextEditingController();
 final adress1Controller = TextEditingController();
 final address2Controller = TextEditingController();
  final descriptionController = TextEditingController();
  final titleFocus = FocusNode();
  final adress1Focus = FocusNode();
  final address2Focus = FocusNode();
  final descriptionFocus = FocusNode();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  CreateLeague({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final LeagueController controller = Get.find();
    return SafeArea(
      child: Scaffold(
        backgroundColor: CommonColors.white,
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
              children: [

              SizedBox(
                height: CommonWidget.getInstance().widthFactor(context) * 0.04,
              ),
                Padding(
                  padding: EdgeInsets.all(CommonWidget.getInstance().widthFactor(context) * 0.01),
                  child: IconButton(
                      padding: EdgeInsets.zero,
                      constraints: BoxConstraints(),
                      onPressed: (){
                        Get.back();
                      }, icon: const Icon(Icons.arrow_back_rounded)),
                ),


                Center(child: Image.asset("assets/images/trophy.png")),

                SizedBox(
                  height: CommonWidget.getInstance().widthFactor(context) * 0.01,
                ),

                Center(
                  child: CommonWidget.getInstance().normalText(
                      CommonColors.black,Strings.create_league,2,CommonWidget.getInstance().widthFactor(context)*0.06,FontStyle.normal,0,
                      FontWeight.w600,fontfamily: false),
                ),
              Padding(
                padding:  EdgeInsets.all(CommonWidget.getInstance().widthFactor(context) * 0.05),
                child: const Divider(height:1,thickness:1,color: CommonColors.lightgrayColor,),
              ),


        GestureDetector(
          onTap: (){
            Global.showPicker(context,this);
          },
          child: Obx(()=>Center(
            child: Container(
              width:  CommonWidget.getInstance().widthFactor(context) * 0.29,
              height:  CommonWidget.getInstance().widthFactor(context) * 0.29,
              decoration: const BoxDecoration(
                gradient: LinearGradient(colors: [CommonColors.primaryColor1 ,CommonColors.imageRed],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomCenter,
                ),
                shape: BoxShape.circle,

              ),
              child: Padding(
                padding: const EdgeInsets.all(1.0),
                child: controller.pickedImage.value == "" ?CircleAvatar(
                    backgroundColor: CommonColors.textfiled_gray,
                    child: Image.asset("assets/images/camera.png")

                ):CircleAvatar(
                    backgroundColor: CommonColors.textfiled_gray,
                    backgroundImage:
                    FileImage(File(controller.pickedImage.value),
                )
              ),
            ),
          )))),

              SizedBox(
                height: CommonWidget.getInstance().widthFactor(context) * 0.02,
              ),

              Center(
                child: CommonWidget.getInstance().normalText(
                    CommonColors.darkGray,Strings.choose_logo,2,CommonWidget.getInstance().widthFactor(context)*0.04,FontStyle.normal,0,
                    FontWeight.w600,fontfamily: false),
              ),

              SizedBox(
                height: CommonWidget.getInstance().widthFactor(context) * 0.02,
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
                            CommonColors.black, Strings.league_title,0,CommonWidget.getInstance().widthFactor(context)*0.04,FontStyle.normal,1,FontWeight.w600),

                        SizedBox(
                          height: CommonWidget.getInstance().heightFactor(context) * 0.02,
                        ),

                        CommonWidget.getInstance().editTextField(
                            "name",
                            context,
                            false,
                            CommonColors.textfiled_gray,
                            Strings.league_title,
                            "",
                            titleController,
                            TextInputType.emailAddress,
                            titleFocus,
                            adress1Focus,
                            false,
                            false,
                            "email",
                            0),

                        SizedBox(
                          height:
                          CommonWidget.getInstance().heightFactor(context) *
                              0.02,
                        ),


                        CommonWidget.getInstance().normalText(
                            CommonColors.black, Strings.addres_line1,0,CommonWidget.getInstance().widthFactor(context)*0.04,FontStyle.normal,1,FontWeight.w600),

                        SizedBox(
                          height: CommonWidget.getInstance().heightFactor(context) * 0.02,
                        ),

                        CommonWidget.getInstance().editTextField(
                            "name",
                            context,
                            false,
                            CommonColors.textfiled_gray,
                            Strings.venue_location,
                            "",
                            adress1Controller,
                            TextInputType.emailAddress,
                            adress1Focus,
                            address2Focus,
                            false,
                            false,
                            "email",
                            0),

                        SizedBox(
                          height:
                          CommonWidget.getInstance().heightFactor(context) *
                              0.02,
                        ),


                        CommonWidget.getInstance().normalText(
                            CommonColors.black, Strings.addres_line2,0,CommonWidget.getInstance().widthFactor(context)*0.04,FontStyle.normal,1,FontWeight.w600),

                        SizedBox(
                          height: CommonWidget.getInstance().heightFactor(context) * 0.02,
                        ),

                        CommonWidget.getInstance().editTextField(
                            "name",
                            context,
                            false,
                            CommonColors.textfiled_gray,
                            Strings.venue_location,
                            "",
                            address2Controller,
                            TextInputType.emailAddress,
                            address2Focus,
                            null,
                            false,
                            false,
                            "email",
                            0),

                        SizedBox(
                          height:
                          CommonWidget.getInstance().heightFactor(context) *
                              0.02,
                        ),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CommonWidget.getInstance().normalText(
                                CommonColors.black, Strings.city,0,CommonWidget.getInstance().widthFactor(context)*0.04,FontStyle.normal,1,FontWeight.w600),

                            CommonWidget.getInstance().normalText(
                                CommonColors.black, Strings.state,0,CommonWidget.getInstance().widthFactor(context)*0.04,FontStyle.normal,1,FontWeight.w600),

                          ],
                        ),

                        SizedBox(
                          height:
                          CommonWidget.getInstance().heightFactor(context) *
                              0.02,
                        ),

                        Row(
                          children: [
                            SizedBox(
                              height: CommonWidget.getInstance().heightFactor(context) * 0.02,
                            ),
                            Expanded(
                              child: Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5.0),
                                    border: Border.all(color:CommonColors.darkGray)
                                ),
                                height: CommonWidget.getInstance().heightFactor(context) * 0.07,
                                child: Center(
                                  child: Padding(
                                    padding: EdgeInsets.all(CommonWidget.getInstance().widthFactor(context) * 0.02),
                                    child:
                                        CommonWidget.getInstance().normalText(
                                            CommonColors.darkGray, Strings.city,0,CommonWidget.getInstance().widthFactor(context)*0.04,FontStyle.normal,1,FontWeight.w600),
                                  ),
                                ),
                              ),
                            ),

                            SizedBox(
                              width: CommonWidget.getInstance().widthFactor(context) * 0.05,
                            ),
                            Expanded(
                              child: Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5.0),
                                    border: Border.all(color:CommonColors.darkGray)
                                ),
                                height: CommonWidget.getInstance().heightFactor(context) * 0.07,
                                child: Center(
                                  child: Padding(
                                    padding:  EdgeInsets.all(CommonWidget.getInstance().widthFactor(context) * 0.02),
                                    child: CommonWidget.getInstance().normalText(
                                            CommonColors.darkGray, Strings.state,0,CommonWidget.getInstance().widthFactor(context)*0.04,FontStyle.normal,1,FontWeight.w600),

                                  ),
                                ),
                              ),
                            ),

                          ],
                        ),

                        SizedBox(
                          height:
                          CommonWidget.getInstance().heightFactor(context) *
                              0.02,
                        ),

                        CommonWidget.getInstance().normalText(
                            CommonColors.black, Strings.start,0,CommonWidget.getInstance().widthFactor(context)*0.04,FontStyle.normal,1,FontWeight.w600),

                        SizedBox(
                          height: CommonWidget.getInstance().heightFactor(context) * 0.02,
                        ),
                        Obx(()=> GestureDetector(
                          onTap: (){
                            CommonWidget.getInstance().datePickerDialog(context, this, "StartDate");
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5.0),
                                border: Border.all(color:CommonColors.darkGray)
                            ),
                            height: CommonWidget.getInstance().heightFactor(context) * 0.07,
                            child: Padding(
                              padding:  EdgeInsets.only(left:CommonWidget.getInstance().widthFactor(context) * 0.02,right:CommonWidget.getInstance().widthFactor(context) * 0.02),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  CommonWidget.getInstance().normalText(
                                      CommonColors.black, controller.startDate.value,0,CommonWidget.getInstance().widthFactor(context)*0.03,FontStyle.normal,1,FontWeight.w200),

                                  Icon(Icons.calendar_today_outlined,color: CommonColors.primaryColor2,)
                                ],
                              ),
                            ),
                          ),
                        )),

                        SizedBox(
                          height: CommonWidget.getInstance().heightFactor(context) * 0.02,
                        ),
                        CommonWidget.getInstance().normalText(
                            CommonColors.black, Strings.end,0,CommonWidget.getInstance().widthFactor(context)*0.04,FontStyle.normal,1,FontWeight.w600),

                        SizedBox(
                          height: CommonWidget.getInstance().heightFactor(context) * 0.02,
                        ),
                        Obx(()=>GestureDetector(
                          onTap: (){
                            CommonWidget.getInstance().datePickerDialog(context, this, "EndDate");
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5.0),
                                border: Border.all(color:CommonColors.darkGray)
                            ),
                            height: CommonWidget.getInstance().heightFactor(context) * 0.07,
                            child: Padding(
                              padding:  EdgeInsets.only(left:CommonWidget.getInstance().widthFactor(context) * 0.02,right:CommonWidget.getInstance().widthFactor(context) * 0.02),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  CommonWidget.getInstance().normalText(
                                      CommonColors.black, controller.endDate.value,0,CommonWidget.getInstance().widthFactor(context)*0.03,FontStyle.normal,1,FontWeight.w200),

                                  Icon(Icons.calendar_today_outlined,color: CommonColors.primaryColor2,)
                                ],
                              ),
                            ),
                          ),
                        )),

                        SizedBox(
                          height: CommonWidget.getInstance().heightFactor(context) * 0.02,
                        ),

                        CommonWidget.getInstance().normalText(
                            CommonColors.black, Strings.select_season,0,CommonWidget.getInstance().widthFactor(context)*0.04,FontStyle.normal,1,FontWeight.w600),

                        SizedBox(
                          height: CommonWidget.getInstance().heightFactor(context) * 0.02,
                        ),

                        Obx(()=>SizedBox(
                            height:
                            CommonWidget.getInstance().heightFactor(context) *
                                0.09,
                            child: controller.seasonList.isNotEmpty?
                            DropDownClass(
                                CommonColors.darkGray,
                                "seasonDropDown",
                                controller.seasonList.value[0]["name"],
                                controller.seasonList.value,
                                this,
                                "0",
                                false,
                                true)
                            :Container()
                            )),

                        CommonWidget.getInstance().normalText(
                            CommonColors.black, Strings.select_match_type,0,CommonWidget.getInstance().widthFactor(context)*0.04,FontStyle.normal,1,FontWeight.w600),

                        SizedBox(
                          height: CommonWidget.getInstance().heightFactor(context) * 0.02,
                        ),

                        Obx(()=>SizedBox(
                            height:
                            CommonWidget.getInstance().heightFactor(context) *
                                0.09,
                            child:controller.matchList.isNotEmpty?
                            DropDownClass(
                                CommonColors.darkGray,
                                "matchDropDown",
                                controller.matchList.value[0]["match_title"],
                                controller.matchList.value,
                                this,
                                "0",
                                false,
                                true)
                        :Container()
                        )),


                        CommonWidget.getInstance().normalText(
                            CommonColors.black, Strings.league_description,0,CommonWidget.getInstance().widthFactor(context)*0.04,FontStyle.normal,1,FontWeight.w600),

                        SizedBox(
                          height: CommonWidget.getInstance().heightFactor(context) * 0.02,
                        ),

                        CommonWidget.getInstance().editTextField(
                            "empty",
                            context,
                            false,
                            CommonColors.textfiled_gray,
                            Strings.write_league_des_here,
                            "This  field is mandatory",
                            descriptionController,
                            TextInputType.emailAddress,
                            descriptionFocus,
                            null,
                            false,
                            false,
                            "email",
                            0),

                        SizedBox(
                          height: CommonWidget.getInstance().widthFactor(context) * 0.03,
                        ),

                        Obx(()=>Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: CheckboxListTile(
                                contentPadding: EdgeInsets.zero,
                                  title: const Text(Strings.official),
                                  value: controller.isOfficial.value,
                                  onChanged: (newValue) {
                                    controller.isOffical(newValue!);
                                  },
                                  controlAffinity: ListTileControlAffinity.leading,
                                  activeColor: CommonColors.primaryColor1,

                              ),
                            ),
                            Expanded(
                              child: CheckboxListTile(
                                contentPadding: EdgeInsets.zero,
                                title: const Text(Strings.unOfficial),
                                value: controller.unOfficial.value,
                                onChanged: (newValue) {
                                  controller.unOffical(newValue!);
                                },
                                controlAffinity: ListTileControlAffinity.leading,
                                activeColor: CommonColors.primaryColor1,
                              ),
                            ),
                          ],
                        )),

                        SizedBox(
                          height: CommonWidget.getInstance().widthFactor(context) * 0.08,
                        ),

                        Padding(
                          padding: const EdgeInsets.only(left:6.0),
                          child: CommonWidget.getInstance().flexibleButton(
                            context,
                            Strings.create_league,
                            double.infinity,
                            CommonWidget.getInstance().widthFactor(context) * 0.13,
                            CommonColors.primaryColor1,
                            CommonColors.primaryColor1,
                            CommonColors.white,
                            this,
                          ),
                        ),

                        SizedBox(
                          height: CommonWidget.getInstance().widthFactor(context) * 0.05,
                        ),

            ]),
          ),
        ),
      ]),
    )));
  }

 var pickedImage;

 Future<bool> createLeague(BuildContext context) async {
   final LeagueController controller = Get.find();
   var token=await Global.getStringValuesSF(Constant.AccessToken);

   Global.showLoaderDialog(context);
   Map<String, String> headers = {
     "Accept": "application/json",
     "Authorization": 'Bearer '+token,
   };

   var request = http.MultipartRequest(
       'POST', Uri.parse(Constant.baseUrl + Constant.create_league));
   request.headers.addAll(headers);
   if (pickedImage != null) {
     request.files.add(await http.MultipartFile.fromPath(
         "league_logo", pickedImage!.path));
   }

   request.fields['league_title'] = titleController.text;
   request.fields['address_line1'] = adress1Controller.text;
   request.fields['address_line2'] = address2Controller.text;
   request.fields['city'] = "Mohali";
   request.fields['state'] = "Punjab";
   request.fields['starts_from'] = controller.startDate.value;
   request.fields['end_date'] =controller.endDate.value ;
   request.fields['season'] =seasonId;
   request.fields['match_type'] =matchTypeId ;
   request.fields['description'] = descriptionController.text;
   request.fields['official'] = controller.isOfficial.value==true?"1":"0";
   request.fields['description'] = descriptionController.text;

   await request.send().then((res) async {
     final respStr = await res.stream.bytesToString();
     var response = json.decode(respStr);

     if (res.statusCode == 201 || res.statusCode == 200) {
       Get.back();
       Global.showSnackBar(context, response["message"]);
       Global.addStringToSF( response["user"]["first_name"], Constant.firstname);
       Global.addStringToSF( response["user"]["last_name"], Constant.lastname);

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
       Get.toNamed('/login');

     }
   }).catchError((error) {
     Get.back();
     error.message = jsonDecode(error.toString())["message"];
     throw ("some arbitrary error");
   });

   return false;
 }


 @override
  Future<void> widgetCallBack(String title, String value, BuildContext context) async {
   final LeagueController controller = Get.find();

   switch(title){
     case Strings.create_league:
        if(CommonWidget.getInstance().isValidate(formKey)){
          if(controller.startDate=="")
            Global.showSnackBar(context, "Please enter in Start Date field");
          else
          if(controller.endDate=="")
            Global.showSnackBar(context, "Please enter in End Date field");
          else{
            FocusScopeNode currentFocus = FocusScope.of(context);
            if (!currentFocus.hasPrimaryFocus) {
              currentFocus.unfocus();
            }
            createLeague(context);
          }
        }

        break;

     case "matchDropDown":
       var map = json.decode(value);
        matchTypeId = map["id"].toString();
       break;

     case "seasonDropDown":
       var map = json.decode(value);
        seasonId = map["id"].toString();
       break;

      case "createLeagueApi":
        Get.back();
        Global.showSnackBar(context, jsonDecode(value)["message"]);
        break;

      case "StartDate":
        controller.startDate(value);
        break;

     case "Camera":
       pickedImage = (await ImagePicker().pickImage(source: ImageSource.camera)) ;
        controller.updateImage(pickedImage!.path);

      break;

   case "Gallery":
   pickedImage = (await ImagePicker().pickImage(source: ImageSource.gallery)) ;
   controller.updateImage(pickedImage!.path);
   break;


   case "EndDate":
        controller.endDate(value);
        break;
    }

  }

  var seasonId="",matchTypeId="";
}
