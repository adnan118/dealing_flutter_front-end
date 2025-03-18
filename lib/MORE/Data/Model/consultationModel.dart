class ConsultationModel {
  int? consultationId;
  int? consultationUserId;
  String? consultationTitle;
  String? consultationBody;
  int? consultationLawyer;
  String? consultationDate;

  ConsultationModel(
      {this.consultationId,
        this.consultationUserId,
        this.consultationTitle,
        this.consultationBody,
        this.consultationLawyer,
        this.consultationDate});

  ConsultationModel.fromJson(Map<String, dynamic> json) {
    consultationId = json['consultation_id'];
    consultationUserId = json['consultation_userId'];
    consultationTitle = json['consultation_title'];
    consultationBody = json['consultation_body'];
    consultationLawyer = json['consultation_lawyer'];
    consultationDate = json['consultation_date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['consultation_id'] = this.consultationId;
    data['consultation_userId'] = this.consultationUserId;
    data['consultation_title'] = this.consultationTitle;
    data['consultation_body'] = this.consultationBody;
    data['consultation_lawyer'] = this.consultationLawyer;
    data['consultation_date'] = this.consultationDate;
    return data;
  }
}
