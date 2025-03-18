import '../../../DB/CRUD.dart';
import '../../../LinksConnect/LinksAPI.dart';

class PaymentReceiptsRemoteData {
  CRUD crud;

  PaymentReceiptsRemoteData(this.crud);

  setData(PaymentReceipts_userId, PaymentReceipts_invoicNumber,
      PaymentReceipts_imgID,PaymentReceipts_totalCoast,docsPass_id,typeReq, myfile) async {
    try {
    var response = await crud.postRequestWithFile(
        LinksApp.linkPaymentReceipts,
        {
          "PaymentReceipts_userId": PaymentReceipts_userId.toString(),
          "PaymentReceipts_invoicNumber": PaymentReceipts_invoicNumber.toString(),
          "PaymentReceipts_imgID": PaymentReceipts_imgID.toString(),
          "PaymentReceipts_totalCoast": PaymentReceipts_totalCoast.toString(),
          "docsPass_id": docsPass_id.toString(),
          "typeReq": typeReq.toString(),

        },
        myfile);

    return response;
  } catch (e) {
  print('An error occurred: $e');
  return null; // أو يمكنك إرجاع قيمة تشعر أنها تعبر عن الخطأ
  }
}
}