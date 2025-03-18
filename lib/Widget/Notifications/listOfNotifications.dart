import 'package:Dealings/MORE/Classes/handlingStatusRemotDataView.dart';
 import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../Controller/Home/mainScreen_Controller.dart';
 import '../../Controller/Traking/traking_Controller.dart';
import '../../MORE/Core/Constant/color.dart';
import '../../MORE/Core/Localization/translateDB.dart';

class ListOfNotifications extends StatefulWidget {
  const ListOfNotifications({Key? key}) : super(key: key);

  @override
  State<ListOfNotifications> createState() => _ListOfNotificationsState();
}

class _ListOfNotificationsState extends State<ListOfNotifications>
    with SingleTickerProviderStateMixin {
   late AnimationController _animationController;
  late Animation<Offset> _animation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );

    _animation = Tween<Offset>(
      begin: const Offset(1.0, 0.0), // ابدأ من الجانب الأيمن
      end: Offset.zero, // الوصول إلى الموضع الأصلي
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeOutCirc,
    ));

    // بدء الانيميشن عند تحميل الويدجت
    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
     Traking_Controller controllerTraking = Get.put(Traking_Controller());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MainScreen_Controller>(
        builder: (controller) => HandlingStatusRemotDataView(
            statusRequest: controller.statusRequest,
            widget: SlideTransition(
              position: _animation,
              child:

              controller.listOfNotifications.isEmpty?
              Text(
                "NotificationsEmpty".tr,
                style: Theme.of(context).textTheme.displayLarge!.copyWith(color: ColorApp.warmGray,fontSize: 25),
              )
                    :
              ListView.builder(
shrinkWrap: true,
                physics: BouncingScrollPhysics(),
                itemCount: controller.listOfNotifications.length,
                itemBuilder: (context, index) {
                  return ListTile(


                    trailing: Text(
                      controller
                          .listOfNotifications[index].notificationDateInsert
                          .toString().substring(0,16) ,
                      style: Theme.of(context).textTheme.displayLarge!.copyWith(
                          fontSize: 12,
                          color: ColorApp.caddiesSilk.withOpacity(0.4)),
                    ),
                    title: Row(
                      children: [
                        Icon(
                          Icons.circle,
                          color: controller.listOfNotifications[index].notificationRead == 0 ? ColorApp.paw : Colors.transparent,
                          size: 10,
                        ),
                        SizedBox(width: 8), // Add spacing between the icon and the text if needed
                        Expanded( // Or you can use Expanded
                          child: Text(
                            translateDB(
                              controller.listOfNotifications[index].notificationTitleAr,
                              controller.listOfNotifications[index].notificationTitleEn,
                            ),
                            style: Theme.of(context).textTheme.displayLarge!.copyWith(
                              fontSize: 12.5,
                              color: ColorApp.caddiesSilk.withOpacity(0.6),
                            ),
                            overflow: TextOverflow.fade,
                          ),
                        ),
                      ],
                    ),
                    subtitle: Text(
                      translateDB(
                        controller
                            .listOfNotifications[index].notificationBodyAr,
                        controller
                            .listOfNotifications[index].notificationBodyEn,
                      ),
                      style: Theme.of(context).textTheme.displaySmall!.copyWith(
                          fontSize: 12,
                          color: ColorApp.mildBlue ),
                    ),
                    onTap: (){
                    if(  controller
                          .listOfNotifications[index].notificationTitleEn=="Dealings-Tracking"){
                      Get.back();
                      controllerTraking.getTrackDocuments();
                      controllerTraking.getTrackPassports();
                      controller.changPage(1);
                      controller.isReadNotificationN = true.obs;
                      controller.getNotifications();
                    }
                    else{
                      controller.setResdNotifications(  controller
                          .listOfNotifications[index].notificationId.toString(),
                          controller
                              .listOfNotifications[index].notificationNamePage.toString());
                      controller.isReadNotificationN = true.obs;
                      controller.getNotifications();
                    }
                    },
                  );
                },
              ),
            )));
  }
}
