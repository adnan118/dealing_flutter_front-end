
import '../../../DB/CRUD.dart';

class CountryRemoteData {
  CRUD crud;

  CountryRemoteData(this.crud);
  fetchCountryByCode() async {
  var response = await crud.fetchCountries();
  return response;
}




}
