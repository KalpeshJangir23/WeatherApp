import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';

class GlobalController extends GetxController {
  // create Various Variable for current location and etc
  final RxBool _isloading = true.obs;
  final RxDouble _lattitude = 0.0.obs;
  final RxDouble _longitude = 0.0.obs;

  // create instance for Variable
  RxBool checkLoading() => _isloading;
  RxDouble getLongitude() => _longitude;
  RxDouble getLatitude() => _lattitude;

  @override
  void onInit() {
    
    if (_isloading.isTrue) {
      getLocation();
    }
    super.onInit();
  }

  getLocation() async {
    bool isServiceEnabled;
    LocationPermission locationPermission;
    isServiceEnabled = await Geolocator.isLocationServiceEnabled();
    // return if service is not enabled
    if (!isServiceEnabled) {
      return Future.error("Location service is not enabled");
    }

    //Status of permissions that the device has access to the location service
    locationPermission = await Geolocator.checkPermission();
    // check if location access is granted
    if (locationPermission == LocationPermission.denied) {
      return Future.error("Location access is denied");
    } else if (locationPermission == LocationPermission.denied) {
      // request to grant location access
      locationPermission = await Geolocator.requestPermission();
      if (locationPermission == LocationPermission.denied) {
        return Future.error("Location access is denied");
      }
    }

    // getting the location information of the user

    return Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high)
        .then((value) {
      // update the lattitude and longitude of the location
      _lattitude.value = value.latitude;
      _longitude.value = value.longitude;
      _isloading.value = false;
    });
  }
}
