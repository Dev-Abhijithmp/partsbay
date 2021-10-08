import 'package:geolocator/geolocator.dart';

void enablegps() async {
  LocationPermission check = await Geolocator.checkPermission();
  if (check == LocationPermission.denied ||
      check == LocationPermission.deniedForever) {
    Geolocator.requestPermission();
    Future<bool> ch = Geolocator.isLocationServiceEnabled();

    // ignore: unrelated_type_equality_checks
    if (ch == false) {
      Geolocator.openLocationSettings();
    }
  }
}
