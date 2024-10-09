class Otpvarification {
  String? status;
  OtpvarificationModel? data;
  String? message;

  Otpvarification({this.status, this.data, this.message});

  Otpvarification.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    data = json['data'] != null ? new OtpvarificationModel.fromJson(json['data']) : null;
    message = json['message'];
  }

  Map<dynamic, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['message'] = this.message;
    return data;
  }
}

class OtpvarificationModel {
  int? id;
  String? firstName;
  String? lastName;
  String? fullName;
  String? email;
  String? phone;
  String? countryCode;
  Null? creditAmount;
  Null? membershipId;
  Null? membershipCardName;
  String? membership;
  String? token;

  OtpvarificationModel(
      {this.id,
        this.firstName,
        this.lastName,
        this.fullName,
        this.email,
        this.phone,
        this.countryCode,
        this.creditAmount,
        this.membershipId,
        this.membershipCardName,
        this.membership,
        this.token});

  OtpvarificationModel.fromJson(Map<dynamic, dynamic> json) {
    id = json['id'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    fullName = json['full_name'];
    email = json['email'];
    phone = json['phone'];
    countryCode = json['country_code'];
    creditAmount = json['credit_amount'];
    membershipId = json['membership_id'];
    membershipCardName = json['membership_card_name'];
    membership = json['membership'];
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['full_name'] = this.fullName;
    data['email'] = this.email;
    data['phone'] = this.phone;
    data['country_code'] = this.countryCode;
    data['credit_amount'] = this.creditAmount;
    data['membership_id'] = this.membershipId;
    data['membership_card_name'] = this.membershipCardName;
    data['membership'] = this.membership;
    data['token'] = this.token;
    return data;
  }
}
