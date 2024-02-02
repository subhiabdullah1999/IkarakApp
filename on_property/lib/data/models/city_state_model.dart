class CityStateModel {
  int? id;
  String? name;
  int? stateId;
  int? countryId;
  String? image;
  int? status;
  Null? slug;
  String? createdAt;
  String? updatedAt;
  Null? cityTranslation;

  CityStateModel(
      {this.id,
      this.name,
      this.stateId,
      this.countryId,
      this.image,
      this.status,
      this.slug,
      this.createdAt,
      this.updatedAt,
      this.cityTranslation});

  CityStateModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    stateId = json['state_id'];
    countryId = json['country_id'];
    image = json['image'];
    status = json['status'];
    slug = json['slug'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    cityTranslation = json['city_translation'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['state_id'] = this.stateId;
    data['country_id'] = this.countryId;
    data['image'] = this.image;
    data['status'] = this.status;
    data['slug'] = this.slug;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['city_translation'] = this.cityTranslation;
    return data;
  }
}
