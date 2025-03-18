import 'package:expansion_tile_card/expansion_tile_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Controller/Traking/traking_Controller.dart';
import '../../MORE/Classes/handlingStatusRemotDataView.dart';
import '../../MORE/Core/Constant/color.dart';
import '../../MORE/Core/Localization/translateDB.dart';
import '../../MORE/Data/Model/trackingModel.dart';
import '../Home/showRating.dart';

class ListOfTrackingType extends StatefulWidget {
  const ListOfTrackingType({Key? key}) : super(key: key);

  @override
  State<ListOfTrackingType> createState() => _ListOfTrackingTypeState();
}

class _ListOfTrackingTypeState extends State<ListOfTrackingType>
    with SingleTickerProviderStateMixin {
  final Traking_Controller controller = Get.put(Traking_Controller());
  late AnimationController _animationController;
  late Animation<Offset> _animation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );

    _animation = Tween<Offset>(
      begin: const Offset(1.0, 0.0), // ابدأ من الجانب الأيمن
      end: Offset.zero, // الوصول إلى الموضع الأصلي
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeOutCirc,
    ));

    // بدء الانيميشن عند تحميل الويدجت
    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<Traking_Controller>(
        builder: (controller) => HandlingStatusRemotDataRequest(
            statusRequest: controller.statusRequest,
            widget: SlideTransition(
              position: _animation,
              child: ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: controller.typeTracking.length,
                itemBuilder: (context, index) {
                  // تحديد الوثائق أو جوازات السفر بناءً على `index`
                  List<TrackingModel> typeToShow;
                  if (index == 0) {
                    // إذا كان الخيار هو الوثائق
                    typeToShow = controller.listOfDocsTracking;
                  } else {
                    // إذا كان الخيار هو جوازات السفر
                    typeToShow = controller.listOfPassportTracking;
                  }

                  return ExpansionTileCard(
                    expandedTextColor: ColorApp.middleRed,
                    turnsCurve: Curves.fastOutSlowIn,
                    animateTrailing: true,
                    initiallyExpanded: true,
                    duration: const Duration(milliseconds: 500),
                    expandedColor: ColorApp.pureWhite.withOpacity(0.8),
                    title: Text(
                      controller.typeTracking[index],
                      style: Theme.of(context)
                          .textTheme
                          .displayLarge!
                          .copyWith(fontSize: 15),
                    ),
                    children: [
                      typeToShow.length == 0
                          ? SizedBox()
                          : ListView.builder(
                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),
                              itemCount: typeToShow.length,
                              itemBuilder: (context, docIndex) {
                                final doc = typeToShow[docIndex];
                                return ExpansionTile(
                                    collapsedTextColor: ColorApp.pureWhite,
                                    backgroundColor: ColorApp.pureWhite,
                                    iconColor: ColorApp.mildBlue,
                                    title: Text(
                                      doc.trackingDocPassType == "Passports"
                                          ? translateDB(
                                              doc.trackingNameOwnerAr
                                                  .toString(),
                                              doc.trackingNameOwnerEn
                                                  .toString(),
                                            )
                                          : controller
                                                  .convertCoastTypeDocs(
                                                      doc.trackingTypeDocsID)
                                                  .toString() +
                                              " : " +
                                              translateDB(
                                                doc.trackingNameOwnerAr
                                                    .toString(),
                                                doc.trackingNameOwnerEn
                                                    .toString(),
                                              ),
                                      style: Theme.of(context)
                                          .textTheme
                                          .displayMedium!
                                          .copyWith(color: ColorApp.middleRed),
                                    ),
                                    children: [
                                      ListTile(
                                        title: Text(
                                          translateDB(
                                            "${doc.trackingDescAr}  ",
                                            "${doc.trackingDescEn}  ",
                                          ),
                                          style: Theme.of(context)
                                              .textTheme
                                              .displayMedium!
                                              .copyWith(
                                                  color: ColorApp.caddiesSilk.withOpacity(0.5),
                                                  fontSize: 13,height: 2.5,),
                                        ),
                                      ),

                                      doc.trackingUseridUpdate == 1 ?SizedBox():
                                Opacity(
                                opacity:
                                doc.trackingUseridUpdate == 1 ||
                                doc.trackingIsRating == 1
                                ? 0.3
                                    : 1.0,
                                child:
                                ListTile(
                                        onTap: doc.trackingUseridUpdate == 1 ||
                                                doc.trackingIsRating == 1
                                            ? null
                                            : () {
                                                showRating(
                                                    context,
                                                    doc.trackingUseridUpdate,
                                                    doc.trackingId);
                                              },
                                        leading:Image.asset(
                                            "assets/images/More/iconstars.png",
                                            fit: BoxFit.cover,
                                            height: 70,
                                            width: 70,

                                        ),
                                        trailing: Text(
                                          "Rating".tr,
                                          style: TextStyle(
                                              color: ColorApp.intergalactic),
                                        ),
                                      ),
                                )
                                    ]);
                              },
                            ),
                    ],
                  );
                },
              ),
            )));
  }
}
