import '../../../DB/CRUD.dart';
import '../../../LinksConnect/LinksAPI.dart';

class ConsultationRemoteData {
  CRUD crud;

  ConsultationRemoteData(this.crud);

  postData(consultation_userId) async {
    var response = await crud.postData(LinksApp.linkLegalConsultationMy, {
      "consultation_userId": consultation_userId,
    });
    return response.fold((l) => l, (r) => r);
  }

  postDataInsert(consultation_userId, consultation_title,) async {
    var response = await crud.postData(LinksApp.linkLegalConsultationInsert, {
      "consultation_userId": consultation_userId,
      "consultation_title": consultation_title,
      "consultation_body": "",
      "consultation_lawyer": "1",
    });
    return response.fold((l) => l, (r) => r);
  }
}
