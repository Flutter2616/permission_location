import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:permission_location/runtime_permission/controller/permission_controller.dart';

class Permissionscreen extends StatefulWidget {
  const Permissionscreen({super.key});

  @override
  State<Permissionscreen> createState() => _PermissionscreenState();
}

class _PermissionscreenState extends State<Permissionscreen> {
  Permissioncontroller controller = Get.put(Permissioncontroller());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(backgroundColor: Colors.black,
          title: Text(
            "All RunTime Permission",
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.w500, fontSize: 18),
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Column(
                children: controller.permissionname
                    .asMap()
                    .entries
                    .map((e) => Padding(
                          padding: const EdgeInsets.symmetric(vertical: 4.0),
                          child: ListTile(
                              onTap: () {
                                controller.permission_call(e.key);
                              },
                              title: Text(
                                  "${controller.permissionname[e.key].name}",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      color: Colors.black,
                                      fontSize: 18)),
                              leading: controller.permissionname[e.key].icon,
                              tileColor: Colors.grey.shade200),
                        ))
                    .toList()),
          ),
        ),
      ),
    );
  }
}
