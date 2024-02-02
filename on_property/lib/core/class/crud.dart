import "dart:convert";

import "package:dartz/dartz.dart";
import "package:on_property/core/class/status_request.dart";
import "package:on_property/core/functions/checkinternet.dart";
import 'package:http/http.dart' as http;

class Crud {
  Future<Either<StatusRequest, Map>> postData(
      String linkurl, Map data, Map<String, String> head) async {
    try {
      if (await checkInterNet()) {
        var response =
            await http.post(Uri.parse(linkurl), body: data, headers: head);
        if (response.statusCode == 200 || response.statusCode == 201) {
          Map responsebody = jsonDecode(response.body);
          return Right(responsebody);
        } else {
          return const Left(StatusRequest.serverfaliure);
        }
      } else {
        return const Left(StatusRequest.offlinefaliure);
      }
    } catch (_) {
      print("****************erorr****************");
      print(_.toString());
      return const Left(StatusRequest.serverfaliure);
    }
  }

  Future<Either<StatusRequest, Map>> gettData(
      String linkurl, Map data, Map<String, String> head) async {
    try {
      if (await checkInterNet()) {
        print("yes inter________________");
        var response = await http.get(Uri.parse(linkurl), headers: head);
        if (response.statusCode == 200 || response.statusCode == 201) {
          print("yes 200::::::::::::::::::SSSSSSSSSSS");
          Map responsebody = jsonDecode(response.body);
          print(
              "DDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDdddddddddrerrrrrrrrrrrrrrrrr");

          return Right(responsebody);
        } else {
          print("DDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDddddddddd");
          print(response.statusCode);
          print("DDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDddddddddd");

          return const Left(StatusRequest.serverfaliure);
        }
      } else {
        return const Left(StatusRequest.offlinefaliure);
      }
    } catch (_) {
      print("****************erorr****************");
      print(_.toString());
      return const Left(StatusRequest.serverfaliure);
    }
  }

  // Future<Map> ggetData(String linkUrl, Map data) async {
  //   try {
  //     if (await checkInterNet()) {
  //       print("yes intPPPPPPPPPPPPPPPPPPPPPPP");
  //       var response = await http.get(Uri.parse(linkUrl,))
  //     } else {
  //       print("No int:::::::::::::::::::");
  //     }
  //   } catch (_e) {
  //     print("LKKKKKKKKKKKOLLLLLLLLLLLL");
  //     print(_e.toString());
  //   }
  //   return data;
  // }
}
