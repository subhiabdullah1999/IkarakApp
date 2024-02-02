import 'package:on_property/core/class/crud.dart';
import 'package:on_property/core/constans/applinks.dart';

class TestData {
  Crud crud;
  TestData(this.crud);
  getData() async {
    var res = await crud.gettData(AppLinks.rentProp, {}, {});
    return res;
  }
}
