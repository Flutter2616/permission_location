import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:permission_location/runtime_permission/model/permission_model.dart';

class Permissioncontroller extends GetxController {
  List<Permissionmodel> permissionname = [
    Permissionmodel(
        name: "Camera",
        icon: Icon(Icons.camera_alt_outlined, color: Colors.black, size: 18)),
    Permissionmodel(
        name: "Microphone",
        icon: Icon(Icons.mic, color: Colors.black, size: 18)),
    Permissionmodel(
        name: "Storage",
        icon: Icon(Icons.storage, color: Colors.black, size: 18)),
    Permissionmodel(
        name: "Location",
        icon: Icon(Icons.location_on_outlined, color: Colors.black, size: 18)),
    Permissionmodel(
        name: "Calender",
        icon: Icon(Icons.calendar_month, color: Colors.black, size: 18)),
    Permissionmodel(
        name: "Contact",
        icon:
            Icon(Icons.contact_phone_outlined, color: Colors.black, size: 18)),
    Permissionmodel(
        name: "Phone", icon: Icon(Icons.phone, color: Colors.black, size: 18)),
    Permissionmodel(
        name: "Open Phone Setting",
        icon: Icon(Icons.settings_outlined, color: Colors.black, size: 18)),
    Permissionmodel(
        name: "All permission",
        icon: Icon(Icons.all_inbox, color: Colors.black, size: 18)),
  ];

  Future<void> permission_call(int i) async {
    if (permissionname[i].name == 'Camera') {
      var status = await Permission.camera.status;
      if (status.isDenied) {
        Permission.camera.request();
      } else {
        Get.snackbar("${permissionname[i].name}", "Permission already accepted",
            backgroundColor: Colors.green.shade600,
            duration: Duration(seconds: 2));
      }
    } else if (permissionname[i].name == 'Microphone') {
      var status = await Permission.microphone.status;
      if (status.isDenied) {
        Permission.microphone.request();
      } else {
        Get.snackbar("${permissionname[i].name}", "Permission already accepted",
            backgroundColor: Colors.green.shade600,
            duration: Duration(seconds: 2));
      }
    } else if (permissionname[i].name == 'Storage') {
      var status = await Permission.storage.status;
      if (status.isDenied) {
        Permission.storage.request();
      } else {
        Get.snackbar("${permissionname[i].name}", "Permission already accepted",
            backgroundColor: Colors.green.shade600,
            duration: Duration(seconds: 2));
      }
    } else if (permissionname[i].name == 'Location') {
      var status = await Permission.location.status;
      if (status.isDenied) {
        Permission.location.request();
      } else {
        Get.snackbar("${permissionname[i].name}", "Permission already accepted",
            backgroundColor: Colors.green.shade600,
            duration: Duration(seconds: 2));
      }
    } else if (permissionname[i].name == 'Calender') {
      var status = await Permission.calendar.status;
      if (status.isDenied) {
        Permission.calendar.request();
      } else {
        Get.snackbar("${permissionname[i].name}", "Permission already accepted",
            backgroundColor: Colors.green.shade600,
            duration: Duration(seconds: 2));
      }
    } else if (permissionname[i].name == 'Contact') {
      var status = await Permission.contacts.status;
      if (status.isDenied) {
        Permission.contacts.request();
      } else {
        Get.snackbar("${permissionname[i].name}", "Permission already accepted",
            backgroundColor: Colors.green.shade600,
            duration: Duration(seconds: 2));
      }
    } else if (permissionname[i].name == 'Phone') {
      var status = await Permission.phone.status;
      if (status.isDenied) {
        Permission.phone.request();
      } else {
        Get.snackbar("${permissionname[i].name}", "Permission already accepted",
            backgroundColor: Colors.green.shade600,
            duration: Duration(seconds: 2));
      }
    } else if (permissionname[i].name == 'Open Phone Setting') {
      openAppSettings();
    } else if (permissionname[i].name == 'All permission') {
      [
        Permission.camera,
        Permission.phone,
        Permission.contacts,
        Permission.calendar,
        Permission.location,
        Permission.storage,
        Permission.microphone
      ].request();
    }
  }
}
