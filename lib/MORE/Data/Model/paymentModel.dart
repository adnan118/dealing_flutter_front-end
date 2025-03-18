class PaymentModel {
  int? idReq;
  int? idUser;
  String? nameArabic;
  String? nameEnglish;
  int? idLawyer;
  String? idImg;
  String? dateInsert;
  int? totalCoast;
  int? payment;
  int? statusPay;
  int? invoiceNumber;
  String? typeReq;

  PaymentModel(
      {this.idReq,
        this.idUser,
        this.nameArabic,
        this.nameEnglish,
        this.idLawyer,
        this.idImg,
        this.dateInsert,
        this.totalCoast,
        this.payment,
        this.statusPay,
        this.invoiceNumber,
        this.typeReq});

  PaymentModel.fromJson(Map<String, dynamic> json) {
    idReq = json['idReq'];
    idUser = json['idUser'];
    nameArabic = json['nameArabic'];
    nameEnglish = json['nameEnglish'];
    idLawyer = json['idLawyer'];
    idImg = json['idImg'];
    dateInsert = json['dateInsert'];
    totalCoast = json['totalCoast'];
    payment = json['payment'];
    statusPay = json['statusPay'];
    invoiceNumber = json['invoiceNumber'];
    typeReq = json['typeReq'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['idReq'] = this.idReq;
    data['idUser'] = this.idUser;
    data['nameArabic'] = this.nameArabic;
    data['nameEnglish'] = this.nameEnglish;
    data['idLawyer'] = this.idLawyer;
    data['idImg'] = this.idImg;
    data['dateInsert'] = this.dateInsert;
    data['totalCoast'] = this.totalCoast;
    data['payment'] = this.payment;
    data['statusPay'] = this.statusPay;
    data['invoiceNumber'] = this.invoiceNumber;
    data['typeReq'] = this.typeReq;
    return data;
  }
}
