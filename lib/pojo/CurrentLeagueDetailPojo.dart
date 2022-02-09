class CurrentLeagueDetailPojo {
  bool? success;
  List<Matches>? matches;
  List<CurrentMatch>? currentMatch;
  List<Players>? players;
  LeagueDetails? leagueDetails;
  String? message;

  CurrentLeagueDetailPojo(
      {this.success,
        this.matches,
        this.currentMatch,
        this.players,
        this.leagueDetails,
        this.message});

  CurrentLeagueDetailPojo.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    if (json['matches'] != null) {
      matches = <Matches>[];
      json['matches'].forEach((v) {
        matches!.add(new Matches.fromJson(v));
      });
    }
    if (json['currentMatch'] != null) {
      currentMatch = <CurrentMatch>[];
      json['currentMatch'].forEach((v) {
        currentMatch!.add(new CurrentMatch.fromJson(v));
      });
    }
    if (json['players'] != null) {
      players = <Players>[];
      json['players'].forEach((v) {
        players!.add(new Players.fromJson(v));
      });
    }
    leagueDetails = json['leagueDetails'] != null
        ? new LeagueDetails.fromJson(json['leagueDetails'])
        : null;
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    if (this.matches != null) {
      data['matches'] = this.matches!.map((v) => v.toJson()).toList();
    }
    if (this.currentMatch != null) {
      data['currentMatch'] = this.currentMatch!.map((v) => v.toJson()).toList();
    }
    if (this.players != null) {
      data['players'] = this.players!.map((v) => v.toJson()).toList();
    }
    if (this.leagueDetails != null) {
      data['leagueDetails'] = this.leagueDetails!.toJson();
    }
    data['message'] = this.message;
    return data;
  }
}

class Matches {
  int? id;
  int? userId;
  int? leagueId;
  String? matchTitle;
  int? matchType;
  String? matchSchedule;
  String? description;
  Null? logo;
  Null? logoPath;
  List<String>? players1Ids;
  List<String>? players2Ids;
  int? players1;
  int? players2;
  int? status;
  String? createdAt;
  String? updatedAt;
  Null? player1WithScore;
  Null? player2WithScore;

  Matches(
      {this.id,
        this.userId,
        this.leagueId,
        this.matchTitle,
        this.matchType,
        this.matchSchedule,
        this.description,
        this.logo,
        this.logoPath,
        this.players1Ids,
        this.players2Ids,
        this.players1,
        this.players2,
        this.status,
        this.createdAt,
        this.updatedAt,
        this.player1WithScore,
        this.player2WithScore});

  Matches.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    leagueId = json['league_id'];
    matchTitle = json['match_title'];
    matchType = json['match_type'];
    matchSchedule = json['match_schedule'];
    description = json['description'];
    logo = json['logo'];
    logoPath = json['logo_path'];
    players1Ids = json['players1_ids'].cast<String>();
    players2Ids = json['players2_ids'].cast<String>();
    players1 = json['players1'];
    players2 = json['players2'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    player1WithScore = json['player1_with_score'];
    player2WithScore = json['player2_with_score'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['league_id'] = this.leagueId;
    data['match_title'] = this.matchTitle;
    data['match_type'] = this.matchType;
    data['match_schedule'] = this.matchSchedule;
    data['description'] = this.description;
    data['logo'] = this.logo;
    data['logo_path'] = this.logoPath;
    data['players1_ids'] = this.players1Ids;
    data['players2_ids'] = this.players2Ids;
    data['players1'] = this.players1;
    data['players2'] = this.players2;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['player1_with_score'] = this.player1WithScore;
    data['player2_with_score'] = this.player2WithScore;
    return data;
  }
}

class CurrentMatch {
  int? id;
  int? userId;
  int? leagueId;
  String? matchTitle;
  int? matchType;
  String? matchSchedule;
  String? description;
  Null? logo;
  Null? logoPath;
  List<String>? players1Ids;
  List<String>? players2Ids;
  int? players1;
  int? players2;
  int? status;
  String? createdAt;
  String? updatedAt;
  Player1WithScore? player1WithScore;
  Player1WithScore? player2WithScore;

  CurrentMatch(
      {this.id,
        this.userId,
        this.leagueId,
        this.matchTitle,
        this.matchType,
        this.matchSchedule,
        this.description,
        this.logo,
        this.logoPath,
        this.players1Ids,
        this.players2Ids,
        this.players1,
        this.players2,
        this.status,
        this.createdAt,
        this.updatedAt,
        this.player1WithScore,
        this.player2WithScore});

  CurrentMatch.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    leagueId = json['league_id'];
    matchTitle = json['match_title'];
    matchType = json['match_type'];
    matchSchedule = json['match_schedule'];
    description = json['description'];
    logo = json['logo'];
    logoPath = json['logo_path'];
    players1Ids = json['players1_ids'].cast<String>();
    players2Ids = json['players2_ids'].cast<String>();
    players1 = json['players1'];
    players2 = json['players2'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    player1WithScore = json['player1_with_score'] != null
        ? new Player1WithScore.fromJson(json['player1_with_score'])
        : null;
    player2WithScore = json['player2_with_score'] != null
        ? new Player1WithScore.fromJson(json['player2_with_score'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['league_id'] = this.leagueId;
    data['match_title'] = this.matchTitle;
    data['match_type'] = this.matchType;
    data['match_schedule'] = this.matchSchedule;
    data['description'] = this.description;
    data['logo'] = this.logo;
    data['logo_path'] = this.logoPath;
    data['players1_ids'] = this.players1Ids;
    data['players2_ids'] = this.players2Ids;
    data['players1'] = this.players1;
    data['players2'] = this.players2;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.player1WithScore != null) {
      data['player1_with_score'] = this.player1WithScore!.toJson();
    }
    if (this.player2WithScore != null) {
      data['player2_with_score'] = this.player2WithScore!.toJson();
    }
    return data;
  }
}

class Player1WithScore {
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
  String? createdAt;
  String? updatedAt;
  PlayerDetail? playerDetail;

  Player1WithScore(
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
        this.createdAt,
        this.updatedAt,
        this.playerDetail});

  Player1WithScore.fromJson(Map<String, dynamic> json) {
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
  Null? address;
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

class Players {
  int? id;
  String? firstName;
  String? lastName;
  String? email;
  String? phone;
  Null? city;
  Null? state;
  Null? zip;
  String? address;
  Null? about;
  String? picture;
  String? deviceToken;
  int? userType;
  Null? emailVerifiedAt;
  String? createdAt;
  String? updatedAt;
  Null? stripeId;
  Null? pmType;
  Null? pmLastFour;
  Null? trialEndsAt;
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

class LeagueDetails {
  int? id;
  int? userId;
  String? leagueTitle;
  String? addressLine1;
  String? addressLine2;
  String? city;
  Null? state;
  Null? zipcode;
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
  SeasonType? seasonType;

  LeagueDetails(
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
        this.updatedAt,
        this.seasonType});

  LeagueDetails.fromJson(Map<String, dynamic> json) {
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
    matchType = json['match_type'] != null
        ? new MatchType.fromJson(json['match_type'])
        : null;
    logo = json['logo'];
    logoPath = json['logo_path'];
    official = json['official'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    seasonType = json['season_type'] != null
        ? new SeasonType.fromJson(json['season_type'])
        : null;
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
    if (this.matchType != null) {
      data['match_type'] = this.matchType!.toJson();
    }
    data['logo'] = this.logo;
    data['logo_path'] = this.logoPath;
    data['official'] = this.official;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
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
  Null? description;
  String? createdAt;
  String? updatedAt;

  MatchType(
      {this.id,
        this.name,
        this.throw1,
        this.description,
        this.createdAt,
        this.updatedAt});

  MatchType.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    throw1 = json['throw1'];
    description = json['description'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['throw1'] = this.throw1;
    data['description'] = this.description;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class SeasonType {
  int? id;
  String? name;
  Null? description;
  String? createdAt;
  String? updatedAt;

  SeasonType(
      {this.id, this.name, this.description, this.createdAt, this.updatedAt});

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
