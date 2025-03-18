import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:get/get.dart';
import '../../Controller/Home/home_Controller.dart';
import '../../MORE/Core/Constant/color.dart';
import 'Model/messageModel.dart';
import 'app_service.dart';
import 'chat_page.dart';

class ListDataSearch extends StatefulWidget {
  final List<Map<String, dynamic>> users;

  const ListDataSearch({Key? key, required this.users}) : super(key: key);

  @override
  State<ListDataSearch> createState() => _ListDataSearchState();
}

class _ListDataSearchState extends State<ListDataSearch>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  final Home_Controller homeController = Get.put(Home_Controller());

  List<Message> unreadMessages = [];
  final AppService appService = Get.find<AppService>();

  // خريطة لتخزين عدد الرسائل غير المقروءة لكل مستخدم
  Map<String, int> unreadCountMap = {};
  bool _isLoading = true; // متغير لحالة التحميل

  @override
  void initState() {
    super.initState();
    _animationController =
    AnimationController(vsync: this, duration: const Duration(seconds: 1))
      ..forward();
    _loadMessages();
  }

  Future<void> _loadMessages() async {
    setState(() {
      _isLoading = true;
    });

    final String currentUserId = appService.getCurrentUserId();
    setState(() {
      unreadMessages.clear();
      unreadCountMap.clear();
    });


    for (var user in widget.users) {
      var userId = user['id'];
       // تحقق مما إذا كان معرف المستخدم غير فارغ
      if (userId != null && userId.isNotEmpty) {
        try {
          await for (final messages in appService.getMessages(userId)) {
            var userUnreadMessages = messages.where((message) =>
            message.userFrom != currentUserId &&
                message.userTo == currentUserId &&
                !message.markAsRead);

            unreadMessages.addAll(userUnreadMessages);
            unreadCountMap[userId] = userUnreadMessages.length;
            if(unreadCountMap[userId]! >0){
homeController.mainScreen_Controllerx.isReadNotificationC=false.obs;

            print(unreadCountMap[userId]!);}
          }
        } catch (e) {
          print('Error loading messages for user $userId: $e');
        }
      } else {
        print('Skipping user with empty ID.');
      }
    }

    setState(() {
      _isLoading = false; // انهاء التحميل
    });

    print('Total unread messages: ${unreadMessages.length}');
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  Widget _buildUserTile(String username, String userId, {unreadCount}) {
    return GestureDetector(
      onTap: () {
        Get.to(() => ChatPage(userId: userId, userName: username));
      },
      child: Neumorphic(
        margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 5),
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 5),
        style: NeumorphicStyle(
          boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(20)),
          color: ColorApp.warmGray,
          depth: 1,
          shape: NeumorphicShape.concave,
        ),
        child: Stack(
          children: [
            Center(
              child: Text(
                username,
                style: Theme.of(context)
                    .textTheme
                    .displayLarge!
                    .copyWith(fontSize: 15),
              ),
            ),
            if (unreadCount > 0) // تحقق من عدد الرسائل غير المقروءة
              Positioned(
                  right: 8,
                  child: Stack(
                    children: [
                      Icon(
                        Icons.person_pin_outlined,
                        color: ColorApp.intergalactic,
                        size: 28,
                      ),
                      Icon(
                        Icons.circle_rounded,
                        color: ColorApp.paw,
                        size: 16,
                      ),
                      Text(
                        " $unreadCount",
                        textAlign: TextAlign.center,
                        style:
                        TextStyle(fontSize: 11, color: ColorApp.pureWhite),
                      )
                    ],
                  )),
            if (unreadCount == 0)
              Positioned(
                right: 10,
                child: Icon(
                  Icons.person_pin_outlined,
                  color: Colors.grey,
                  size: 25,
                ),
              ),
          ],
        ),
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 15),
        child: Wrap(
          children: [
            for (var user in widget.users)
              _buildUserTile(
                user['username'],
                user['id'],
                unreadCount: unreadCountMap[user['id']] ?? 0,
              ),
          ],
        ),
      ),


    );
  }



}