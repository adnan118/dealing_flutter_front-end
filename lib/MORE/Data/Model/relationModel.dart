class RelationModel {
  int? relationId;
  String? relationNameAr;
  String? relationNameEn;
  int? relationActive;

  RelationModel(
      {this.relationId,
        this.relationNameAr,
        this.relationNameEn,
        this.relationActive});

  RelationModel.fromJson(Map<String, dynamic> json) {
    relationId = json['relation_id'];
    relationNameAr = json['relation_nameAr'];
    relationNameEn = json['relation_nameEn'];
    relationActive = json['relation_active'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['relation_id'] = this.relationId;
    data['relation_nameAr'] = this.relationNameAr;
    data['relation_nameEn'] = this.relationNameEn;
    data['relation_active'] = this.relationActive;
    return data;
  }
}