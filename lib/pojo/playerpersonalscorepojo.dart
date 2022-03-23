import 'package:axe/pojo/user_info_pojo.dart';

class PersonalScorePOJO {
  bool? success;
  List<Hatchets>? hatchets;
  List<BigAxe>? bigAxe;
  List<TeamPlay>? teamPlay;
  ExtraInfo? extraInfo;
  UserInfoPojo? userInfo;
  String? message;

  PersonalScorePOJO({this.success, this.hatchets, this.bigAxe, this.teamPlay, this.extraInfo, this.message});

  PersonalScorePOJO.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    if (json['hatchets'] != null) {
      hatchets = <Hatchets>[];
      json['hatchets'].forEach((v) { hatchets!.add(Hatchets.fromJson(v)); });
    }
    if (json['bigAxe'] != null) {
      bigAxe = <BigAxe>[];
      json['bigAxe'].forEach((v) { bigAxe!.add(BigAxe.fromJson(v)); });
    }
    if (json['teamPlay'] != null) {
      teamPlay = <TeamPlay>[];
      json['teamPlay'].forEach((v) { teamPlay!.add(TeamPlay.fromJson(v)); });
    }
    extraInfo = json['extraInfo'] != null ? ExtraInfo.fromJson(json['extraInfo']) : null;
    userInfo = json['userInfo'] != null ? UserInfoPojo.fromJson(json['userInfo']) : null;
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['success'] = success;
    if (hatchets != null) {
      data['hatchets'] = hatchets!.map((v) => v.toJson()).toList();
    }
    if (bigAxe != null) {
      data['bigAxe'] = bigAxe!.map((v) => v.toJson()).toList();
    }
    if (teamPlay != null) {
      data['teamPlay'] = teamPlay!.map((v) => v.toJson()).toList();
    }
    if (extraInfo != null) {
      data['extraInfo'] = extraInfo!.toJson();
    }
    if (userInfo != null) {
      data['userInfo'] = userInfo!.toJson();
    }
    data['message'] = message;
    return data;
  }
}

class Hatchets {
  int? id;
  int? userId;
  int? matchTypeId;
  int? throw00;
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

  Hatchets({this.id, this.userId, this.matchTypeId, this.throw00, this.matchId, this.leagueId, this.throw1, this.throw2, this.throw3, this.throw4, this.throw5, this.throw6, this.throw7, this.throw8, this.throw9, this.throw10, this.killshot, this.suddendeaththrow, this.createdAt, this.updatedAt, this.playerDetail});

Hatchets.fromJson(Map<String, dynamic> json) {
id = json['id'];
userId = json['user_id'];
matchTypeId = json['match_type_id'];
throw00 = json['throw'];
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
playerDetail = json['player_detail'] != null ? PlayerDetail.fromJson(json['player_detail']) : null;
}

Map<String, dynamic> toJson() {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['id'] = id;
  data['user_id'] = userId;
  data['match_type_id'] = matchTypeId;
  data['throw'] = throw00;
  data['match_id'] = matchId;
  data['league_id'] = leagueId;
  data['throw1'] = throw1;
  data['throw2'] = throw2;
  data['throw3'] = throw3;
  data['throw4'] = throw4;
  data['throw5'] = throw5;
  data['throw6'] = throw6;
  data['throw7'] = throw7;
  data['throw8'] = throw8;
  data['throw9'] = throw9;
  data['throw10'] = throw10;
  data['killshot'] = killshot;
  data['suddendeaththrow'] = suddendeaththrow;
  data['created_at'] = createdAt;
  data['updated_at'] = updatedAt;
  if (playerDetail != null) {
  data['player_detail'] = playerDetail!.toJson();
  }
  return data;
}
}

class TeamPlay {
  int? id;
  int? userId;
  int? matchTypeId;
  int? throw00;
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

  TeamPlay({this.id, this.userId, this.matchTypeId, this.throw00, this.matchId, this.leagueId, this.throw1, this.throw2, this.throw3, this.throw4, this.throw5, this.throw6, this.throw7, this.throw8, this.throw9, this.throw10, this.killshot, this.suddendeaththrow, this.createdAt, this.updatedAt, this.playerDetail});

  TeamPlay.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    matchTypeId = json['match_type_id'];
    throw00 = json['throw'];
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
    playerDetail = json['player_detail'] != null ? PlayerDetail.fromJson(json['player_detail']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['user_id'] = userId;
    data['match_type_id'] = matchTypeId;
    data['throw'] = throw00;
    data['match_id'] = matchId;
    data['league_id'] = leagueId;
    data['throw1'] = throw1;
    data['throw2'] = throw2;
    data['throw3'] = throw3;
    data['throw4'] = throw4;
    data['throw5'] = throw5;
    data['throw6'] = throw6;
    data['throw7'] = throw7;
    data['throw8'] = throw8;
    data['throw9'] = throw9;
    data['throw10'] = throw10;
    data['killshot'] = killshot;
    data['suddendeaththrow'] = suddendeaththrow;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    if (playerDetail != null) {
      data['player_detail'] = playerDetail!.toJson();
    }
    return data;
  }
}

class BigAxe {
  int? id;
  int? userId;
  int? matchTypeId;
  int? throw00;
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

  BigAxe({this.id, this.userId, this.matchTypeId, this.throw00, this.matchId, this.leagueId, this.throw1, this.throw2, this.throw3, this.throw4, this.throw5, this.throw6, this.throw7, this.throw8, this.throw9, this.throw10, this.killshot, this.suddendeaththrow, this.createdAt, this.updatedAt, this.playerDetail});

  BigAxe.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    matchTypeId = json['match_type_id'];
    throw00 = json['throw'];
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
    playerDetail = json['player_detail'] != null ? PlayerDetail.fromJson(json['player_detail']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['user_id'] = userId;
    data['match_type_id'] = matchTypeId;
    data['throw'] = throw00;
    data['match_id'] = matchId;
    data['league_id'] = leagueId;
    data['throw1'] = throw1;
    data['throw2'] = throw2;
    data['throw3'] = throw3;
    data['throw4'] = throw4;
    data['throw5'] = throw5;
    data['throw6'] = throw6;
    data['throw7'] = throw7;
    data['throw8'] = throw8;
    data['throw9'] = throw9;
    data['throw10'] = throw10;
    data['killshot'] = killshot;
    data['suddendeaththrow'] = suddendeaththrow;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    if (playerDetail != null) {
      data['player_detail'] = playerDetail!.toJson();
    }
    return data;
  }
}

class PlayerDetail {
  String? firstName;
  String? lastName;
  String? picture;
  String? city;
  String? state;
  String? address;
  int? teamplayScore;
  int? hatchetsScore;
  int? bigaxeScore;
  int? rankUser;
  String? accuracyUser;
  int? totalLeague;
  int? totalMatch;

  PlayerDetail({this.firstName, this.lastName, this.picture, this.city, this.state, this.address, this.teamplayScore, this.hatchetsScore, this.bigaxeScore, this.rankUser, this.accuracyUser, this.totalLeague, this.totalMatch});

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
    final Map<String, dynamic> data = <String, dynamic>{};
    data['first_name'] = firstName;
    data['last_name'] = lastName;
    data['picture'] = picture;
    data['city'] = city;
    data['state'] = state;
    data['address'] = address;
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

class ExtraInfo {
  int? matchPlayed;
  int? won;
  int? loss;
  int? overallPoints;

  ExtraInfo({this.matchPlayed, this.won, this.loss, this.overallPoints});

  ExtraInfo.fromJson(Map<String, dynamic> json) {
    matchPlayed = json['match_played'];
    won = json['won'];
    loss = json['loss'];
    overallPoints = json['overall_points'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['match_played'] = matchPlayed;
    data['won'] = won;
    data['loss'] = loss;
    data['overall_points'] = overallPoints;
    return data;
  }
}
