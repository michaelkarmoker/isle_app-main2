
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
//
// class DropDownController extends GetxController {
//
//   // It is mandatory initialize with one value from listType
//   final selected = "some book type".obs;
//
//   void setSelected(String value){
//     selected.value = value!;
//   }
//
// }

import 'package:get/get.dart';

class DropdownController extends GetxController {
  late String selectedValue;

  var language = <String>['English', 'Espanol'];

  void onSelected(String value) {
    selectedValue = value;
  }
}