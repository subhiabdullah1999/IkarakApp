import 'package:get/get.dart';
import 'package:on_property/screens/payment.dart';
import 'package:on_property/screens/transfer_office.dart';

abstract class TransferOfficeController extends GetxController {}

class TransferOfficeControllerImp extends TransferOfficeController {
  int transferOfficeId = 0;
  String methodPayment = "";
  late int packageId;
  late int amount;

  GotoBack() {
    Get.back();
  }

  GotoPayment() {
    Get.to(() => Payment(), arguments: {
      "transferOfficeId": transferOfficeId,
      "packageId": packageId,
      "amount": amount,
      "methodPayment": methodPayment
    });
  }

  @override
  void onInit() {
    packageId = Get.arguments["packageId"];
    amount = Get.arguments["amount"];
    print("ffffffffffg66778899992222222");
    print(packageId);
    print(amount);
    print(methodPayment);

    print("ffffffffffg66778899992222222");

    super.onInit();
  }
}
