class OtpModel {
  String? message;
  User? user;

  OtpModel({this.message, this.user});

  OtpModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    return data;
  }
}

class User {
  int? id;
  String? fName;
  String? lName;
  Null? username;
  String? type;
  int? isApproved;
  Null? email;
  String? mobile;
  Null? emailVerifiedAt;
  String? createdAt;
  String? updatedAt;
  Null? title;
  Null? companyName;
  Null? image;
  Null? description;
  Null? skype;
  Null? fb;
  Null? twitter;
  Null? instagram;
  Null? status;
  Null? mobileOffice;
  Null? otp;

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
      this.otp});

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
    return data;
  }
}
