import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:get/get.dart';
import '../../Controller/Home/RequestaPassportController/requestaPassport_Controller.dart';
import '../../MORE/Classes/handlingStatusRemotDataView.dart';
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
import '../../Widget/RequestPassport/buildFlexibleSpace.dart';

class RequestaPassport extends StatelessWidget {
  RequestaPassport({Key? key}) : super(key: key);
  RequestaPassport_Controller controller1 =
      Get.put(RequestaPassport_Controller());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Requestapassport".tr),
        backgroundColor: ColorApp.paw,
        shape: RoundedRectangleBorder(
            borderRadius:
                controller1.myservices.sharedPref.getString("myLang") == "ar"
                    ? BorderRadius.only(bottomRight: Radius.circular(50))
                    : BorderRadius.only(bottomLeft: Radius.circular(50))),
      ),
      body: Form(
        key: controller1.myKeyReqPassport,
        child: GetBuilder<RequestaPassport_Controller>(
          builder: (controller) => HandlingStatusRemotDataRequest(
            statusRequest: controller.statusRequest,
            widget: SingleChildScrollView(
              physics:BouncingScrollPhysics(),
              padding: EdgeInsets.all(16.0),
              child: Column(
                children: [
                  TitleUnderInfo(
                      label: "infoagentpassport".tr,
                      icon: Icons.interpreter_mode),
                  DropDownReq(
                    label: "Relation".tr,
                    selectedValue: controller.selectedRelation,
                    items: controller.listOfRelation.map((relation) {
                      return DropdownMenuItem<String>(
                        value: relation.relationId.toString(),
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          height: 35,
                          child: Text(
                            translateDB(
                              relation.relationNameAr,
                              relation.relationNameEn,
                            ),
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              overflow: TextOverflow.fade,
                              color: ColorApp.caddiesSilk,
                              fontSize: 14,
                            ),
                          ),
                          decoration: BoxDecoration(
                            color: ColorApp.paw,
                            borderRadius:
                                BorderRadius.circular(10), // الحدود المنحنية
                          ),
                        ),
                      );
                    }).toList(),
                    onChanged: (String? newValueRelation) {
                      controller.selectedRelation.value = newValueRelation!;
                      print(newValueRelation);
                      print(controller.selectedRelation.value);
                    },
                    validation: "selectRelation".tr,
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  TitleUnderInfo(
                      label: "infoOwnerpassport".tr, icon: Icons.person_pin),
                  Row(
                    children: [
                      Flexible(
                        child: buildTextField(
                          title: "yArabicName",
                          Hint: "yArabicName",
                          controller: controller.arabicName,
                          keyboardType: TextInputType.text,
                          valid: (val) => validinput(val!, 2, 30, "username1"),
                        ),
                      ),
                      Flexible(
                        child: buildTextField(
                          title: "yEnglishName",
                          Hint: "yEnglishName",
                          controller: controller.englishName,
                          keyboardType: TextInputType.text,
                          valid: (val) => validinput(val!, 2, 30, "username1"),
                        ),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Flexible(
                        child: buildTextField(
                          title: "SurnameArabic",
                          Hint: "SurnameArabic",
                          controller: controller.surnameArabic,
                          keyboardType: TextInputType.text,
                          valid: (val) =>
                              validinput(val!, 2, 30, "SurnameArabic"),
                        ),
                      ),
                      Flexible(
                        child: buildTextField(
                          title: "SurnameEnglish",
                          Hint: "SurnameEnglish",
                          controller: controller.surnameEnglish,
                          keyboardType: TextInputType.text,
                          valid: (val) =>
                              validinput(val!, 2, 30, "SurnameEnglish"),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Flexible(
                        child: buildTextField(
                          title: "FatherNameArabic",
                          Hint: "FatherNameArabic",
                          controller: controller.fatherNameArabic,
                          keyboardType: TextInputType.text,
                          valid: (val) => validinput(val!, 2, 30, "fatherName"),
                        ),
                      ),
                      Flexible(
                        child: buildTextField(
                          title: "FatherNameEnglish",
                          Hint: "FatherNameEnglish",
                          controller: controller.fatherNameEnglish,
                          keyboardType: TextInputType.text,
                          valid: (val) => validinput(val!, 2, 30, "fatherName"),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Flexible(
                        child: buildTextField(
                          title: "MotherNameArabic",
                          Hint: "MotherNameArabic",
                          controller: controller.motherNameArabic,
                          keyboardType: TextInputType.text,
                          valid: (val) => validinput(val!, 2, 30, "motherName"),
                        ),
                      ),
                      Flexible(
                        child: buildTextField(
                          title: "MotherNameEnglish",
                          Hint: "MotherNameEnglish",
                          controller: controller.motherNameEnglish,
                          keyboardType: TextInputType.text,
                          valid: (val) => validinput(val!, 2, 30, "motherName"),
                        ),
                      ),
                    ],
                  ),
                  buildTextField(
                    title: "nationalNumber",
                    Hint: "nationalNumber",
                    controller: controller.nationalNumber,
                    keyboardType: TextInputType.number,
                    valid: (val) => validinput(val!, 11, 11, "nationalNumber"),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  DropDownReq(
                    label: "Nationality".tr,
                    selectedValue: controller.selectedNationality,
                    items: controller.listOfNationality.map((nationality) {
                      return DropdownMenuItem<String>(
                        value: nationality.nationalityId.toString(),
                        child: buildDropdownItem(
                            text: translateDB(
                          nationality.nationalityNameAr,
                          nationality.nationalityNameEn,
                        )),
                      );
                    }).toList(),
                    onChanged: (String? newValue) {
                      controller.selectedNationality.value = newValue!;
                      controller.update();
                    },
                    validation: "SelectNationalityPlease".tr,
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Neumorphic(
                      style: NeumorphicStyle(
                          boxShape: NeumorphicBoxShape.roundRect(
                              BorderRadius.circular(15)),
                          color: ColorApp.warmGray.withOpacity(0.2),
                          depth: 1),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              "Gender".tr,
                              style: Theme.of(context)
                                  .textTheme
                                  .displayLarge!
                                  .copyWith(fontSize: 17),
                            ),
                            _selectGender("titlemale".tr, "male"),
                            _selectGender("titlefemale".tr, "female"),
                          ])),
                  SizedBox(
                    height: 40,
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
                  SizedBox(
                    height: 40,
                  ),
                  Row(
                    children: [
                      Flexible(
                        child: buildTextField(
                          title: "PlaceofBirthArabic",
                          Hint: "PlaceofBirthArabic",
                          controller: controller.birthPlaceArabic,
                          keyboardType: TextInputType.text,
                          valid: (val) =>
                              validinput(val!, 2, 30, "placeOfBirth"),
                        ),
                      ),
                      Flexible(
                        child: buildTextField(
                          title: "PlaceofBirthEnglish",
                          Hint: "PlaceofBirthEnglish",
                          controller: controller.birthPlaceEnglish,
                          keyboardType: TextInputType.text,
                          valid: (val) =>
                              validinput(val!, 2, 30, "placeOfBirth"),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Flexible(
                        child: DropDownReq(
                          label: "TypePassport".tr,
                          selectedValue: controller.selectedTypePassport,
                          items: controller.listOfTypePassport.map((typePass) {
                            return DropdownMenuItem<String>(
                              value: typePass.typePassportId.toString(),
                              child: buildDropdownItem(
                                  text: translateDB(
                                typePass.typePassportNameAr,
                                typePass.typePassportNameEn,
                              )),
                            );
                          }).toList(),
                          onChanged: (String? newValue) {
                            controller.selectedTypePassport.value = newValue!;
                            controller.selectedTypePassportCoast =
                                controller.convertCoastTypePassports(newValue);
                            controller.update();
                            controller.getTotal();
                          },
                          validation: "TypePassport".tr,
                        ),
                      ),
                      Flexible(
                        child: DropDownReq(
                          label: "PlacePassportRicive".tr,
                          selectedValue: controller.selectedPlacePassportRicive,
                          items:
                              controller.listOfPlacePassportRicive.map((Place) {
                            return DropdownMenuItem<String>(
                              value: Place.placeRcvId.toString(),
                              child: buildDropdownItem(
                                  text: translateDB(
                                Place.placeRcvNameAr,
                                Place.placeRcvNameEn,
                              )),
                            );
                          }).toList(),
                          onChanged: (String? newValue) {
                            controller.selectedPlacePassportRicive.value =
                                newValue!;
                            controller.selectedPlacePassportRiciveCoast =
                                controller
                                    .convertCoastPlacePassportRicive(newValue);
                            print(newValue);
                            controller.update();
                            controller.getTotal();
                          },
                          validation: "PlacePassportRicive".tr,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 40,
                  ),
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
                  SizedBox(height: 40),
                  Obx(() {
                    return Row(
                      children: [
                        Checkbox(
                          activeColor: ColorApp.mildBlue,
                          value: controller.oldpassport.value,
                          onChanged: (bool? value) {
                            controller.oldpassport.value = value ?? false;
                          },
                        ),
                        Text("Ihaveanoldpassport".tr),
                      ],
                    );
                  }),
                  Obx(() {
                    return (controller.oldpassport.value)
                        ? BuildFlexibleSpace(
                            controllerOldpassportDate:
                                controller.OldpassportDate,
                            controllerOldpassportExpiryDate:
                                controller.OldpassportExpiryDate,
                            controllerOldpassportnumber:
                                controller.Oldpassportnumber,
                          )
                        : SizedBox();
                  }),
                  SizedBox(height: 20),
                  BtnAttach(
                    colorbg: ColorApp.pureWhite.withOpacity(0.8),
                    colorlable: ColorApp.caddiesSilk,
                    padding: 30,
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
                    onPressed: () => controller.sendRequestPassport(),
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
        child: GetBuilder<RequestaPassport_Controller>(
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

  Widget _selectGender(String title, String value) {
    return Obx(() {
      return Padding(
          padding: EdgeInsets.symmetric(vertical: 20),
          child: Row(
            children: [
              Radio(
                  value: value,
                  groupValue: controller1.selectedGender.value,
                  activeColor: ColorApp.mildBlue,
                  onChanged: (newValue) {
                    controller1.selectedGender.value = newValue!;
                    print(newValue);
                  },
                  splashRadius: 30),
              Text(title),
            ],
          ));
    });
  }
}
