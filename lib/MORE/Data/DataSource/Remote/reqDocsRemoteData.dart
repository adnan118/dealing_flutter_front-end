import '../../../DB/CRUD.dart';
import '../../../LinksConnect/LinksAPI.dart';

class ReqDocsRemoteData {
  CRUD crud;

  ReqDocsRemoteData(this.crud);

  postData(user_id) async {
    var response = await crud.postData(LinksApp.linkInfoUserID, {
      "user_id": user_id ,
    });
    return response.fold((l) => l, (r) => r);
  }

}
