/*
يتم وضع مصدر البيانات اماا mysql او الشيرد برفيرنس
 */
import 'package:get/get.dart';
import '../../../Core/Constant/imageasset.dart';
import '../../Model/onboardingModel.dart';

List<OnBoardingModel> onBoardingModelList = [
  //1
  OnBoardingModel(
      title: "title1".tr, body: "body1".tr, image: ImageAssetApp.Bording),
//2
  OnBoardingModel(
      title: "title2".tr, body: "body2".tr, image: ImageAssetApp.Bording1),
//3
  OnBoardingModel(
      title: "title3".tr, body: "body3".tr, image: ImageAssetApp.Bording2),
//4
  OnBoardingModel(
      title: "title4".tr, body: "body4".tr, image: ImageAssetApp.Bording3),

];
