import 'package:get/get.dart';

abstract class LocationHousDetailescontroller extends GetxController {
  typeIkar();
}

class LocationHousDetailescontrollerImp extends LocationHousDetailescontroller {
  String typeSearch = "type";
  String label = "Buy";
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

  forBuy() {
    label = "Buy";
    update();
  }

  forRant() {
    label = "Rant";
    update();
  }

  forInv() {
    label = "Inv";
    update();
  }
}
