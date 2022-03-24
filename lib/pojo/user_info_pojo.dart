class UserInfoPojo {
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
  int? userType;
  String? emailVerifiedAt;
  String? createdAt;
  String? updatedAt;
  String? stripeId;
  String? pmType;
  String? pmLastFour;
  String? trialEndsAt;
  int? teamplayScore;
  int? hatchetsScore;
  int? bigaxeScore;
  int? rankUser;
  String? accuracyUser;
  int? totalLeague;
  int? totalMatch;

  UserInfoPojo({this.id, this.firstName, this.lastName, this.email, this.phone, this.city, this.state, this.zip, this.address, this.about, this.picture, this.deviceToken, this.userType, this.emailVerifiedAt, this.createdAt, this.updatedAt, this.stripeId, this.pmType, this.pmLastFour, this.trialEndsAt, this.teamplayScore, this.hatchetsScore, this.bigaxeScore, this.rankUser, this.accuracyUser, this.totalLeague, this.totalMatch});

  UserInfoPojo.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    email = json['email'];
    phone = json['phone']??"Not provided";
    city = json['city']??"Not provided";
    state = json['state']??"Not provided";
    zip = json['zip'];
    address = json['address'];
    about = json['about'];
    picture = json['picture'];
    deviceToken = json['device_token'];
    userType = json['user_type'];
    emailVerifiedAt = json['email_verified_at'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    stripeId = json['stripe_id'];
    pmType = json['pm_type'];
    pmLastFour = json['pm_last_four'];
    trialEndsAt = json['trial_ends_at'];
    teamplayScore = json['teamplay_score'];
    hatchetsScore = json['hatchets_score'];
    bigaxeScore = json['bigaxe_score'];
    rankUser = json['rank_user'];
    accuracyUser = json['accuracy_user'];
    totalLeague = json['total_league'];
    totalMatch = json['total_match'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['first_name'] = firstName;
    data['last_name'] = lastName;
    data['email'] = email;
    data['phone'] = phone;
    data['city'] = city;
    data['state'] = state;
    data['zip'] = zip;
    data['address'] = address;
    data['about'] = about;
    data['picture'] = picture;
    data['device_token'] = deviceToken;
    data['user_type'] = userType;
    data['email_verified_at'] = emailVerifiedAt;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['stripe_id'] = stripeId;
    data['pm_type'] = pmType;
    data['pm_last_four'] = pmLastFour;
    data['trial_ends_at'] = trialEndsAt;
    data['teamplay_score'] = teamplayScore;
    data['hatchets_score'] = hatchetsScore;
    data['bigaxe_score'] = bigaxeScore;
    data['rank_user'] = rankUser;
    data['accuracy_user'] = accuracyUser;
    data['total_league'] = totalLeague;
    data['total_match'] = totalMatch;
    return data;
  }
}