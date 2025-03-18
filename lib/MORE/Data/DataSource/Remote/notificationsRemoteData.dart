import '../../../DB/CRUD.dart';
import '../../../LinksConnect/LinksAPI.dart';

class NotificationsRemoteData {
  CRUD crud;

  NotificationsRemoteData(this.crud);

  postData(user_id) async {
    var response = await crud.postData(LinksApp.linkNotifications, {
      "user_id": user_id ,
    });
    return response.fold((l) => l, (r) => r);
  }

  postDataRead(user_id,notification_id) async {
    var response = await crud.postData(LinksApp.linkNotificationsRead, {
      "user_id": user_id ,
      "notification_id":notification_id
    });
    return response.fold((l) => l, (r) => r);
  }

}
