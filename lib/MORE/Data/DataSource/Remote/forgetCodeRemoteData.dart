

import '../../../DB/CRUD.dart';
import '../../../LinksConnect/LinksAPI.dart';

class ForgetCodeRemoteData {
  CRUD crud;

  ForgetCodeRemoteData(this.crud);

  postData(user_email) async {
    var response = await crud.postData(LinksApp.linkForgetCode, {
      "user_email": user_email ,
    });
    return response.fold((l) => l, (r) => r);
  }

}
