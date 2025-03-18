import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../MORE/Core/Constant/color.dart';
import '../../MORE/Core/Function/validinput.dart';
import '../../Widget/LoginCode/customTextFormAuth.dart';
import 'Model/messageModel.dart';
import 'app_service.dart';
import 'chatController.dart';
import 'chat_bubble.dart';

class ChatPage extends StatefulWidget {
  final String userId;
  final String userName;

  const ChatPage({Key? key, required this.userId, required this.userName})
      : super(key: key);

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final AppService appService = Get.find<AppService>();
  final AppController appController = Get.put(AppController(AppService()));

  @override
  void initState() {
    super.initState();
    _markMessagesAsRead(); // استدعاء دالة تعيين الرسائل كمقروءة عند الدخول للمحادثة
  }

  Future<void> _markMessagesAsRead() async {
    final currentUserId = appService.getCurrentUserId();

    try {
      // احصل على الرسائل الخاصة بالمستخدم
      final messages = await appService.getMessages(widget.userId).first;
      for (var message in messages) {
        // تحقق مما إذا كانت الرسالة لم تُقرأ
        if (message.userTo == currentUserId && !message.markAsRead) {
          await appService.markAsRead(message.id); // تعيين الرسالة كمقروءة
        }
      }
    } catch (e) {
      print('Error marking messages as read: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.userName),
        backgroundColor: ColorApp.caddiesSilk,
        shape: RoundedRectangleBorder(
          borderRadius: appController.myservices.sharedPref.getString("myLang") == "ar"
              ? BorderRadius.only(bottomRight: Radius.circular(50))
              : BorderRadius.only(bottomLeft: Radius.circular(50)),
        ),
      ),
      body: StreamBuilder<List<Message>>(
        stream: appService.getMessages(widget.userId),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting || !snapshot.hasData) {
            return Center(child: CircularProgressIndicator(color: ColorApp.caddiesSilk));
          }

          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }

          if (!snapshot.hasData) {
            return Center(child: Text('No messages'));
          }

          final messages = snapshot.data!;

          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    physics: BouncingScrollPhysics(),
                    reverse: true,
                    itemCount: messages.length,
                    itemBuilder: (context, index) {
                      final message = messages[index];
                      return ChatBubble(message: message);
                    },
                  ),
                ),
                SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Form(
                      key: appController.formKey,
                      child: _buildMsgField(),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildMsgField() {
    return CustomTextFormAuth(
      title: "Message".tr,
      hint: "Message".tr,
      icon: Icons.send_rounded,
      onTapicon: () async {
        if (appController.msgController.text.isNotEmpty) {
          final newMessage = Message.create(
            content: appController.msgController.text,
            userFrom: appService.getCurrentUserId(),
            userTo: widget.userId,
          );
          newMessage.isSending = true; // Set message sending state

          // Instead of setState, you can directly call the submit method
          await appController.submit(appService, widget.userId);
          appController.msgController.clear(); // Clear the input field
          setState(() {});
        }
      },
      myController: appController.msgController,
      keyboardTypex: TextInputType.text,
      valid: (val) => validinput(val!, 1, 5000, ""),
    );
  }
}