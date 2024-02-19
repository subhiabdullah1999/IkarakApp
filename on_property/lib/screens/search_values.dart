import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:on_property/control/search_values_controller.dart';
import 'package:on_property/core/class/status_request.dart';
import 'package:on_property/core/constans/appColors.dart';
import 'package:on_property/core/constans/applinks.dart';
import 'package:on_property/screens/house_details.dart';
import 'package:on_property/widgets/loading.dart';

class SearchValues extends StatelessWidget {
  const SearchValues({super.key});

  @override
  Widget build(BuildContext context) {
    SearchValueControllerImp controller = Get.put(SearchValueControllerImp());

    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
          centerTitle: true,
          backgroundColor: AppColors.whiteColor,
          title: Text(
            "research results".tr,
            style: TextStyle(
                color: AppColors.blackColor3,
                fontSize: 14,
                fontWeight: FontWeight.w500,
                fontStyle: FontStyle.italic),
          ),
          leading: IconButton(
              onPressed: () {
                controller.GotoBack();
              },
              icon: Icon(
                Icons.arrow_back,
                color: AppColors.blackColor3,
                size: 30,
              ))),
      body: GetBuilder<SearchValueControllerImp>(
        builder: (controller) =>
            controller.statusRequest == StatusRequest.loading
                ? Center(child: Loading())
                : Container(
                    padding: const EdgeInsets.all(15),
                    child: controller.databody.isEmpty
                        ? Center(
                            child: Text(
                            "There are no results for your search".tr,
                            style: TextStyle(
                                color: AppColors.redcolor,
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                fontStyle: FontStyle.italic),
                          ))
                        : ListView.builder(
                            itemCount: controller.dataSearch.length,
                            itemBuilder: (context, index) {
                              return InkWell(
                                onTap: () {
                                  controller.ProdId = controller
                                      .dataSearch[index].propertyDetails!.id!
                                      .toInt();
                                  Get.to(() => HouseDetails(),
                                      arguments: {"ProdId": controller.ProdId});
                                  print(
                                      "trey733333333333333333333333333333333333344444455");
                                  print(controller.ProdId);
                                  print(
                                      "trey733333333333333333333333333333333333344444455");
                                },
                                child: Card(
                                  child: ListTile(
                                    title: Text(controller
                                        .dataSearch[index].title
                                        .toString()),
                                    subtitle: Text(controller
                                        .dataSearch[index].price
                                        .toString()),
                                    // leading: Text(
                                    //     controller.dataSearch[index].city.toString()),
                                    trailing: controller
                                                .dataSearch[index].thumbnail ==
                                            null
                                        ? CircleAvatar(
                                            backgroundColor: AppColors.gry,
                                          )
                                        : CircleAvatar(
                                            radius: 25,
                                            backgroundImage: NetworkImage(
                                                AppLinks.serverNameImgeThumbnail +
                                                    controller.dataSearch[index]
                                                        .thumbnail
                                                        .toString())),
                                  ),
                                ),
                              );
                            })),
      ),
    ));
  }
}
