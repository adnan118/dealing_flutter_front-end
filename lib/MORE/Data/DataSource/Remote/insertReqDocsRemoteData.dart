import '../../../DB/CRUD.dart';
import '../../../LinksConnect/LinksAPI.dart';

class InsertReqDocsRemoteData {
  CRUD crud;

  InsertReqDocsRemoteData(this.crud);

  sentDataReqDocsWithFile(
      docs_userId,
      docs_nameAr,
      docs_nameEn,
      docs_nationalNumber,
      docs_birthDate,
      docs_birthCity,
      docs_typeDocsId,
      docs_lawyrId,
      docs_countryDestinationId,
      docs_translationDocsId,
      docs_Totalcoast,
      docs_imgId,
      myfile) async {
    try {
      var response = await crud.postRequestWithFile(
          LinksApp.linkInsertReqDocs,
          {
            "docs_userId": docs_userId.toString(),
            "docs_nameAr": docs_nameAr.toString(),
            "docs_nameEn": docs_nameEn.toString(),
            "docs_nationalNumber": docs_nationalNumber.toString(),
            "docs_birthDate": docs_birthDate.toString(),
            "docs_birthCity": docs_birthCity.toString(),
            "docs_typeDocsId": docs_typeDocsId.toString(),
            "docs_lawyrId": docs_lawyrId.toString(),
            "docs_countryDestinationId": docs_countryDestinationId.toString(),
            "docs_translationDocsId": docs_translationDocsId.toString(),
            "docs_Totalcoast": docs_Totalcoast.toString(),
            "docs_imgId": docs_imgId.toString(),
          },
          myfile);

      return response;
    } catch (e) {
      print('An error occurred: $e');
      return null;
    }
  }
}
