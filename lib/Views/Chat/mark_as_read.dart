import 'package:Dealings/MORE/Core/Constant/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'Model/messageModel.dart';
import 'app_service.dart';

class MarkAsRead extends StatelessWidget {
  final Message message;
  const MarkAsRead({Key? key, required this.message}) : super(key: key);

  final _markRead = const Icon(
    Icons.done_all,
    color: ColorApp.paw,
    size: 18.0,
  );

  final _markUnRead = const Icon(
    Icons.done,
    color: ColorApp.warmGray,
    size: 18.0,
  );

  Future<Widget> _getMark() async {
    if (message.isMine == false) {
      if (message.markAsRead == false) {
        final appService = Get.find<AppService>();
        await appService.markAsRead(message.id);
      }

      return const SizedBox.shrink();
    }

    if (message.isMine == true) {
      if (message.markAsRead == true) {
        return _markRead;
      } else {
        return _markUnRead;
      }
    }

    return const SizedBox.shrink();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _getMark(),
      builder: (ctx, snapshot) {
        if (snapshot.hasData) {
          return snapshot.data as Widget;
        }

        return const SizedBox.shrink();
      },
    );
  }
}