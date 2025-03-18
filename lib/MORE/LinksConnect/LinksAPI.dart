class LinksApp {
  static const String linkServerName ="https://adnan118.serv00.net/dealing";

 static const String linkLogin = "$linkServerName/AuthUser/login.php";
  static const String linkGenerate = "$linkServerName/AuthUser/Generate.php";
  static const String linkForgetCode = "$linkServerName/AuthUser/forgetCode.php";

  //Info User
  static const String linkInfoUserID = "$linkServerName/InfoUser/infoUserID.php";
  static const String linkInfoUserIDUpdate = "$linkServerName/InfoUser/infoUserIDUpdate.php";
  static const String linkinfoLawyer = "$linkServerName/InfoLawers/infoLawyer.php";
  //req docs
  static const String linkTypeDocs= "$linkServerName/ReqDocs/typeDocs.php";
  static const String linkCity= "$linkServerName/ReqDocs/city.php";
  static const String linkTransLang= "$linkServerName/ReqDocs/transLang.php";
  static const String linkInsertReqDocs= "$linkServerName/ReqDocs/insertReqDocs.php";
  //req passport
  static const String linkNationality= "$linkServerName/ReqPassprts/nationality.php";
  static const String linkRelation= "$linkServerName/ReqPassprts/relation.php";
  static const String linkTypePassport= "$linkServerName/ReqPassprts/typePassport.php";
  static const String linkInsertReqPassports= "$linkServerName/ReqPassprts/insertReqPassports.php";
  static const String linkPlacePassportRcve= "$linkServerName/ReqPassprts/placePassportRicive.php";
//home
//search
 static const String linkSearch="$linkServerName/Search/search.php";
//Payment
 static const String linkPayments="$linkServerName/Payments/payments.php";
 static const String linkStausPay="$linkServerName/Payments/stausPay.php";
 static const String linkPaymentReceipts="$linkServerName/Payments/PaymentReceipts.php";

 //Notifications
 static const String linkNotifications="$linkServerName/Notifications/notifications.php";
 static const String linkNotificationsRead="$linkServerName/Notifications/notificationsRead.php";
 //LegalConsultation
 static const String linkLegalConsultationMy="$linkServerName/LegalConsultation/previousconsultations.php";
 static const String linkLegalConsultationInsert="$linkServerName/LegalConsultation/insertconsultations.php";

 //tracking
 static const String linkTracking="$linkServerName/Tracking/tracking.php";
 static const String linkTrackingRateDocPass="$linkServerName/Tracking/trackingRateDocPass.php";

}
