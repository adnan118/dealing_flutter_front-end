import '../../../DB/CRUD.dart';
import '../../../LinksConnect/LinksAPI.dart';

class PaymentsRemoteData {
  CRUD crud;

  PaymentsRemoteData(this.crud);

  postData(user_id) async {
    var response = await crud.postData(LinksApp.linkPayments, {
      "idUser": user_id ,
    });
    return response.fold((l) => l, (r) => r);
  }

}
