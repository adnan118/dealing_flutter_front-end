import '../../../DB/CRUD.dart';
import '../../../LinksConnect/LinksAPI.dart';

class InfoLawerRemoteData {
  CRUD crud;

  InfoLawerRemoteData(this.crud);

  postData(lawyer_typeDealing_PassOrDocsOrBoth) async {
    var response = await crud.postData(LinksApp.linkinfoLawyer, {
      "lawyr_typeDealing_PassOrDocsOrBoth": lawyer_typeDealing_PassOrDocsOrBoth ,
    });
    return response.fold((l) => l, (r) => r);
  }

}
