import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:lottie/lottie.dart';
import '../Core/Constant/color.dart';
import '../Core/Constant/imageasset.dart';
import 'package:get/get.dart';

import '../DB/statusRequest.dart';


///// DataView
class HandlingStatusRemotDataView extends StatelessWidget {
  const HandlingStatusRemotDataView(
      {Key? key, required this.statusRequest, required this.widget})
      : super(key: key);
  final StatusRequest statusRequest;
  final Widget widget;

  @override
  Widget build(BuildContext context) {
    return statusRequest == StatusRequest.loading
        ? Center(child: CircularProgressIndicator(color: ColorApp.intergalactic))
        : statusRequest == StatusRequest.offinternetfailuer
            ? Neumorphic(
      style: NeumorphicStyle(color: ColorApp.pureWhite),
                child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(ImageAssetApp.disconnect_internet),
                  Text("No Internet!",
                      style: Theme.of(context).textTheme.displaySmall),
                  InkWell(
                    child: Icon(Icons.refresh,color: ColorApp.paw,size: 35,),
                    onTap: ()=>Get. offAllNamed("/"),
                  )
                ],
              ))
            : statusRequest == StatusRequest.serverfailuer
                ? Neumorphic(
        style: NeumorphicStyle(color: ColorApp.pureWhite),
                    child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(ImageAssetApp.server_failure),
                      Text("Server failure",
                          style: Theme.of(context).textTheme.displaySmall),

                    ],
                  ))
                : statusRequest == StatusRequest.failuer
                    ? Neumorphic(
        style: NeumorphicStyle(color: ColorApp.pureWhite),
                        child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(ImageAssetApp.no_data,height:300 ),
                          Text("No Data",
                              style: Theme.of(context).textTheme.displaySmall),

                        ],
                      ))
                    : widget;
  }
}

//////  DataRequest

class HandlingStatusRemotDataRequest extends StatelessWidget {
  const HandlingStatusRemotDataRequest(
      {Key? key, required this.statusRequest, required this.widget})
      : super(key: key);
  final StatusRequest statusRequest;
  final Widget widget;

  @override
  Widget build(BuildContext context) {
    return statusRequest == StatusRequest.loading
        ? Center(child: CircularProgressIndicator(color: ColorApp.intergalactic))
        : statusRequest == StatusRequest.offinternetfailuer
            ? Neumorphic(
        style: NeumorphicStyle(color: ColorApp.pureWhite),
                child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(ImageAssetApp.disconnect_internet),
                  Text("No Internet!",
                      style: Theme.of(context).textTheme.displaySmall),

                ],
              ))
            : statusRequest == StatusRequest.serverfailuer
                ? Neumorphic(
        style: NeumorphicStyle(color: ColorApp.pureWhite),
                    child: Container(
                    color: Colors.transparent,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(ImageAssetApp.server_failure),
                        Text("server failuer",
                            style: Theme.of(context).textTheme.displaySmall),

                      ],
                    ),
                  ))
                : widget;
  }
}
