

import '../../../DB/CRUD.dart';
import '../../../LinksConnect/LinksAPI.dart';

class LoginRemoteData {
  CRUD crud;

  LoginRemoteData(this.crud);

  postData(users_code) async {
    var response = await crud.postData(LinksApp.linkLogin, {
      "user_code": users_code ,
    });
    return response.fold((l) => l, (r) => r);
  }

}
