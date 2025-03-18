



import '../../../DB/CRUD.dart';
import '../../../LinksConnect/LinksAPI.dart';

class InfoUserRemoteData {
  CRUD crud;

  InfoUserRemoteData(this.crud);

  postData(user_id) async {
    var response = await crud.postData(LinksApp.linkInfoUserID, {
      "user_id": user_id ,
    });
    return response.fold((l) => l, (r) => r);
  }

  setData(
      user_id,
      user_name,
      user_location,
      user_email,
      user_phone,
      user_img,
      myfile) async {
    try {
      var response = await crud.postRequestWithFile(
          LinksApp.linkInfoUserIDUpdate,
          {
            "user_id": user_id.toString(),
            "user_name": user_name.toString(),
            "user_location": user_location.toString(),
            "user_email": user_email.toString(),
            "user_phone": user_phone.toString(),
            "user_img": user_img.toString(),
          },
          myfile);

      return response;
    } catch (e) {
      print('An error occurred: $e');
      return null;
    }
  }


  setDataWithoutFile(
      user_id,
      user_name,
      user_location,
      user_email,
      user_phone,
      user_img,

      ) async {

      var response = await crud.postData(LinksApp.linkInfoUserIDUpdate, {
        "user_id": user_id.toString(),
        "user_name": user_name.toString(),
        "user_location": user_location.toString(),
        "user_email": user_email.toString(),
        "user_phone": user_phone.toString(),
        "user_img": user_img.toString(),
      });

      return response.fold((l) => l, (r) => r);
  }

}
