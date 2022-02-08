class UpcomingLeaguePojo {
  bool? success;
  List<Data>? data;
  String? message;

  UpcomingLeaguePojo({this.success, this.data, this.message});

  UpcomingLeaguePojo.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) { data!.add(new Data.fromJson(v)); });
    }
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['message'] = this.message;
    return data;
  }
}

class Data {
  int? id;
  int? userId;
  String? leagueTitle;
  String? addressLine1;
  String? addressLine2;
  String? city;
  String? state;
  String? zipcode;
  String? startsFrom;
  String? description;
  String? endDate;
  String? season;
  MatchType? matchType;
  Null? logo;
  String? logoPath;
  int? official;
  int? status;
  String? createdAt;
  String? updatedAt;
  PostedBy? postedBy;
  SeasonType? seasonType;

  Data({this.id, this.userId, this.leagueTitle, this.addressLine1, this.addressLine2, this.city, this.state, this.zipcode, this.startsFrom, this.description, this.endDate, this.season, this.matchType, this.logo, this.logoPath, this.official, this.status, this.createdAt, this.updatedAt, this.postedBy, this.seasonType});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    leagueTitle = json['league_title'];
    addressLine1 = json['address_line1'];
    addressLine2 = json['address_line2'];
    city = json['city'];
    state = json['state'];
    zipcode = json['zipcode'];
    startsFrom = json['starts_from'];
    description = json['description'];
    endDate = json['end_date'];
    season = json['season'];
    matchType = json['match_type'] != null ?  MatchType.fromJson(json['match_type']) : null;
    logo = json['logo'];
    logoPath = json['logo_path'];
    official = json['official'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    postedBy = json['posted_by'] != null ?  PostedBy.fromJson(json['posted_by']) : null;
    seasonType = json['season_type'] != null ?  SeasonType.fromJson(json['season_type']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['league_title'] = this.leagueTitle;
    data['address_line1'] = this.addressLine1;
    data['address_line2'] = this.addressLine2;
    data['city'] = this.city;
    data['state'] = this.state;
    data['zipcode'] = this.zipcode;
    data['starts_from'] = this.startsFrom;
    data['description'] = this.description;
    data['end_date'] = this.endDate;
    data['season'] = this.season;
    if (this.matchType != null) {
      data['match_type'] = this.matchType!.toJson();
    }
    data['logo'] = this.logo;
    data['logo_path'] = this.logoPath;
    data['official'] = this.official;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.postedBy != null) {
      data['posted_by'] = this.postedBy!.toJson();
    }
    if (this.seasonType != null) {
      data['season_type'] = this.seasonType!.toJson();
    }
    return data;
  }
}

class MatchType {
  int? id;
  String? name;
  int? throw1;
  String? description;
  String? createdAt;
  String? updatedAt;

  MatchType({this.id, this.name, this.throw1, this.description, this.createdAt, this.updatedAt});

MatchType.fromJson(Map<String, dynamic> json) {
id = json['id'];
name = json['name'];
throw1 = json['throw'];
description = json['description'];
createdAt = json['created_at'];
updatedAt = json['updated_at'];
}

Map<String, dynamic> toJson() {
  final Map<String, dynamic> data = new Map<String, dynamic>();
  data['id'] = this.id;
  data['name'] = this.name;
  data['throw'] = this.throw1;
  data['description'] = this.description;
  data['created_at'] = this.createdAt;
  data['updated_at'] = this.updatedAt;
  return data;
}
}

class PostedBy {
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

  PostedBy({this.id, this.firstName, this.lastName, this.email, this.phone, this.city, this.state, this.zip, this.address, this.about, this.picture, this.deviceToken, this.isVenue, this.userType, this.createdAt, this.updatedAt, this.stripeId, this.pmType, this.pmLastFour, this.trialEndsAt});

  PostedBy.fromJson(Map<String, dynamic> json) {
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

class SeasonType {
  int? id;
  String? name;
  String? description;
  String? createdAt;
  String? updatedAt;

  SeasonType({this.id, this.name, this.description, this.createdAt, this.updatedAt});

  SeasonType.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['description'] = this.description;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
