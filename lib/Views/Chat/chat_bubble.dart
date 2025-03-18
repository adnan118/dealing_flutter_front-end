import 'package:Dealings/MORE/Core/Constant/color.dart';
import 'package:flutter/material.dart';
import 'Model/messageModel.dart';
import 'mark_as_read.dart';

class ChatBubble extends StatelessWidget {
  final Message message;
  const ChatBubble({Key? key, required this.message}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 18),
      child: Row(
        mainAxisAlignment: message.isMine ? MainAxisAlignment.end : MainAxisAlignment.start,
        children: [
          Flexible(
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
              decoration: BoxDecoration(
                color: message.isMine ? ColorApp.intergalactic.withOpacity(0.8) : ColorApp.warmGray,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                crossAxisAlignment: message.isMine ? CrossAxisAlignment.end : CrossAxisAlignment.start,
                children: [
                  // نص الرسالة
                  Text(
                    message.content,
                    style: message.isMine ?Theme.of(context).textTheme.displaySmall!.copyWith(color: ColorApp.pureWhite) :Theme.of(context).textTheme.displaySmall,
                  ),
                  // تاريخ الرسالة
                  Text(
                    message.createAt.toString().substring(0, 16),
                    style: message.isMine ?Theme.of(context).textTheme.displaySmall!.copyWith(color: ColorApp.pureWhite,fontSize: 9) :Theme.of(context).textTheme.displaySmall!.copyWith(color: ColorApp.mildBlue,fontSize: 9),
                  ),
                  // شارة القراءة

              (message.isSending ==true) ?// تحقق من حالة الإرسال
              Icon(Icons.access_time_rounded, color: Colors.grey,size: 18,):  MarkAsRead(message: message),


                ],
              ),
            ),
          ),
          const SizedBox(width: 12), // مسافة بين الفقاعة وحافة الشاشة
        ],
      ),
    );
  }
}