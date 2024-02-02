import 'package:get/get.dart';
import 'package:on_property/data/dataSource/remote/test_data.dart';

abstract class TestDataController extends GetxController {}

class TestDataControllerImp extends TestDataController {
  TestData testData = TestData(Get.find());
}
