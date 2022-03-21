class ScorePojo {
  bool? success;
  List<Data>? data;
  String? message;

  ScorePojo({this.success, this.data, this.message});

  ScorePojo.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
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
  int? matchTypeId;
  int? throws;
  int? matchId;
  int? leagueId;
  int? throw1;
  int? throw2;
  int? throw3;
  int? throw4;
  int? throw5;
  int? throw6;
  int? throw7;
  int? throw8;
  int? throw9;
  int? throw10;
  String? killshot;
  String? suddendeaththrow;
  String? createdAt;
  String? updatedAt;
  PlayerDetail? playerDetail;

  Data(
      {this.id,
        this.userId,
        this.matchTypeId,
        this.throws,
        this.matchId,
        this.leagueId,
        this.throw1,
        this.throw2,
        this.throw3,
        this.throw4,
        this.throw5,
        this.throw6,
        this.throw7,
        this.throw8,
        this.throw9,
        this.throw10,
        this.killshot,
        this.suddendeaththrow,
        this.createdAt,
        this.updatedAt,
        this.playerDetail});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    matchTypeId = json['match_type_id'];
    throws = json['throws'];
    matchId = json['match_id'];
    leagueId = json['league_id'];
    throw1 = json['throw1'];
    throw2 = json['throw2'];
    throw3 = json['throw3'];
    throw4 = json['throw4'];
    throw5 = json['throw5'];
    throw6 = json['throw6'];
    throw7 = json['throw7'];
    throw8 = json['throw8'];
    throw9 = json['throw9'];
    throw10 = json['throw10'];
    killshot = json['killshot'];
    suddendeaththrow = json['suddendeaththrow'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    playerDetail = json['player_detail'] != null
        ? new PlayerDetail.fromJson(json['player_detail'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['match_type_id'] = this.matchTypeId;
    data['throws'] = this.throws;
    data['match_id'] = this.matchId;
    data['league_id'] = this.leagueId;
    data['throw1'] = this.throw1;
    data['throw2'] = this.throw2;
    data['throw3'] = this.throw3;
    data['throw4'] = this.throw4;
    data['throw5'] = this.throw5;
    data['throw6'] = this.throw6;
    data['throw7'] = this.throw7;
    data['throw8'] = this.throw8;
    data['throw9'] = this.throw9;
    data['throw10'] = this.throw10;
    data['killshot'] = this.killshot;
    data['suddendeaththrow'] = this.suddendeaththrow;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.playerDetail != null) {
      data['player_detail'] = this.playerDetail!.toJson();
    }
    return data;
  }
}

class PlayerDetail {
  String? firstName;
  String? lastName;
  String? picture;
  Null? city;
  Null? state;
  String? address;
  int? teamplayScore;
  int? hatchetsScore;
  int? bigaxeScore;
  int? rankUser;
  String? accuracyUser;
  int? totalLeague;
  int? totalMatch;

  PlayerDetail(
      {this.firstName,
        this.lastName,
        this.picture,
        this.city,
        this.state,
        this.address,
        this.teamplayScore,
        this.hatchetsScore,
        this.bigaxeScore,
        this.rankUser,
        this.accuracyUser,
        this.totalLeague,
        this.totalMatch});

  PlayerDetail.fromJson(Map<String, dynamic> json) {
    firstName = json['first_name'];
    lastName = json['last_name'];
    picture = json['picture'];
    city = json['city'];
    state = json['state'];
    address = json['address'];
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
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['picture'] = this.picture;
    data['city'] = this.city;
    data['state'] = this.state;
    data['address'] = this.address;
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
