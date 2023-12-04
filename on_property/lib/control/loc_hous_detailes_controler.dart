import 'package:get/get.dart';

abstract class LocationHousDetailescontroller extends GetxController {
  typeIkar();
}

class LocationHousDetailescontrollerImp extends LocationHousDetailescontroller {
  String typeSearch = "type";
  @override
  typeIkar() {
    typeSearch = "type";
    update();
  }

  mobileNumber() {
    typeSearch = "mobile";
    update();
  }

  gR() {
    typeSearch = "QR";
    update();
  }
}
