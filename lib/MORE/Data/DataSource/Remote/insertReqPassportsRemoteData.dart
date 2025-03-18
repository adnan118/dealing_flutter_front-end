import '../../../DB/CRUD.dart';
import '../../../LinksConnect/LinksAPI.dart';

class InsertReqPassportsRemoteData {
  CRUD crud;

  InsertReqPassportsRemoteData(this.crud);

  sentDataReqPassportsWithFile(
      passports_userId,
      passports_relation,
      passports_nameAr,
      passports_nameEn,
      passports_surnameAr,
      passports_surnameEn,
      passports_fatherNameAr,
      passports_fatherNameEn,
      passports_motherNameAr,
      passports_motherNameEn,
      passports_nationality,
      passports_gender,
      passports_birthDate,
      passports_placeOfBirthAr,
      passports_placeOfBirthEn,
      passports_typePassport,
      passports_placePassportRcv,
      passports_nationalNumber,
      passports_Oldpassportnumber,
      passports_OldpassportDate,
      passports_OldpassportExpiryDate,
      passports_imgid,
      passports_haveoldpassport,
      selectedLawyer,
      passports_Totalcoast,
      myfile) async {
    try {
      var response = await crud.postRequestWithFile(
          LinksApp.linkInsertReqPassports,
          {
            "passports_userId": passports_userId.toString(),
            "passports_relation": passports_relation.toString(),
            "passports_nameAr": passports_nameAr.toString(),
            "passports_nameEn": passports_nameEn.toString(),
            "passports_surnameAr": passports_surnameAr.toString(),
            "passports_surnameEn": passports_surnameEn.toString(),
            "passports_fatherNameAr": passports_fatherNameAr.toString(),
            "passports_fatherNameEn": passports_fatherNameEn.toString(),
            "passports_motherNameAr": passports_motherNameAr.toString(),
            "passports_motherNameEn": passports_motherNameEn.toString(),
            "passports_nationality": passports_nationality.toString(),
            "passports_gender": passports_gender.toString(),
            "passports_birthDate": passports_birthDate.toString(),
            "passports_placeOfBirthAr": passports_placeOfBirthAr.toString(),
            "passports_placeOfBirthEn": passports_placeOfBirthEn.toString(),
            "passports_typePassport": passports_typePassport.toString(),
            "passports_placePassportRcv": passports_placePassportRcv.toString(),
            "passports_nationalNumber": passports_nationalNumber.toString(),
            "passports_Oldpassportnumber": passports_Oldpassportnumber.toString(),
            "passports_OldpassportDate": passports_OldpassportDate.toString(),
            "passports_OldpassportExpiryDate": passports_OldpassportExpiryDate.toString(),
            "passports_imgid": passports_imgid.toString(),
            "passports_haveoldpassport": passports_haveoldpassport.toString(),
            "passports_lawyer": selectedLawyer.toString(),
            "passports_Totalcoast": passports_Totalcoast.toString(),
          },
          myfile);

      return response;
    } catch (e) {
      print('An error occurred: $e');
      return null;
    }
  }
}
