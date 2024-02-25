import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import 'package:get/get.dart';
import 'package:on_property/control/leagl_douc_controllere.dart';
import 'package:on_property/core/constans/appColors.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class LeagleDoucments extends StatefulWidget {
  const LeagleDoucments({super.key});

  @override
  State<LeagleDoucments> createState() => _LeagleDoucmentsState();
}

class _LeagleDoucmentsState extends State<LeagleDoucments>
    with SingleTickerProviderStateMixin {
  late final TabController tabController;
  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    Get.put(LeagleDocumentsCointrollerImp());
    return SafeArea(
        child: GetBuilder<LeagleDocumentsCointrollerImp>(
            builder: (controller) => Scaffold(
                backgroundColor: AppColors.whiteColor,
                appBar: AppBar(
                    centerTitle: true,
                    backgroundColor: AppColors.whiteColor,
                    title: Text(
                      'Legal documents'.tr,
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
                body: Container(
                  color: AppColors.whiteColor,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 15),
                        child: TabBar(
                          controller: tabController,
                          tabs: controller.tabs,
                          labelColor: AppColors.blackColor3,
                          indicatorColor: AppColors.green,
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 4),
                          child:
                              TabBarView(controller: tabController, children: [
                            PdfOne(),
                            PdfTow(),
                          ]),
                        ),
                      ),
                    ],
                  ),
                )
                //  ListView(
                //   children: [
                //     Container(
                //       padding: EdgeInsets.only(
                //           left: 8, right: 8, bottom: 2, top: 10),
                //       child: InkWell(
                //         onTap: () {},
                //         child: Card(
                //           child: Padding(
                //             padding: const EdgeInsets.all(20),
                //             child: Text(
                //               "Company registration certificate with Finance"
                //                   .tr,
                //               style: Theme.of(context).textTheme.bodyLarge,
                //             ),
                //           ),
                //         ),
                //       ),
                //     ),
                //     Container(
                //       padding: EdgeInsets.only(
                //           left: 8, right: 8, bottom: 10, top: 2),
                //       child: InkWell(
                //         onTap: () {},
                //         child: Card(
                //           child: Padding(
                //             padding: const EdgeInsets.all(20),
                //             child: Text(
                //               "Blackgold Lawyer Business Card".tr,
                //               style: Theme.of(context).textTheme.bodyLarge,
                //             ),
                //           ),
                //         ),
                //       ),
                //     ),
                //     SfPdfViewer.asset("assets/pdf/pp.pdf")
                //   ],
                // ),
                )));
  }
}

class PdfOne extends StatelessWidget {
  const PdfOne({super.key});

  @override
  Widget build(BuildContext context) {
    return SfPdfViewer.asset("assets/pdf/pp.pdf");
  }
}

class PdfTow extends StatelessWidget {
  const PdfTow({super.key});

  @override
  Widget build(BuildContext context) {
    return SfPdfViewer.asset(
      "assets/pdf/Blackgold.pdf",
      pageSpacing: 10,
    );
  }
}
