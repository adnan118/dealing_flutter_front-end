import '../../../DB/CRUD.dart';
import '../../../LinksConnect/LinksAPI.dart';

class TransLangRemoteData {
  CRUD crud;

  TransLangRemoteData(this.crud);

  postData() async {
    var response = await crud.postData(LinksApp.linkTransLang, {});
    return response.fold((l) => l, (r) => r);
  }

}
