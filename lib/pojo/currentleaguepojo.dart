class CurrentLeaguePojo {
  bool? success;
  List<Currentleague>? currentleague;
  String? message;

  CurrentLeaguePojo({this.success, this.currentleague, this.message});

  CurrentLeaguePojo.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    if (json['currentleague'] != null) {
      currentleague = <Currentleague>[];
      json['currentleague'].forEach((v) {
        currentleague!.add(Currentleague.fromJson(v));
      });
    }
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['success'] = this.success;
    if (this.currentleague != null) {
      data['currentleague'] =
          this.currentleague!.map((v) => v.toJson()).toList();
    }
    data['message'] = this.message;
    return data;
  }
}

class Currentleague {
  int? id;
  int? userId;
  String? leagueTitle;
  String? addressLine1;
  String? addressLine2;
  String? city;
  String? state;
  Null? zipcode;
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

  Currentleague(
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

  Currentleague.fromJson(Map<String, dynamic> json) {
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
