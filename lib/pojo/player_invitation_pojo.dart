class PlayerInvitationPojo {
  bool? success;
  List<InvitationData>? invitationData;
  String? message;

  PlayerInvitationPojo({this.success, this.invitationData, this.message});

  PlayerInvitationPojo.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    if (json['invitationData'] != null) {
      invitationData = <InvitationData>[];
      json['invitationData'].forEach((v) {
        invitationData!.add(InvitationData.fromJson(v));
      });
    }
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['success'] = success;
    if (invitationData != null) {
      data['invitationData'] =
          invitationData!.map((v) => v.toJson()).toList();
    }
    data['message'] = message;
    return data;
  }
}

class InvitationData {
  int? id;
  int? userId;
  int? leagueId;
  String? matchTitle;
  int? matchType;
  String? matchSchedule;
  String? description;
  String? logo;
  String? logoPath;
  List<String>? players1Ids;
  List<String>? players2Ids;
  int? players1;
  int? players2;
  int? status;
  String? createdAt;
  String? updatedAt;

  InvitationData(
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
        this.updatedAt});

  InvitationData.fromJson(Map<String, dynamic> json) {
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
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['user_id'] = userId;
    data['league_id'] = leagueId;
    data['match_title'] = matchTitle;
    data['match_type'] = matchType;
    data['match_schedule'] = matchSchedule;
    data['description'] = description;
    data['logo'] = logo;
    data['logo_path'] = logoPath;
    data['players1_ids'] = players1Ids;
    data['players2_ids'] = players2Ids;
    data['players1'] = players1;
    data['players2'] = players2;
    data['status'] = status;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}
