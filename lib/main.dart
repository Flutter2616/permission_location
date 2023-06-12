import'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:permission_location/location_project/view/location_screen.dart';
import 'package:permission_location/runtime_permission/view/permission_screen.dart';

void main()
{
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        // '/':(p0) => Locationscreen(),
        '/':(p0) => Permissionscreen(),
      },
    ),
  );
}