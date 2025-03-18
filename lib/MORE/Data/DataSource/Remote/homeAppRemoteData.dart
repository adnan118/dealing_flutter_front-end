
import '../../../DB/CRUD.dart';
import '../../../LinksConnect/LinksAPI.dart';

class  HomeAppRemoteData {
  CRUD crud;
  HomeAppRemoteData(this.crud);
  //search
  getSearchData(searchType)async{
    var response = await crud.postData(LinksApp.linkSearch, {
      "search_Type":searchType,
    });
    return response.fold((l) => l, (r) => r);
  }
}