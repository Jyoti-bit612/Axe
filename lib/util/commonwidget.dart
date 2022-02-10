import 'package:axe/controller/pasword_counter.dart';
import 'package:axe/interface/CallBackInterface.dart';
import 'package:axe/util/commoncolors.dart';
import 'package:axe/util/global.dart';
import 'package:axe/util/strings.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';


class CommonWidget {
  static CommonWidget? commonWidget;

  static CommonWidget getInstance() {
    commonWidget ??= CommonWidget();
    return commonWidget!;
  }

  datePickerDialog(BuildContext context, CallBackInterface callBackInterface,
      String title) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime(1980), // Refer step 1
      firstDate: DateTime(1960),
      lastDate:  DateTime(DateTime.now().year).subtract(Duration(days: 1)),
    );
    DateFormat formatter = DateFormat('yyyy-MM-dd HH:mm:ss');
    if (picked != null)
      callBackInterface.widgetCallBack(title, formatter.format(picked), context);
    else
      callBackInterface.widgetCallBack(title, "Any", context);
  }

  heightFactor(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }

  widthFactor(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }

  bool isValidate(GlobalKey<FormState> formKey) {
    final FormState? form = formKey.currentState;
    if (form!.validate()) {
      return true;
    } else {
      return false;
    }
  }


  showAlertDialog(BuildContext context,CallBackInterface callBackInterface,String text, String button1Text,String button2Text,String type,String title) {
    // set up the buttons
    Widget cancelButton = TextButton(
      child: Text(button2Text),
      onPressed:  () {
        callBackInterface.widgetCallBack(type, "", context);
        Get.back();

      },
    );
    Widget continueButton = TextButton(
      child: Text(button1Text),
      onPressed:  () {
        Get.back();
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text(title),
      content: Text(text),
      actions: [
        cancelButton,
        continueButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  appBarDesign(BuildContext context, String text, { visivlity,  visivlityLeading=true, type, var scaffoldKey}) {
    return AppBar(
          centerTitle: true,
          title: Text(
            text,
            style: TextStyle(
                color: CommonColors.black,
                fontSize:CommonWidget.getInstance().widthFactor(context) * 0.05,
                fontWeight: FontWeight.bold),
          ),
          elevation: 0,
          backgroundColor: CommonColors.white,
          leading: Visibility(
            visible: visivlityLeading,
            child: IconButton(
                icon: Icon(
                  Icons.arrow_back_ios_outlined,
                  color: CommonColors.black,
                ),
                onPressed: () {
                  Get.back();
                }),
          ),

   /*   actions: [
            Visibility(
              visible: visivlity == null ? true : visivlity,
              child: IconButton(
                  icon: Image.asset(
                    "assets/images/bell.png",
                    width: 20,
                    height: 20,
                  ),
                  onPressed: () {}),
            )
          ],*/
        );

  }

  Widget normalText(Color color, String text, int typeForTextAlign, double mFontSize, FontStyle fontStyle,double mLetterSpacing, FontWeight weight,{fontfamily}) {
    return Text(
      text,
      textAlign: typeForTextAlign == 1
          ? TextAlign.center
          : typeForTextAlign == 5
              ? TextAlign.right
              : TextAlign.start,
      style: TextStyle(
        letterSpacing: mLetterSpacing,
          fontFamily: fontfamily==null?'nunito_regular.ttf':null,
          fontWeight: weight,
          fontStyle: fontStyle,
          fontSize: mFontSize, color: color),
    );
  }

  Widget normalTextUnderline(Color color, String text, int typeForTextAlign, double mFontSize, FontStyle fontStyle,double mLetterSpacing, FontWeight weight,{fontfamily}) {
    return Text(
      text,
      textAlign: typeForTextAlign == 1
          ? TextAlign.center
          : typeForTextAlign == 5
          ? TextAlign.right
          : TextAlign.start,
      style: TextStyle(
        decoration: TextDecoration.underline,
          letterSpacing: mLetterSpacing,
          fontFamily: fontfamily==null?'nunito_regular.ttf':null,
          fontWeight: weight,
          fontStyle: fontStyle,
          fontSize: mFontSize, color: color),
    );
  }


  fieldFocusChange(
      BuildContext context, FocusNode currentFocus, FocusNode nextFocus) {
    currentFocus.unfocus();
    FocusScope.of(context).requestFocus(nextFocus);
  }

  final CounterController controller = Get.find();


  Widget editTextField(
      String validationKey,
      BuildContext context,
      bool suffixIcon,
      Color textColor,
      String hint,
      String message,
      TextEditingController _ctrl,
      TextInputType _keyboardType,
      FocusNode _focus,
      _nextFocus,
      bool _hideText,
      bool _readOnly,
      String prefixIcon,
      int showPrefixIconOrNot,
      {capital}
      )

  {
    return TextFormField(
      enabled: !_readOnly,
      validator: (value) => Global.validation(validationKey, message, value),
      textInputAction: TextInputAction.next,
      keyboardType: _keyboardType,
      controller: _ctrl,
      textCapitalization: capital=="capital"?TextCapitalization.sentences:TextCapitalization.none,
      obscureText: _hideText,
      readOnly: _readOnly,
      focusNode: _focus,
      style: TextStyle(
        fontFamily: 'nunito_regular.ttf',
      ),
      cursorColor: CommonColors.black,
      onFieldSubmitted: (term) {
        CommonWidget.getInstance()
            .fieldFocusChange(context, _focus, _nextFocus);
      },
      decoration: InputDecoration(
        hintText: hint,
        suffixIcon: suffixIcon? IconButton(
          icon: Icon(
            _hideText ? Icons.visibility_off : Icons.visibility,
          ),
          onPressed: (){
            hint==Strings.enter_old_pass?
            controller.updateValue():
            hint==Strings.enter_new_pass?
            controller.updateValueNew():
            hint==Strings.reenter_new_pass?
            controller.updateValueConfirm():
            controller.updateValue();
          },
        ):null,
        //labelText: hint,
        hintStyle: TextStyle(
          color: textColor,
          fontFamily: 'nunito_regular.ttf',
        ),
        filled: true,
        enabledBorder: OutlineInputBorder(
            borderSide:
                BorderSide(color: CommonColors.darkGray, width: 0.9),
            borderRadius: BorderRadius.circular(5.0)),
        fillColor: CommonColors.white,
        contentPadding: EdgeInsets.fromLTRB(10.0, 15.0, 2.0, 15.0),
      ),
    );
  }

  Widget flexibleButton(
      BuildContext context,
      String title,
      double _widthSize,
      double _heightSize,
      Color backgroundColor,
      Color borderColor,
      Color textColor,
      CallBackInterface callBackInterface,
      { circularBorder,
       textSize}) {

    return SizedBox(
      height: _heightSize,
      width: _widthSize,
      child: DecoratedBox(
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(6)),
            gradient: LinearGradient(colors: [CommonColors.primaryColor1 ,CommonColors.primaryColor2],
          begin: Alignment.topLeft,
          end: Alignment.bottomCenter,
        )),

        child: ElevatedButton(
            style:ElevatedButton.styleFrom(
                primary: Colors.transparent,
                onPrimary: Colors.transparent,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(6),
            side: BorderSide(color: borderColor)

            )),

            onPressed: () {
              callBackInterface.widgetCallBack(title, "", context);
            },

            child: Text(title,
                textAlign: TextAlign.center,
                style:  TextStyle(
                    color: textColor,
                    fontFamily: "nunito_regular.ttf",
                    fontSize: textSize ?? CommonWidget.getInstance().widthFactor(context) * 0.04,
                    fontWeight: FontWeight.bold))),
      ),
    );
  }

  Widget flexibleButtonWithIcon(
      BuildContext context,
      String title,
      double _widthSize,
      double _heightSize,
      Color backgroundColor,
      Color borderColor,
      Color textColor,
      CallBackInterface callBackInterface,
      String icon,
      Color iconColor) {
    return SizedBox(
        height: _heightSize,
        width: _widthSize,
        child: DecoratedBox(
          decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(6)),
              gradient: LinearGradient(colors: [CommonColors.primaryColor1 ,CommonColors.primaryColor2],
                begin: Alignment.topLeft,
                end: Alignment.bottomCenter,
              )),
          child: ElevatedButton(
              style:ElevatedButton.styleFrom(
                  primary: Colors.transparent,
                  onPrimary: Colors.transparent,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6),
                      side: BorderSide(color: borderColor)

                  )),
              onPressed: () {
                callBackInterface.widgetCallBack(title, "", context);
              },

              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(title,
                      textAlign: TextAlign.center,
                      style:  TextStyle(
                          color: textColor,
                          fontSize:
                              CommonWidget.getInstance().widthFactor(context) *
                                  0.04,
                          fontWeight: FontWeight.bold)),
                  SizedBox(
                    width: CommonWidget.getInstance().widthFactor(context) * 0.03,
                  ),
                   icon=="logout"?
                   const Icon(
                    Icons.login,
                    color: CommonColors.white,
                  )
                      :const Icon(
                    Icons.arrow_forward,
                    color: CommonColors.white,
                  )
                ],
              )),
        ));
  }

  Widget multicolorText(BuildContext context, String text1, String text2,
      String screenName, CallBackInterface callBackInterface) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () {
        switch (text2) {
          case Strings.sign_up:
            callBackInterface.widgetCallBack(text2, "", context);
            break;
        }
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: RichText(
          text: TextSpan(
            style: new TextStyle(
              fontSize: 12.0,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
            children: <TextSpan>[
              TextSpan(text: text1),
              TextSpan(
                  text: text2,
                  style: TextStyle(color: CommonColors.primaryColor1)),
            ],
          ),
        ),
      ),
    );
  }

  Widget underLineText(
    String title,
    double size,
  ) {
    return Text(
      title,
      style: TextStyle(
        shadows: [Shadow(color: Colors.grey, offset: Offset(0, -5))],
        color: Colors.transparent,
        fontSize: size,
        decoration: TextDecoration.underline,
        decorationColor: Colors.grey,
        decorationThickness: 2,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
