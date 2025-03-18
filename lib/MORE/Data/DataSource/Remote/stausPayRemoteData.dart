import '../../../DB/CRUD.dart';
import '../../../LinksConnect/LinksAPI.dart';

class StausPayRemoteData {
  CRUD crud;

  StausPayRemoteData(this.crud);

  postData() async {
    var response = await crud.postData(LinksApp.linkStausPay, { });
    return response.fold((l) => l, (r) => r);
  }

}
