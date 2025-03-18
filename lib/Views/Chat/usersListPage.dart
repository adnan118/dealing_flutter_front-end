import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import '../../MORE/Core/Constant/color.dart';
import '../../MORE/Core/Constant/imageasset.dart';
import '../../Widget/Home/avatarImage.dart';
import '../../Widget/Home/searchBar.dart';
import 'app_service.dart';
import 'chatController.dart';
import 'chat_page.dart';
import 'listDataSearch.dart';

class UsersListPage extends StatefulWidget {
  @override
  _UsersListPageState createState() => _UsersListPageState();
}

class _UsersListPageState extends State<UsersListPage> {
  String searchQuery = '';
  final AppService appService = Get.find<AppService>();
  final AppController appController = Get.put(AppController(AppService()));

  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorApp.pureWhite,
      appBar: AppBar(
        iconTheme: IconThemeData(color: ColorApp.intergalactic),
        elevation: 0,
        backgroundColor: ColorApp.pureWhite,
        toolbarHeight: 100,
        centerTitle: true,
        title: Column(children: [
          Text(
            'chatDealings'.tr,
            style: Theme.of(context).textTheme.displayLarge!.copyWith(fontSize: 20),
          ),
          Text(
            'chatDealingshint'.tr,
            style: Theme.of(context).textTheme.displaySmall! ,
          ),
        ],),
        actions: [
          Neumorphic(
            padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 5),
            margin: const EdgeInsets.symmetric(vertical: 9, horizontal: 9),
            style: NeumorphicStyle(
              boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(50)),
              color: ColorApp.pureWhite,
              depth: -50,
            ),
            child: AvatarImag(
              color: ColorApp.paw,
              img: "${ImageAssetApp.ImageProfile}/${appController.imgID}",
              radius: 35.0,
              numCircle: 5,
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          _buildSearchBar(),
          Expanded(
            child: FutureBuilder<List<Map<String, dynamic>>>(
              future: appService.getUserIdsWithConversations1(),
          //    future: appService.getAllUsers(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(
                      color: ColorApp.caddiesSilk,
                    ),
                  );
                }
                if (snapshot.hasError) {
                  return Center(child: Text('Error: ${snapshot.error}'));
                }
                if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  return const Center(child: Text('No users found'));
                }

                // احصل على اسم المستخدم الخاص بك
                final currentUserId = appService.getCurrentUserId();
                final users = snapshot.data!;

                // تصفية المستخدمين بناءً على استعلام البحث
                final filteredUsers = users.where((user) {
                  final username = user['username'].toLowerCase();
                  return username.contains(searchQuery.toLowerCase()) &&
                      user['id'] != currentUserId; // استبعاد المستخدم الحالي
                }).toList();



                return ListDataSearch(users: filteredUsers);
              },
            ),
          ),
        ],
      ),
    );
  }
  Widget _buildSearchBar() {
    return Container(
      margin: EdgeInsets.all(8),
      height: 40,
      child: Row(children: [
        Expanded(
          child: TextField(
            cursorColor: ColorApp.caddiesSilk,
            decoration: InputDecoration(
              hintStyle: TextStyle(color: ColorApp.intergalactic),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                borderSide: BorderSide.none,
              ),
              filled: true,
              fillColor: ColorApp.warmGray.withOpacity(0.4),
              contentPadding: EdgeInsets.symmetric(vertical: 1, horizontal: 20),
              hintText: "Searchforuser".tr,
            ),
            onChanged: (value) {
              setState(() {
                searchQuery = value;
              });
            },
          ),
        ),
      ]),
    );
  }
}