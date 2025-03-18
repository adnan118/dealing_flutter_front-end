import '../../../DB/CRUD.dart';
import '../../../LinksConnect/LinksAPI.dart';

class TypePassportRemoteData {
  CRUD crud;

  TypePassportRemoteData(this.crud);

  postData() async {
    var response = await crud.postData(LinksApp.linkTypePassport, { });
    return response.fold((l) => l, (r) => r);
  }

}
