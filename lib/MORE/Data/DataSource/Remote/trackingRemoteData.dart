

import '../../../DB/CRUD.dart';
import '../../../LinksConnect/LinksAPI.dart';

class TrackingRemoteData {
  CRUD crud;

  TrackingRemoteData(this.crud);

  postData(tracking_userId,tracking_docPassType) async {
    var response = await crud.postData(LinksApp.linkTracking, {
      "tracking_userId": tracking_userId ,
      "tracking_docPassType":tracking_docPassType
    });
    return response.fold((l) => l, (r) => r);
  }

  setDataRate(lawyer_id,starsRate,tracking_id) async {
    var response = await crud.postData(LinksApp.linkTrackingRateDocPass, {
      "lawyer_id": lawyer_id ,
      "starsRate":starsRate,
      "tracking_id":tracking_id,
    });
    return response.fold((l) => l, (r) => r);
  }
}
