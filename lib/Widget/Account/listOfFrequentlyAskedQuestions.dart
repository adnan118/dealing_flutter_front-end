import 'package:expansion_tile_card/expansion_tile_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Controller/Account/account_Controller.dart';
import '../../MORE/Core/Constant/color.dart';

class ListOfFrequentlyAskedQuestions extends StatelessWidget {
  ListOfFrequentlyAskedQuestions({Key? key}) : super(key: key);
  final Account_Controller controller = Get.put(Account_Controller());

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemCount: 1,
        itemBuilder: (context, index) {
          return ExpansionTileCard(
              expandedTextColor: ColorApp.middleRed,
              turnsCurve: Curves.fastOutSlowIn,
              expandedColor: ColorApp.pureWhite.withOpacity(0.8),leading:  Icon(Icons.question_answer,color: ColorApp.paw,size: 30),
              title: Text(
                  "FrequentlyAskedQuestions".tr,
                  style: Theme
                      .of(context)
                      .textTheme
                      .displayLarge!
                      .copyWith(fontSize: 15,color: ColorApp.caddiesSilk)),
              children: [
                ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: controller.listFrequentlyAskedQuestions.length,
                  itemBuilder: (context, docIndex) {
                    return ExpansionTile(
                      collapsedTextColor: ColorApp.pureWhite,
                      backgroundColor: ColorApp.pureWhite,
                      iconColor: ColorApp.mildBlue,
                      title: Text("${controller
                          .listFrequentlyAskedQuestions[docIndex]["question"]}"
                          .tr,
                          style: Theme
                              .of(context)
                              .textTheme
                              .displayMedium!
                              .copyWith(fontSize: 13)),
                      children:
                      [
                      ListTile(
                      title: Text(
                      controller.listFrequentlyAskedQuestions[docIndex]["answer"]!,
                      style: Theme.of(context)
                          .textTheme
                          .displaySmall!
                    )
                  )



                      ],
                    );
                  },
                )
              ]
          );
        }
    );
  }
}