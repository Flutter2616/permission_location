import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:permission_location/location_project/controller/location_controller.dart';
import 'package:geocoding/geocoding.dart';

class Locationscreen extends StatefulWidget {
  const Locationscreen({super.key});

  @override
  State<Locationscreen> createState() => _LocationscreenState();
}

class _LocationscreenState extends State<Locationscreen> {
  LocationPermission? permission;

  // Position? position;
  Locationcontroller controller = Get.put(Locationcontroller());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
              actions: [
                Padding(
                  padding: const EdgeInsets.only(right: 10.0),
                  child: InkWell(
                      onTap: () async {
                        permission = await Geolocator.checkPermission();
                        if (permission == LocationPermission.denied) {
                          permission = await Geolocator.requestPermission();
                        }
                        Position position = await Geolocator.getCurrentPosition(
                            desiredAccuracy: LocationAccuracy.high);

                        controller.lat.value = position.latitude;
                        controller.log.value = position.longitude;
                        List<Placemark> placemark =
                            await placemarkFromCoordinates(
                                controller.lat.value, controller.log.value);

                        controller.placemarklist.value = placemark;
                        controller.place.value = placemark[0];
                      },
                      child:
                          Icon(Icons.my_location, color: Colors.white, size: 25)),
                ),
              ],
              title: Text(
                "Find a live Location",
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 18,
                    color: Colors.white),
              ),
              backgroundColor: Colors.blueGrey),
          body: Obx(
            () => GoogleMap(mapType: MapType.normal,
              initialCameraPosition: CameraPosition(
                  target: LatLng(controller.lat.value, controller.log.value),
                  zoom: 10,
                  tilt: 0,
                  bearing: 0),markers: controller.point(),
            ),
          )),
    );
  }
}
