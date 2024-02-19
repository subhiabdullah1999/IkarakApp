class SearchDataModel {
  int? id;
  int? userId;
  String? propertyId;
  int? categoryId;
  int? subCategoryId;
  int? countryId;
  int? cityId;
  int? stateId;
  int? currencyId;
  String? title;
  String? type;
  String? lat;
  String? lon;
  String? price;
  int? status;
  int? moderationStatus;
  int? isFeatured;
  String? description;
  String? createdAt;
  String? updatedAt;
  int? packageId;
  String? thumbnail;
  String? backgroundImage;
  PropertyDetails? propertyDetails;
  User? user;
  Category? category;
  Country? country;
  State? state;
  City? city;
  Null? propertyTranslation;
  Image? image;

  SearchDataModel(
      {this.id,
      this.userId,
      this.propertyId,
      this.categoryId,
      this.subCategoryId,
      this.countryId,
      this.cityId,
      this.stateId,
      this.currencyId,
      this.title,
      this.type,
      this.lat,
      this.lon,
      this.price,
      this.status,
      this.moderationStatus,
      this.isFeatured,
      this.description,
      this.createdAt,
      this.updatedAt,
      this.packageId,
      this.thumbnail,
      this.backgroundImage,
      this.propertyDetails,
      this.user,
      this.category,
      this.country,
      this.state,
      this.city,
      this.propertyTranslation,
      this.image});

  SearchDataModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    propertyId = json['property_id'];
    categoryId = json['category_id'];
    subCategoryId = json['sub_category_id'];
    countryId = json['country_id'];
    cityId = json['city_id'];
    stateId = json['state_id'];
    currencyId = json['currency_id'];
    title = json['title'];
    type = json['type'];
    lat = json['lat'];
    lon = json['lon'];
    price = json['price'];
    status = json['status'];
    moderationStatus = json['moderation_status'];
    isFeatured = json['is_featured'];
    description = json['description'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    packageId = json['package_id'];
    thumbnail = json['thumbnail'];
    backgroundImage = json['background_image'];
    propertyDetails = json['property_details'] != null
        ? new PropertyDetails.fromJson(json['property_details'])
        : null;
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
    category = json['category'] != null
        ? new Category.fromJson(json['category'])
        : null;
    country =
        json['country'] != null ? new Country.fromJson(json['country']) : null;
    state = json['state'] != null ? new State.fromJson(json['state']) : null;
    city = json['city'] != null ? new City.fromJson(json['city']) : null;
    propertyTranslation = json['property_translation'];
    image = json['image'] != null ? new Image.fromJson(json['image']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['property_id'] = this.propertyId;
    data['category_id'] = this.categoryId;
    data['sub_category_id'] = this.subCategoryId;
    data['country_id'] = this.countryId;
    data['city_id'] = this.cityId;
    data['state_id'] = this.stateId;
    data['currency_id'] = this.currencyId;
    data['title'] = this.title;
    data['type'] = this.type;
    data['lat'] = this.lat;
    data['lon'] = this.lon;
    data['price'] = this.price;
    data['status'] = this.status;
    data['moderation_status'] = this.moderationStatus;
    data['is_featured'] = this.isFeatured;
    data['description'] = this.description;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['package_id'] = this.packageId;
    data['thumbnail'] = this.thumbnail;
    data['background_image'] = this.backgroundImage;
    if (this.propertyDetails != null) {
      data['property_details'] = this.propertyDetails!.toJson();
    }
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    if (this.category != null) {
      data['category'] = this.category!.toJson();
    }
    if (this.country != null) {
      data['country'] = this.country!.toJson();
    }
    if (this.state != null) {
      data['state'] = this.state!.toJson();
    }
    if (this.city != null) {
      data['city'] = this.city!.toJson();
    }
    data['property_translation'] = this.propertyTranslation;
    if (this.image != null) {
      data['image'] = this.image!.toJson();
    }
    return data;
  }
}

class PropertyDetails {
  int? id;
  int? propertyId;
  String? bed;
  String? bath;
  String? garage;
  String? floor;
  String? roomSize;
  String? content;
  Null? video;
  String? createdAt;
  String? updatedAt;

  PropertyDetails(
      {this.id,
      this.propertyId,
      this.bed,
      this.bath,
      this.garage,
      this.floor,
      this.roomSize,
      this.content,
      this.video,
      this.createdAt,
      this.updatedAt});

  PropertyDetails.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    propertyId = json['property_id'];
    bed = json['bed'];
    bath = json['bath'];
    garage = json['garage'];
    floor = json['floor'];
    roomSize = json['room_size'];
    content = json['content'];
    video = json['video'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['property_id'] = this.propertyId;
    data['bed'] = this.bed;
    data['bath'] = this.bath;
    data['garage'] = this.garage;
    data['floor'] = this.floor;
    data['room_size'] = this.roomSize;
    data['content'] = this.content;
    data['video'] = this.video;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class User {
  int? id;
  String? fName;
  String? lName;
  String? username;
  String? type;
  int? isApproved;
  String? email;
  String? mobile;
  Null? emailVerifiedAt;
  Null? createdAt;
  String? updatedAt;
  String? title;
  String? companyName;
  Null? image;
  String? description;
  Null? skype;
  Null? fb;
  Null? twitter;
  Null? instagram;
  Null? status;
  Null? mobileOffice;
  Null? otp;
  int? cridetNumber;

  User(
      {this.id,
      this.fName,
      this.lName,
      this.username,
      this.type,
      this.isApproved,
      this.email,
      this.mobile,
      this.emailVerifiedAt,
      this.createdAt,
      this.updatedAt,
      this.title,
      this.companyName,
      this.image,
      this.description,
      this.skype,
      this.fb,
      this.twitter,
      this.instagram,
      this.status,
      this.mobileOffice,
      this.otp,
      this.cridetNumber});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    fName = json['f_name'];
    lName = json['l_name'];
    username = json['username'];
    type = json['type'];
    isApproved = json['is_approved'];
    email = json['email'];
    mobile = json['mobile'];
    emailVerifiedAt = json['email_verified_at'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    title = json['title'];
    companyName = json['company_name'];
    image = json['image'];
    description = json['description'];
    skype = json['skype'];
    fb = json['fb'];
    twitter = json['twitter'];
    instagram = json['instagram'];
    status = json['status'];
    mobileOffice = json['mobile_office'];
    otp = json['otp'];
    cridetNumber = json['cridet_number'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['f_name'] = this.fName;
    data['l_name'] = this.lName;
    data['username'] = this.username;
    data['type'] = this.type;
    data['is_approved'] = this.isApproved;
    data['email'] = this.email;
    data['mobile'] = this.mobile;
    data['email_verified_at'] = this.emailVerifiedAt;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['title'] = this.title;
    data['company_name'] = this.companyName;
    data['image'] = this.image;
    data['description'] = this.description;
    data['skype'] = this.skype;
    data['fb'] = this.fb;
    data['twitter'] = this.twitter;
    data['instagram'] = this.instagram;
    data['status'] = this.status;
    data['mobile_office'] = this.mobileOffice;
    data['otp'] = this.otp;
    data['cridet_number'] = this.cridetNumber;
    return data;
  }
}

class Category {
  int? id;
  String? name;
  int? parentId;
  int? order;
  int? status;
  Null? isDefault;
  String? description;
  String? createdAt;
  String? updatedAt;
  Null? categoryTranslation;

  Category(
      {this.id,
      this.name,
      this.parentId,
      this.order,
      this.status,
      this.isDefault,
      this.description,
      this.createdAt,
      this.updatedAt,
      this.categoryTranslation});

  Category.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    parentId = json['parent_id'];
    order = json['order'];
    status = json['status'];
    isDefault = json['is_default'];
    description = json['description'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    categoryTranslation = json['category_translation'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['parent_id'] = this.parentId;
    data['order'] = this.order;
    data['status'] = this.status;
    data['is_default'] = this.isDefault;
    data['description'] = this.description;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['category_translation'] = this.categoryTranslation;
    return data;
  }
}

class Country {
  int? id;
  String? name;
  Null? order;
  int? status;
  String? createdAt;
  String? updatedAt;
  Null? countryTranslation;

  Country(
      {this.id,
      this.name,
      this.order,
      this.status,
      this.createdAt,
      this.updatedAt,
      this.countryTranslation});

  Country.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    order = json['order'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    countryTranslation = json['country_translation'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['order'] = this.order;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['country_translation'] = this.countryTranslation;
    return data;
  }
}

class State {
  int? id;
  String? name;
  int? countryId;
  Null? order;
  int? status;
  String? createdAt;
  String? updatedAt;
  Null? stateTranslation;

  State(
      {this.id,
      this.name,
      this.countryId,
      this.order,
      this.status,
      this.createdAt,
      this.updatedAt,
      this.stateTranslation});

  State.fromJson(Map<String, dynamic> json) {
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

class City {
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

  City(
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

  City.fromJson(Map<String, dynamic> json) {
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

class Image {
  int? id;
  String? name;
  String? imagePath;
  String? createdAt;
  String? updatedAt;
  int? propertyId;

  Image(
      {this.id,
      this.name,
      this.imagePath,
      this.createdAt,
      this.updatedAt,
      this.propertyId});

  Image.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    imagePath = json['image_path'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    propertyId = json['property_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['image_path'] = this.imagePath;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['property_id'] = this.propertyId;
    return data;
  }
}
