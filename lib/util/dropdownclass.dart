import 'dart:convert';
import 'package:axe/interface/CallBackInterface.dart';
import 'package:axe/util/commoncolors.dart';
import 'package:flutter/material.dart';

class DropDownClass extends StatefulWidget {
  String? dropDownValue;
  List? spinnerList;
  CallBackInterface? callInterface;
  String? name;
  Map? map;
  bool? elevation;
  bool? isExpanded;
  String? onChangeNullOrNot;
  Color? color;

  DropDownClass(Color? color,String? name, String? dropDownValue, List? spinnerList, CallBackInterface? callInterface, String? onChangeNullOrNot, bool? elevation,bool? isExpanded) {
    this.dropDownValue = dropDownValue!;
    this.spinnerList = spinnerList!;
    this.callInterface = callInterface!;
    this.name = name!;
    this.elevation = elevation;
    this.isExpanded = isExpanded!;
    this.color = color!;
    this.onChangeNullOrNot = onChangeNullOrNot!;
  }

  @override
  DropDownClassState createState() => DropDownClassState();

}

class DropDownClassState extends State<DropDownClass> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: CommonColors.white,
          body: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5.0),
                    border: Border.all(color:widget.color!)
                ),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<Map>(
                    isExpanded: widget.isExpanded!,
                    hint: Padding(
                            padding: const EdgeInsets.only(left: 10.0),
                            child: Text(widget.dropDownValue!,
                              style:
                                  TextStyle(color: CommonColors.black, fontSize: 14),
                            ),
                          ),
                       items: widget.spinnerList!.map((value1) {
                            return  DropdownMenuItem<Map>(
                              child: Padding(
                                padding: const EdgeInsets.only(left: 10.0),
                                child:  Text(
                                    widget.name == "leagueDropDown"?
                                    value1["league_title"]:
                                    widget.name == "matchDropDown"?
                                    value1["match_title"]:
                                    value1["name"]
                                ),
                              ),
                              value:value1,
                            );
                          }).toList(),

                    onChanged:widget.onChangeNullOrNot=="1"?null: (Map? newVal) {
                      setState(() {
                        widget.map=newVal;
                        widget.dropDownValue =
                        widget.name! == "leagueDropDown"? newVal!["league_title"]:
                        widget.name! == "matchDropDown"? newVal!["match_title"]:
                        newVal!["name"];
                        widget.callInterface!.widgetCallBack(widget.name!, json.encode(newVal),context);
                      });
                    },
                    value: widget.map,
                  ),
                ),
              ),
          ),
    );
  }
}



