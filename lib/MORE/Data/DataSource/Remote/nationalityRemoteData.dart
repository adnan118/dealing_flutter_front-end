import '../../../DB/CRUD.dart';
import '../../../LinksConnect/LinksAPI.dart';

class NationalityRemoteData {
  CRUD crud;

  NationalityRemoteData(this.crud);

  postData() async {
    var response = await crud.postData(LinksApp.linkNationality, { });
    return response.fold((l) => l, (r) => r);
  }

}
