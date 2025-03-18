import '../../../DB/CRUD.dart';
import '../../../LinksConnect/LinksAPI.dart';

class PlacePassportRcveRemoteData {
  CRUD crud;

  PlacePassportRcveRemoteData(this.crud);

  postData() async {
    var response =  await crud.postData(LinksApp.linkPlacePassportRcve, {});
    return response.fold((l) => l, (r) => r);
  }

}
