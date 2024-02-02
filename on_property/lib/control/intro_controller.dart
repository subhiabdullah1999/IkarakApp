import 'package:get/get.dart';
import 'package:on_property/core/services/services.dart';

abstract class IntroController extends GetxController {}

class IntroControllerImp extends IntroController {
  MyServices myServices = Get.find();
}
