import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:expansion_tile_card/expansion_tile_card.dart';
import '../../Controller/Home/LegalConsultationController/LegalConsultation_Controller.dart';
import '../../MORE/Classes/handlingStatusRemotDataView.dart';
import '../../MORE/Core/Constant/color.dart';
import '../../Widget/LegalConsultation/customTextFormLegalConsultation.dart';
import '../../Widget/RequestDocs/customButtomRD.dart';
import '../../Widget/RequestDocs/titleUnderInfo.dart';

class LegalConsultation extends StatefulWidget {
  const LegalConsultation({Key? key}) : super(key: key);

  @override
  State<LegalConsultation> createState() => _LegalConsultationState();
}

class _LegalConsultationState extends State<LegalConsultation> {
  final LegalConsultation_Controller controller = Get.put(LegalConsultation_Controller());


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Legalconsultation".tr),
        backgroundColor: ColorApp.paw,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(bottomRight: Radius.circular(50)),
        ),
      ),
      body:

      GetBuilder<LegalConsultation_Controller>(
        builder: (controller) => HandlingStatusRemotDataView(
      statusRequest: controller.statusRequest,
      widget:Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: controller.myKeyconsultation, // Setting the Form key
          child: ListView(
            physics:BouncingScrollPhysics(),
            children: [
              Text("titlePageConsultion".tr,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              SizedBox(height: 20),
              TitleUnderInfo(
                label: "Pleaseenterconsultationdetails".tr,
                icon: Icons.balance,
              ),

              SizedBox(height: 30),



              CustomTextFormLegalConsultation(
                myController:controller.detailsControllerTitle ,
                valid:(value) {
                  if (value == null || value.isEmpty) {
                    return "consultationdetailsValid".tr;
                  }
                  return null;
                },
                hint: "Pleaseenterconsultationdetails".tr,
                title:"Enterdetailshere".tr ,
                maxLines: 5,
              ),







              customButtomRD(
                onPressed: (){
                  controller.  sendConsultations();
                },
                text: "Consultnow".tr,
              ),
              SizedBox(height: 50),
              TitleUnderInfo(
                label: "previousconsultations".tr,
                icon: Icons.history,
              ),

              controller.listOfPreviousConsultations.isEmpty
                  ? Text(
                "noLegalconsultation".tr,
                style: Theme.of(context).textTheme.displayMedium,
              )
                  :listofAnswers()
            ],
          ),
        ),
      ),
        )
      )


    );
  }
  listofAnswers(){
    return ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: controller.listOfPreviousConsultations.length,
      itemBuilder: (context, index) {
        return ExpansionTileCard(
          expandedTextColor: ColorApp.middleRed,

          turnsCurve: Curves.fastOutSlowIn,
          expandedColor: ColorApp.pureWhite.withOpacity(0.8),
          title: Text(
              controller.listOfPreviousConsultations[index].consultationTitle!,
              style: Theme.of(context)
                  .textTheme
                  .displayLarge!
                  .copyWith(fontSize: 15)),
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                      "answerconsultation".tr,
                      style: Theme.of(context)
                          .textTheme
                          .displayMedium!
                          .copyWith(color: ColorApp.intergalactic)),
                  Text(
                      "${controller.listOfPreviousConsultations[index].consultationBody==''?'Waiting'.tr:controller.listOfPreviousConsultations[index].consultationBody!}",
                      style: Theme.of(context)
                          .textTheme
                          .displayMedium!
                          .copyWith(color: ColorApp.caddiesSilk)),
                  controller.listOfPreviousConsultations[index].consultationBody=='' ? SizedBox() :
                  Row(
                    children: [   Text(
                        "Answeredby".tr,
                        style: Theme.of(context)
                            .textTheme
                            .displaySmall!
                            .copyWith(color: ColorApp.paw)),
                      Text(
                          " ${controller.convertlwyerLawyerCode(controller.listOfPreviousConsultations[index].consultationLawyer!)}",
                          style: Theme.of(context)
                              .textTheme
                              .displaySmall!
                              .copyWith(color: ColorApp.paw)),],
                  )

                ],
              ),
            ),
          ],
        );
      },
    );
  }
}