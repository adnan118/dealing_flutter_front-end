

import '../../../DB/CRUD.dart';
import '../../../LinksConnect/LinksAPI.dart';

class GenerateRemoteData {
  CRUD crud;

  GenerateRemoteData(this.crud);
  postData(users_name , users_phone , users_email , users_location)async{
    var response = await crud.postData(LinksApp.linkGenerate, {
      "user_name": users_name,
      "user_phone": users_phone,
      "user_email": users_email,
      "user_location": users_location,
    });
    return response.fold((l) => l, (r) => r);
  }
}
