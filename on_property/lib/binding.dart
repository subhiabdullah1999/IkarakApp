import 'package:get/get.dart';
import 'package:on_property/core/class/crud.dart';

class Binding extends Bindings {
  @override
  void dependencies() {
    Get.put(Crud());
  }
}
