
import 'dart:convert';
import 'package:axe/interface/CallBackInterface.dart';
import 'package:axe/util/CommonColors.dart';
import 'package:flutter/material.dart';


class DropDownClass extends StatefulWidget {
  String? dropDownValue;
  List? spinnerList;
  CallBackInterface? callInterface;
  String? name;
  Map? map;
  double? elevation;
  String? onChangeNullOrNot;

  DropDownClass(String name, String dropDownValue, List spinnerList,
      CallBackInterface? callInterface, String onChangeNullOrNot,
      {double? elevation}) {
    this.dropDownValue = dropDownValue;
    this.spinnerList = spinnerList;
    this.callInterface = callInterface;
    this.name = name;
    this.elevation = elevation;
    this.onChangeNullOrNot = onChangeNullOrNot;
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
                    border: Border.all(color: CommonColors.darkGray)
                ),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<Map>(
                    isExpanded: true,
                    hint: Padding(
                            padding: const EdgeInsets.only(left: 10.0),
                            child: Text(widget.dropDownValue!,
                              style:
                                  TextStyle(color: CommonColors.black, fontSize: 14),
                            ),
                          ),
                       items: widget.spinnerList!.map((value1) {
                            return new DropdownMenuItem<Map>(
                              child: widget.name == "brandNameDates"?Padding(
                                padding: const EdgeInsets.only(left: 10.0),
                                child: new Text(value1["created_at"]),
                              ):Padding(
                                padding: const EdgeInsets.only(left: 10.0),
                                child: new Text(value1["name"]),
                              ),
                              value:value1,
                            );
                          }).toList(),

                    onChanged:widget.onChangeNullOrNot=="1"?null: (Map? newVal) {
                      setState(() {
                        widget.map=newVal;
                        widget.dropDownValue =  widget.name! == "brandNameDates"?newVal!["created_at"].toString():newVal!["name"].toString();
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



