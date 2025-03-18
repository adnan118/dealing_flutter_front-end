import 'package:Dealings/MORE/Classes/handlingStatusRemotDataView.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:get/get.dart';
import '../../Controller/Home/RequestDocumentController/requestaDocument_Controller.dart';
import '../../MORE/Core/Constant/color.dart';
import '../../MORE/Core/Function/validinput.dart';
import '../../MORE/Core/Localization/translateDB.dart';
import '../../Widget/Home/buildDropdownItem.dart';
import '../../Widget/Home/buildTextField.dart';
import '../../Widget/RequestDocs/btnAttach.dart';
import '../../Widget/RequestDocs/customButtomRD.dart';
import '../../Widget/RequestDocs/dropDown.dart';
import '../../Widget/RequestDocs/selecteBirthDate.dart';
import '../../Widget/RequestDocs/titleUnderInfo.dart';

class RequestDocument extends StatelessWidget {
  final RequestaDocument_Controller controller1 =
      Get.put(RequestaDocument_Controller());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Requestadocument".tr),
        backgroundColor: ColorApp.paw,
        shape: RoundedRectangleBorder(
            borderRadius:
                controller1.myservices.sharedPref.getString("myLang") == "ar"
                    ? BorderRadius.only(bottomRight: Radius.circular(50))
                    : BorderRadius.only(bottomLeft: Radius.circular(50))),
      ),
      body: Form(
        key: controller1.myKeyReqDocs,
        child: GetBuilder<RequestaDocument_Controller>(
          builder: (controller) => HandlingStatusRemotDataRequest(
            statusRequest: controller.statusRequest,
            widget: SingleChildScrollView(
              physics:BouncingScrollPhysics(),
              padding: EdgeInsets.all(16.0),
              child: Column(
                children: [
                  TitleUnderInfo(label: "infoOwner".tr, icon: Icons.person_pin),
                  buildTextField(
                    title: "ArabicName",
                    Hint: "ArabicNameHint",
                    controller: controller.arabicName,
                    keyboardType: TextInputType.text,
                    valid: (val) => validinput(val!, 2, 30, "username1"),
                  ),
                  buildTextField(
                    title: "EnglishName",
                    Hint: "EnglishNameHint",
                    controller: controller.englishName,
                    keyboardType: TextInputType.text,
                    valid: (val) => validinput(val!, 2, 30, "username1"),
                  ),
                  buildTextField(
                    title: "nationalNumber",
                    Hint: "nationalNumber",
                    controller: controller.nationalNumber,
                    keyboardType: TextInputType.number,
                    valid: (val) => validinput(val!, 11, 11, "nationalNumber"),
                  ),
                  DropDownReq(
                    label: "cityBirth".tr,
                    selectedValue: controller.selectedCity,
                    items: controller.listOfCities.map((city) {
                      return DropdownMenuItem<String>(
                        value: city.cityId.toString(),
                        child: buildDropdownItem(
                            text:
                                translateDB(city.cityNameAr, city.cityNameEn)),
                      );
                    }).toList(),
                    onChanged: (String? newValue) {
                      controller.selectedCity.value = newValue!;
                      controller.update();
                    },
                    validation: "selectCityPlease".tr,
                  ),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          "birthdate".tr,
                          style: Theme.of(context)
                              .textTheme
                              .displayLarge!
                              .copyWith(fontSize: 12),
                        ),
                        SelectBirthDate(birthday: controller.birthDate),
                      ]),
                  TitleUnderInfo(
                      label: "infoDocs".tr, icon: Icons.document_scanner),
                  DropDownReq(
                    label: "docstype".tr,
                    selectedValue: controller.selectedDocumentType,
                    items: controller.listOfDocumentTypes.map((docType) {
                      return DropdownMenuItem<String>(
                        value: docType.typeDocsIdId.toString(),
                        child: buildDropdownItem(
                            text: translateDB(
                          docType.typeDocsIdNameAr,
                          docType.typeDocsIdNameEn,
                        )),
                      );
                    }).toList(),
                    onChanged: (String? newValue) {
                      controller.selectedDocumentType.value = newValue!;
                      controller.selectedDocumentTypeCoast =
                          controller.convertCoastTypeDocs(newValue);
                      controller.update();
                      controller.getTotal();
                    },
                    validation: "selectDocsPlease".tr,
                  ),
                  SizedBox(height: 20),
                  DropDownReq(
                    label: "LegalAdvisor".tr,
                    selectedValue: controller.selectedLawyer,
                    items: controller.listOfLawyers.map((lawyer) {
                      return DropdownMenuItem<String>(
                        value: lawyer.lawyrId.toString(),
                        child: buildDropdownItem(
                          text: translateDB(
                            lawyer.lawyrNameAr! +
                                " / " +
                                controller
                                    .convertlwyerCityCode(lawyer.lawyrCity),
                            lawyer.lawyrNameEn! +
                                " / " +
                                controller
                                    .convertlwyerCityCode(lawyer.lawyrCity),
                          ),
                        ),
                      );
                    }).toList(),
                    onChanged: (String? newValue) {
                      controller.selectedLawyer.value = newValue!;
                      controller.update();
                    },
                    validation: "Pleaseselectlawyer".tr,
                  ),
                  SizedBox(height: 20),
                  TitleUnderInfo(
                      label: "moreinfo".tr, icon: Icons.pinch_rounded),
                  DropDownReq(
                    label: "countryDestination".tr,
                    selectedValue: controller.selectedCountry,
                    items: controller.listOfCountry.map((country) {
                      return DropdownMenuItem<String>(
                        value: country.toString(),
                        child: buildDropdownItem(text: country.toString()),
                      );
                    }).toList(),
                    onChanged: (String? newValue) {
                      controller.selectedCountry.value = newValue!;
                      controller.update();
                    },
                    validation: "selectcountryPlease".tr,
                  ),
                  SizedBox(height: 20),
                  Obx(() {
                    return Row(
                      children: [
                        Checkbox(
                          activeColor: ColorApp.mildBlue,
                          value: controller.needsTranslation.value,
                          onChanged: (bool? value) {
                            controller.needsTranslation.value = value ?? false;
                          },
                        ),
                        Text("translationDocs".tr),
                      ],
                    );
                  }),
                  Obx(() {
                    if (controller.needsTranslation.value) {
                      return DropDownReq(
                        label: "Selectlanguage".tr,
                        selectedValue: controller.selectedTranslationLanguage,
                        items: controller.listOfTranslationLanguages.map((lan) {
                          return DropdownMenuItem<String>(
                            value: lan.transLangId.toString(),
                            child: buildDropdownItem(
                                text: translateDB(
                                    lan.transLangNameAr, lan.transLangNameEn)),
                          );
                        }).toList(),
                        onChanged: (String? newValue) {
                          controller.selectedTranslationLanguage.value =
                              newValue!;
                          controller.needsTranslationCoast = controller
                              .convertCoastTranslationLanguages(newValue);
                          controller.update();
                          controller.getTotal();
                        },
                        validation: "SelectlanguagePlease".tr,
                      );
                    }
                    return SizedBox.shrink();
                  }),
                  SizedBox(height: 20),
                  BtnAttach(
                    colorbg: ColorApp.pureWhite.withOpacity(0.8),
                    colorlable: ColorApp.caddiesSilk,
                    padding: 25,
                    margin: EdgeInsets.symmetric(horizontal: 40),
                    textbefor: "Attachidentity".tr,
                    textafter: "AttachidentityDone".tr,
                    iconsbefore: Icons.image_outlined,
                    iconsafter: Icons.done,
                    condition: controller.xfile == null,
                    onPressed: () {
                      controller.chooesImg();
                    },
                  ),
                  SizedBox(height: 20),
                  customButtomRD(
                    onPressed: () => controller.sendRequestDocs(),
                    text: "apply".tr,
                  ),
                  SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ),
      ),
      floatingActionButton: Container(
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: ColorApp.caddiesSilk),
        child: GetBuilder<RequestaDocument_Controller>(
          builder: (controller) => Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text("Coast".tr,
                  style: Theme.of(context)
                      .textTheme
                      .displayLarge!
                      .copyWith(fontSize: 15, color: ColorApp.paw)),
              Text(" : ${controller.totalCoast} \$",
                  style: Theme.of(context)
                      .textTheme
                      .displayLarge!
                      .copyWith(fontSize: 15, color: ColorApp.paw))
            ],
          ),
        ),
      ),
      floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
    );
  }
}
