class UpcomingLeagueDetail {
  bool? success;
  List<Players>? players;
  Leaguedata? leaguedata;
  String? message;

  UpcomingLeagueDetail(
      {this.success, this.players, this.leaguedata, this.message});

  UpcomingLeagueDetail.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    if (json['players'] != null) {
      players = <Players>[];
      json['players'].forEach((v) {
        players!.add( Players.fromJson(v));
      });
    }
    leaguedata = json['leaguedata'] != null
        ?  Leaguedata.fromJson(json['leaguedata'])
        : null;
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    if (this.players != null) {
      data['players'] = this.players!.map((v) => v.toJson()).toList();
    }
    if (this.leaguedata != null) {
      data['leaguedata'] = this.leaguedata!.toJson();
    }
    data['message'] = this.message;
    return data;
  }
}

class Players {
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
  String? invited;
  int? teamplayScore;
  int? hatchetsScore;
  int? bigaxeScore;
  int? rankUser;
  String? accuracyUser;
  int? totalLeague;
  int? totalMatch;

  Players(
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
        this.userType,
        this.emailVerifiedAt,
        this.createdAt,
        this.updatedAt,
        this.stripeId,
        this.pmType,
        this.pmLastFour,
        this.trialEndsAt,
        this.invited,
        this.teamplayScore,
        this.hatchetsScore,
        this.bigaxeScore,
        this.rankUser,
        this.accuracyUser,
        this.totalLeague,
        this.totalMatch});

  Players.fromJson(Map<String, dynamic> json) {
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
    userType = json['user_type'];
    emailVerifiedAt = json['email_verified_at'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    stripeId = json['stripe_id'];
    pmType = json['pm_type'];
    pmLastFour = json['pm_last_four'];
    trialEndsAt = json['trial_ends_at'];
    invited = json['invited'];
    teamplayScore = json['teamplay_score'];
    hatchetsScore = json['hatchets_score'];
    bigaxeScore = json['bigaxe_score'];
    rankUser = json['rank_user'];
    accuracyUser = json['accuracy_user'];
    totalLeague = json['total_league'];
    totalMatch = json['total_match'];
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
    data['user_type'] = this.userType;
    data['email_verified_at'] = this.emailVerifiedAt;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['stripe_id'] = this.stripeId;
    data['pm_type'] = this.pmType;
    data['pm_last_four'] = this.pmLastFour;
    data['trial_ends_at'] = this.trialEndsAt;
    data['invited'] = this.invited;
    data['teamplay_score'] = this.teamplayScore;
    data['hatchets_score'] = this.hatchetsScore;
    data['bigaxe_score'] = this.bigaxeScore;
    data['rank_user'] = this.rankUser;
    data['accuracy_user'] = this.accuracyUser;
    data['total_league'] = this.totalLeague;
    data['total_match'] = this.totalMatch;
    return data;
  }
}

class Leaguedata {
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
  int? matchType;
  String? logo;
  String? logoPath;
  int? official;
  int? status;
  String? createdAt;
  String? updatedAt;

  Leaguedata(
      {this.id,
        this.userId,
        this.leagueTitle,
        this.addressLine1,
        this.addressLine2,
        this.city,
        this.state,
        this.zipcode,
        this.startsFrom,
        this.description,
        this.endDate,
        this.season,
        this.matchType,
        this.logo,
        this.logoPath,
        this.official,
        this.status,
        this.createdAt,
        this.updatedAt});

  Leaguedata.fromJson(Map<String, dynamic> json) {
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
    matchType = json['match_type'];
    logo = json['logo'];
    logoPath = json['logo_path'];
    official = json['official'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
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
    data['match_type'] = this.matchType;
    data['logo'] = this.logo;
    data['logo_path'] = this.logoPath;
    data['official'] = this.official;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
