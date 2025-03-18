import '../../../DB/CRUD.dart';
import '../../../LinksConnect/LinksAPI.dart';

class CityRemoteData {
  CRUD crud;

  CityRemoteData(this.crud);

  postData() async {
    var response = await crud.postData(LinksApp.linkCity, {});
    return response.fold((l) => l, (r) => r);
  }

}
