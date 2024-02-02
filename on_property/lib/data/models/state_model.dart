class StateModel {
  int? id;
  String? name;
  int? countryId;
  String? order;
  int? status;
  String? createdAt;
  String? updatedAt;
  Null? stateTranslation;

  StateModel(
      {this.id,
      this.name,
      this.countryId,
      this.order,
      this.status,
      this.createdAt,
      this.updatedAt,
      this.stateTranslation});

  StateModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    countryId = json['country_id'];
    order = json['order'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    stateTranslation = json['state_translation'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['country_id'] = this.countryId;
    data['order'] = this.order;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['state_translation'] = this.stateTranslation;
    return data;
  }
}
