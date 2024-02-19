import 'package:get/get.dart';
import 'package:on_property/screens/payment.dart';
import 'package:on_property/screens/transfer_office.dart';

abstract class PackgesAdsController extends GetxController {}

class PackgesAdsControllerImp extends PackgesAdsController {
  int packageId = 0;
  int amount = 0;
  GotoBack() {
    Get.back();
  }

  GotoTransferOffice() {
    Get.to(() => TransferOffice(),
        arguments: {"packageId": packageId, "amount": amount});
  }
}
