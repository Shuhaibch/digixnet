import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';

class CLocationService {
  String coordinates = "No Location found";
  String address = 'No Address found';
  bool scanning = false;

  checkPermission() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();

    if (!serviceEnabled) {
      await Geolocator.openLocationSettings();
      return;
    }

    permission = await Geolocator.checkPermission();


    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();

      if (permission == LocationPermission.denied) {
        return;
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return;
    }

    return getLocation();
  }

  getLocation() async {
    try {
      Position position = await Geolocator.getCurrentPosition(
          // ignore: deprecated_member_use
          desiredAccuracy: LocationAccuracy.high);

      List<Placemark> result =
          await placemarkFromCoordinates(position.latitude, position.longitude);

      if (result.isNotEmpty) {
        address =
            '${result[0].name}, ${result[0].locality} ${result[0].administrativeArea}';
        // setState(() {
        //   locationCTRL.text = address;
        // });
        // log(address);
        return address;
      }
    } catch (e) {
      return null;
    }

    // setState(() {
    //   scanning = false;
    // });
  }
}
