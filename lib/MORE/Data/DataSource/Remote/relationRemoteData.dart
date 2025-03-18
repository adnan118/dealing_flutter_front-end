import '../../../DB/CRUD.dart';
import '../../../LinksConnect/LinksAPI.dart';

class RelationRemoteData {
  CRUD crud;

  RelationRemoteData(this.crud);

  postData() async {
    var response = await crud.postData(LinksApp.linkRelation, { });
    return response.fold((l) => l, (r) => r);
  }

}
