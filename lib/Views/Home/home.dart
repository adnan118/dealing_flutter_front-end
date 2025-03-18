import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:Dealings/MORE/Classes/handlingStatusRemotDataView.dart';
import '../../Controller/Account/account_Controller.dart';
import '../../Controller/Home/home_Controller.dart';
import '../../MORE/Core/Constant/color.dart';
import '../../MORE/Core/Function/alertExitApp.dart';
import '../../Widget/Home/animWidget.dart';
import '../../Widget/Home/containerHome.dart';
import '../../Widget/Home/listDataSearch.dart';
import '../../Widget/Home/searchBar.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  final Account_Controller accountController = Get.put(Account_Controller());
  final Home_Controller homeController = Get.put(Home_Controller());
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    )..forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorApp.pureWhite,
      body: WillPopScope(
        onWillPop: AlertExitApp,
        child: checkGetDataPersonal(),
      ),
    );
  }

  Widget checkGetDataPersonal() {
    return Obx(() => accountController.dataUserIDOBX.isEmpty
        ? homePage():  homePage());
  }

  Widget homePage() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: SingleChildScrollView(
        physics:BouncingScrollPhysics(),
        child: Column(
          children: [
            _buildHeader(),
            _buildSearchBar(),
            const SizedBox(height: 40),
            _buildDataList(),
            const SizedBox(height: 80),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      margin: const EdgeInsets.only(top: 20, bottom: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "hello".tr,
                  textAlign: TextAlign.center,
                  style: Theme.of(context)
                      .textTheme
                      .displayLarge!
                      .copyWith(fontWeight: FontWeight.normal),
                ),
                Text(
                  " ${accountController.userModel?.userName?.split(' ')[0]}",
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.displayLarge!,
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.pin_drop_outlined, color: ColorApp.paw),
                Text(
                  "${accountController.userModel?.userLocation}",
                  textAlign: TextAlign.center,
                  style: Theme.of(context)
                      .textTheme
                      .displayMedium!
                      .copyWith(color: ColorApp.mildBlue),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSearchBar() {
    return AnimWidget(
      widget: SearchBar(
        myController: homeController.searchController!,
        title: "Searchforservice".tr,
        onPressedSearching: homeController.onPressSearchPro,
        onChanged: homeController.checkSearch,
      ),
    );
  }

  Widget _buildDataList() {
    return GetBuilder<Home_Controller>(
      builder: (controller) {
        return HandlingStatusRemotDataView(
            statusRequest: controller.statusRequest,
            widget: Stack(children: [

              homeController.isDoingSearch
                  ? ListDataSearch(listdata: homeController.listdata)
                  : ListView.builder(
                physics:BouncingScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: homeController.title.length,
                      itemBuilder: (context, index) {
                        return SlideTransition(
                          position: Tween<Offset>(
                            begin: const Offset(0, 0.5),
                            end: Offset.zero,
                          ).animate(
                            CurvedAnimation(
                              parent: _animationController,
                              curve: Curves.ease,
                            ),
                          ),
                          child: ContainerHome(
                            title: homeController.title[index].toString(),
                            content: "${homeController.content[index]}",
                            colorBg:
                                index.isEven ? ColorApp.paw : ColorApp.mildBlue,
                            colorContent: ColorApp.blackNero,
                            titleBtn: "${homeController.titleBtn[index]}",
                            onPressed: () {
                              Get.toNamed(homeController.nameService[index]);
                            },
                          ),
                        );
                      },
                    ),
            ]));
      },
    );
  }
}
