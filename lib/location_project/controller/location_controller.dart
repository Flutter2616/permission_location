import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Locationcontroller extends GetxController {
  RxDouble lat = 20.5937.obs;
  RxDouble log = 78.9629.obs;

  RxList<Placemark> placemarklist = <Placemark>[].obs;
  Rx<Placemark> place = Placemark().obs;

 RxSet<Marker> point() {
    return {
      Marker(
        markerId: MarkerId("1"),
        position: LatLng(lat.value, log.value),
        infoWindow: InfoWindow(title: "My location"),
        rotation: 0,
      ),
    }.obs;
  }
}

// map key=AIzaSyCzD1r7kIllRpgu5XanT9xdoJa9UPreoN4
