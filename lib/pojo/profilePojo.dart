class Profile {
  bool? success;
  Data? data;
  String? message;

  Profile({this.success, this.data, this.message});

  Profile.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['message'] = this.message;
    return data;
  }
}

class Data {
  int? id;
  String? firstName;
  String? lastName;
  String? email;
  String? phone;
  String? city;
  String? state;
  String? zip;
  String? address;
  String? about;
  String? picture;
  String? deviceToken;
  int? isVenue;
  int? userType;
  String? createdAt;
  String? updatedAt;
  String? stripeId;
  String? pmType;
  String? pmLastFour;
  String? trialEndsAt;

  Data(
      {this.id,
        this.firstName,
        this.lastName,
        this.email,
        this.phone,
        this.city,
        this.state,
        this.zip,
        this.address,
        this.about,
        this.picture,
        this.deviceToken,
        this.isVenue,
        this.userType,
        this.createdAt,
        this.updatedAt,
        this.stripeId,
        this.pmType,
        this.pmLastFour,
        this.trialEndsAt});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    email = json['email'];
    phone = json['phone'];
    city = json['city'];
    state = json['state'];
    zip = json['zip'];
    address = json['address'];
    about = json['about'];
    picture = json['picture'];
    deviceToken = json['device_token'];
    isVenue = json['is_venue'];
    userType = json['user_type'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    stripeId = json['stripe_id'];
    pmType = json['pm_type'];
    pmLastFour = json['pm_last_four'];
    trialEndsAt = json['trial_ends_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['email'] = this.email;
    data['phone'] = this.phone;
    data['city'] = this.city;
    data['state'] = this.state;
    data['zip'] = this.zip;
    data['address'] = this.address;
    data['about'] = this.about;
    data['picture'] = this.picture;
    data['device_token'] = this.deviceToken;
    data['is_venue'] = this.isVenue;
    data['user_type'] = this.userType;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['stripe_id'] = this.stripeId;
    data['pm_type'] = this.pmType;
    data['pm_last_four'] = this.pmLastFour;
    data['trial_ends_at'] = this.trialEndsAt;
    return data;
  }
}
