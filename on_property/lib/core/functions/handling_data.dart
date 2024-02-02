import 'package:on_property/core/class/status_request.dart';

handlingData(response) {
  if (response == StatusRequest) {
    return response;
  } else {
    return StatusRequest.success;
  }
}
