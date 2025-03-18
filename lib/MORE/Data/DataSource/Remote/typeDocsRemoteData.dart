import '../../../DB/CRUD.dart';
import '../../../LinksConnect/LinksAPI.dart';

class TypeDocsRemoteData {
  CRUD crud;

  TypeDocsRemoteData(this.crud);

  postData() async {
    var response = await crud.postData(LinksApp.linkTypeDocs, { });
    return response.fold((l) => l, (r) => r);
  }

}
