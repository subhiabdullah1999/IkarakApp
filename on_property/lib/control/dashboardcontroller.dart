import 'package:get/get.dart';
import 'package:on_property/core/constans/appthem.dart';
import 'package:on_property/core/services/services.dart';

abstract class DashBoardController extends GetxController {}

class DashBoardControllerImp extends DashBoardController {
  MyServices myServices = Get.find();
}
