import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:on_property/control/home_controller.dart';
import 'package:on_property/control/profile_controller.dart';
import 'package:on_property/core/constans/appColors.dart';
import 'package:on_property/core/constans/applinks.dart';
import 'package:on_property/screens/house_details.dart';
import 'package:on_property/utils/colorscheme.dart';
import 'package:on_property/utils/constants.dart';
import 'package:on_property/widgets/heart_container.dart';

List images = [
  'assets/images/house.jpg',
  'assets/images/carousal1.jpg',
  'assets/images/carousal2.jpg',
  'assets/images/carousal3.jpg',
  'assets/images/house.jpg',
  'assets/images/room1.jpg',
  'assets/images/apartement.jpg',
  'assets/images/carousal1.jpg',
  'assets/images/carousal2.jpg',
  'assets/images/carousal3.jpg',
  'assets/images/house.jpg',
  'assets/images/room1.jpg',
];
List<String> prices = [
  '\$567,900',
  '\$335,900',
  '\$289,700',
  '\$470,000',
  '\$224,670',
  '\$490,270',
  '\$300,600',
  '\$651,230',
  '\$980,000',
  '\$300,000',
];
List<String> addresses = [
  '16523 Choke Cherry Dr,Victorville,CA 8728',
  'Station,Hampton,GA 23423',
  '129 Hoper Ln,Folsom,CA 95300',
  '13598 Lagrone St,Powder Springs,GA 30127',
  '4625 Careyback Ave,Elk Grove,CA 7689',
  '4592 Eldywood Ln Batavia,OH 45103',
  '4028 Timber Creek Dr, Cincinnati,OH45623',
  '11456 57th St E Parrish,Fl 341219',
  '67 Marvin Park,Powder Springs,GA 30178',
  '24019 Doverwick Dr Tomball,Tx'
];
List<String> houseImg = [
  'assets/images/house.jpg',
  'assets/images/house1.jpg',
  'assets/images/house2.jpg',
  'assets/images/house3.jpg',
  'assets/images/house4.jpg',
  'assets/images/house5.jpg',
  'assets/images/house6.jpg',
  'assets/images/house7.jpg',
  'assets/images/house8.jpg',
  'assets/images/house9.jpg'
];

Container firstComponent(BuildContext context) {
  return Container(
    height: 50,
    margin: EdgeInsets.only(top: 10.0, left: 8.0, right: 8.0),
    decoration: BoxDecoration(
        border: Border.all(color: primaryColor),
        borderRadius: BorderRadius.circular(30.0)),
    child: Row(
      children: [
        Expanded(
          child: GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, 'SearchProperty');
            },
            child: Row(
              children: [
                SizedBox(
                  width: 10,
                ),
                Icon(
                  Icons.search,
                  color: primaryColor,
                ),
                Text(
                  'Find Rent,Sale & Buy Home',
                  style: TextStyle(color: Colors.grey),
                )
              ],
            ),
          ),
        ),
        SizedBox(
          width: 10,
        ),
        GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, 'Filters');
            },
            child: Padding(
              padding:
                  const EdgeInsets.only(right: 12.0, top: 12.0, bottom: 12.0),
              child: SvgPicture.asset(
                'assets/icons/filter.svg',
                height: 20,
                width: 20,
                color: primaryColor,
              ),
            )),
      ],
    ),
  );
}

Container listForSecondComponent() {
  return Container(
    height: 250,
    child: ListView.builder(
        padding: EdgeInsets.symmetric(vertical: 8.0),
        scrollDirection: Axis.horizontal,
        itemCount: addresses.length,
        itemBuilder: (context, index) {
          return index == 0
              ? SizedBox(
                  width: 10,
                )
              : Card(
                  margin: EdgeInsets.only(right: 8.0),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0))),
                  child: Container(
                    height: 230,
                    width: 155,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, 'HouseDetails');
                          },
                          child: Container(
                            height: 130,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    fit: BoxFit.fill,
                                    image: AssetImage(images[index])),
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(10.0),
                                  topRight: Radius.circular(10.0),
                                )),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'HOME FOR SALE',
                                style: kh4,
                              ),
                              SizedBox(
                                height: 2,
                              ),
                              Text(
                                addresses[index],
                                style:
                                    TextStyle(color: Colors.grey, fontSize: 10),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                              SizedBox(
                                height: 2,
                              ),
                              IntrinsicHeight(
                                child: Row(
                                  children: [
                                    Text(
                                      '3 ',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 11),
                                    ),
                                    Text(
                                      'bds ',
                                      style: TextStyle(fontSize: 11),
                                    ),
                                    VerticalDivider(
                                      width: 1,
                                      color: Colors.grey,
                                    ),
                                    Text(
                                      ' 5 ',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 11),
                                    ),
                                    Text(
                                      'baths ',
                                      style: TextStyle(fontSize: 11),
                                    ),
                                    VerticalDivider(
                                      width: 1,
                                      color: Colors.grey,
                                    ),
                                    Text(
                                      ' 1750 ',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 11),
                                    ),
                                    Text(
                                      'sqft',
                                      style: TextStyle(fontSize: 11),
                                    ),
                                  ],
                                ),
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        height: 7,
                                      ),
                                      Text(
                                        'Starting Price',
                                        style: TextStyle(
                                          fontSize: 11,
                                        ),
                                      ),
                                      Text(
                                        prices[index],
                                        style: TextStyle(
                                            color: primaryColor,
                                            fontWeight: FontWeight.w500,
                                            fontSize: 11),
                                      )
                                    ],
                                  ),
                                  Spacer(),
                                  HeartContainer(index)
                                ],
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                );
        }),
  );
}

Card secondComponent(int index, BuildContext context) {
  return Card(
    margin: EdgeInsets.only(right: 8.0),
    shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(10.0))),
    child: Container(
      height: 230,
      width: 155,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, 'HouseDetails');
            },
            child: Container(
              height: 130,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.fill, image: AssetImage(images[index])),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10.0),
                    topRight: Radius.circular(10.0),
                  )),
            ),
          ),
          Container(
            padding: EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'HOME FOR SALE',
                  style: kh4,
                ),
                SizedBox(
                  height: 2,
                ),
                Text(
                  addresses[index],
                  style: TextStyle(color: Colors.grey, fontSize: 10),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(
                  height: 2,
                ),
                IntrinsicHeight(
                  child: Row(
                    children: [
                      Text(
                        '3 ',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 11),
                      ),
                      Text(
                        'bds ',
                        style: TextStyle(fontSize: 11),
                      ),
                      VerticalDivider(
                        width: 1,
                        color: Colors.grey,
                      ),
                      Text(
                        ' 5 ',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 11),
                      ),
                      Text(
                        'baths ',
                        style: TextStyle(fontSize: 11),
                      ),
                      VerticalDivider(
                        width: 1,
                        color: Colors.grey,
                      ),
                      Text(
                        ' 1750 ',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 11),
                      ),
                      Text(
                        'sqft',
                        style: TextStyle(fontSize: 11),
                      ),
                    ],
                  ),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 7,
                        ),
                        Text(
                          'Starting Price',
                          style: TextStyle(
                            fontSize: 11,
                          ),
                        ),
                        Text(
                          prices[index],
                          style: TextStyle(
                              color: primaryColor,
                              fontWeight: FontWeight.w500,
                              fontSize: 11),
                        )
                      ],
                    ),
                    Spacer(),
                    Container(
                      margin: EdgeInsets.only(top: 10),
                      child: CircleAvatar(
                          maxRadius: 15,
                          backgroundColor: primaryColor,
                          child: Icon(
                            Icons.favorite,
                            color: Colors.white,
                            size: 22,
                          )),
                    )
                  ],
                )
              ],
            ),
          )
        ],
      ),
    ),
  );
}

Card thirdComponent(int index) {
  Get.put(ProfileControllerImp());
  return Card(
      margin: EdgeInsets.only(bottom: 10.0, left: 8.0, right: 8.0),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
      child: GetBuilder<ProfileControllerImp>(
        builder: (controller) => Container(
          height: 120,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(20.0)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                flex: 2,
                child: Container(
                  margin: EdgeInsets.only(
                      right: 18.0, top: 8.0, left: 8.0, bottom: 8.0),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      image: DecorationImage(
                          fit: BoxFit.fill,
                          image: AssetImage(houseImg[index]))),
                ),
              ),
              Expanded(
                  flex: 3,
                  child: Container(
                    padding: EdgeInsets.only(
                      top: 8.0,
                      right: 8.0,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          prices[index],
                          style: kh2,
                        ),
                        SizedBox(
                          height: 2,
                        ),
                        Text(
                          addresses[index],
                          style: TextStyle(color: Colors.grey, fontSize: 11),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        IntrinsicHeight(
                          child: Row(
                            children: [
                              Text(
                                '3 ',
                                style: TextStyle(fontWeight: FontWeight.w500),
                              ),
                              Text(
                                'bds ',
                              ),
                              VerticalDivider(
                                width: 1,
                                color: Colors.grey,
                              ),
                              Text(
                                ' 5 ',
                                style: TextStyle(fontWeight: FontWeight.w500),
                              ),
                              Text(
                                'baths ',
                              ),
                              VerticalDivider(
                                width: 1,
                                color: Colors.grey,
                              ),
                              Text(
                                ' 1,767 ',
                                style: TextStyle(fontWeight: FontWeight.w500),
                              ),
                              Text(
                                'sqft',
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 3,
                        ),
                        Spacer(),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 8.0),
                          child: Row(
                            children: [
                              CircleAvatar(
                                maxRadius: 5,
                                backgroundColor: Colors.green,
                              ),
                              Text(
                                ' House for Sale',
                                style: TextStyle(fontSize: 11),
                              ),
                              Spacer(),
                              GestureDetector(
                                onTap: () {
                                  controller.changeValueFavorit(index);
                                },
                                child: Container(
                                  child: controller.listFavor[index] == true
                                      ? Icon(
                                          Icons.favorite,
                                          color: primaryColor,
                                          size: 22,
                                        )
                                      : Icon(
                                          Icons.favorite_border,
                                          size: 22,
                                        ),
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  )),
            ],
          ),
        ),
      ));
}

ListView listForThirdComponent() {
  return ListView.builder(
      shrinkWrap: true,
      scrollDirection: Axis.vertical,
      itemCount: 10,
      physics: NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, 'HouseDetails');
            },
            child: thirdComponent(index));
      });
}

class ListForThirdComponent extends StatelessWidget {
  const ListForThirdComponent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Get.put(HomeControllerImp());
    return GetBuilder<HomeControllerImp>(
        builder: (controller) => ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            itemCount: controller.data.length,
            physics: NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return GestureDetector(
                  onTap: () {
                    controller.ProdId = controller.data[index].id!.toInt();
                    Get.to(() => HouseDetails(),
                        arguments: {"ProdId": controller.ProdId});
                  },
                  child: Card(
                    margin:
                        EdgeInsets.only(bottom: 10.0, left: 8.0, right: 8.0),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0)),
                    child: Container(
                      height: 120,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.0)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            width: 85,
                            margin: EdgeInsets.only(
                                right: 18.0, top: 8.0, left: 8.0, bottom: 8.0),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.0),
                                image: DecorationImage(
                                    fit: BoxFit.fill,
                                    image: NetworkImage(
                                        AppLinks.serverNameImgeThumbnail +
                                            controller.data[index].thumbnail
                                                .toString()))),
                          ),
                          Expanded(
                              flex: 3,
                              child: Container(
                                padding: EdgeInsets.only(
                                  top: 8.0,
                                  right: 8.0,
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      height: 5,
                                    ),

                                    Container(
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            controller.data[index].title
                                                .toString(),
                                            style: kh2.copyWith(
                                                fontSize: 14,
                                                color: AppColors.green,
                                                fontWeight: FontWeight.w500),
                                          ),
                                          Text(
                                            "\$ " +
                                                controller.data[index].price
                                                    .toString(),
                                            style: kh2,
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      height: 8,
                                    ),
                                    controller.data[index].country!.name != null
                                        ? Text(
                                            controller.data[index].country!.name
                                                    .toString() +
                                                " , ",
                                            //+ controller
                                            //     .data[index].city!.name
                                            //     .toString(),
                                            style: TextStyle(
                                                color: Colors.grey,
                                                fontSize: 11),
                                          )
                                        : Text(""),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    // IntrinsicHeight(
                                    //   child: Row(
                                    //     children: [
                                    //       Text(
                                    //         controller.data[index]
                                    //             .propertyDetails!.bed
                                    //             .toString(),
                                    //         style: TextStyle(
                                    //             fontWeight: FontWeight.bold),
                                    //       ),
                                    //       Text(
                                    //         ' beds'.tr,
                                    //       ),
                                    //       VerticalDivider(
                                    //         width: 10,
                                    //         color: Colors.grey,
                                    //       ),
                                    //       Text(
                                    //         controller.data[index]
                                    //             .propertyDetails!.bed
                                    //             .toString(),
                                    //         style: TextStyle(
                                    //             fontWeight: FontWeight.bold),
                                    //       ),
                                    //       Text(
                                    //         ' baths'.tr,
                                    //       ),
                                    //       VerticalDivider(
                                    //         width: 10,
                                    //         color: Colors.green,
                                    //       ),
                                    //       Text(
                                    //         controller.data[index]
                                    //             .propertyDetails!.floor
                                    //             .toString(),
                                    //         style: TextStyle(
                                    //             fontWeight: FontWeight.bold),
                                    //       ),
                                    //       // Text(
                                    //       //   'floor'.tr,
                                    //       // ),
                                    //     ],
                                    //   ),
                                    // ),
                                    // SizedBox(
                                    //   height: 3,
                                    // ),
                                    Spacer(),
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(bottom: 8.0),
                                      child: Row(
                                        children: [
                                          CircleAvatar(
                                            maxRadius: 5,
                                            backgroundColor: Colors.green,
                                          ),
                                          Text(
                                            " property for ".tr +
                                                controller.data[index].type
                                                    .toString(),
                                            style: TextStyle(fontSize: 11),
                                          ),
                                          Spacer(),
                                          GestureDetector(
                                            onTap: () {
                                              controller
                                                  .changeValueFavorit(index);
                                            },
                                            child: Container(
                                              child:
                                                  controller.listFavor[index] ==
                                                          true
                                                      ? Icon(
                                                          Icons.favorite,
                                                          color: primaryColor,
                                                          size: 22,
                                                        )
                                                      : Icon(
                                                          Icons.favorite_border,
                                                          size: 22,
                                                        ),
                                            ),
                                          )
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              )),
                        ],
                      ),
                    ),
                  ));
            }));
  }
}
