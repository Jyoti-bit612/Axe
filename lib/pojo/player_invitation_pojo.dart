// To parse this JSON data, do
//
//     final playerInvitationPojo = playerInvitationPojoFromJson(jsonString);

import 'dart:convert';

PlayerInvitationPojo playerInvitationPojoFromJson(String str) => PlayerInvitationPojo.fromJson(json.decode(str));

String playerInvitationPojoToJson(PlayerInvitationPojo data) => json.encode(data.toJson());

class PlayerInvitationPojo {
  PlayerInvitationPojo({
    this.success,
    this.invitationData,
    this.message,
  });

  bool? success;
  List<InvitationDatum>? invitationData;
  String? message;

  factory PlayerInvitationPojo.fromJson(Map<String, dynamic> json) => PlayerInvitationPojo(
    success: json["success"],
    invitationData: json["invitationData"]==null?[]:List<InvitationDatum>.from(json["invitationData"].map((x) => InvitationDatum.fromJson(x))),
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "invitationData": List<dynamic>.from(invitationData!.map((x) => x.toJson())),
    "message": message,
  };
}

class InvitationDatum {
  InvitationDatum({
    this.id,
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
    this.playersRejectInvitations,
    this.venuesRejectInvitations,
    this.invitationsPlayersby,
    this.status,
    this.createdAt,
    this.updatedAt,
    this.leagueDetails,
    this.postedBy,
  });

  int? id;
  int? userId;
  int? leagueId;
  String? matchTitle;
  MatchType? matchType;
  DateTime? matchSchedule;
  String? description;
  dynamic logo;
  dynamic logoPath;
  List<String>? players1Ids;
  List<String>? players2Ids;
  int? players1;
  int? players2;
  List<String>? playersRejectInvitations;
  dynamic venuesRejectInvitations;
  dynamic invitationsPlayersby;
  int? status;
  DateTime? createdAt;
  DateTime? updatedAt;
  LeagueDetails? leagueDetails;
  PostedBy? postedBy;

  factory InvitationDatum.fromJson(Map<String, dynamic> json) => InvitationDatum(
    id: json["id"],
    userId: json["user_id"],
    leagueId: json["league_id"],
    matchTitle: json["match_title"],
    matchType: MatchType.fromJson(json["match_type"]),
    matchSchedule: DateTime.parse(json["match_schedule"]),
    description: json["description"],
    logo: json["logo"],
    logoPath: json["logo_path"],
    players1Ids: List<String>.from(json["players1_ids"].map((x) => x)),
    players2Ids: List<String>.from(json["players2_ids"].map((x) => x)),
    players1: json["players1"],
    players2: json["players2"],
    playersRejectInvitations: json["players_reject_invitations"] == null ? null : List<String>.from(json["players_reject_invitations"].map((x) => x)),
    venuesRejectInvitations: json["venues_reject_invitations"],
    invitationsPlayersby: json["invitations_playersby"],
    status: json["status"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    leagueDetails: LeagueDetails.fromJson(json["league_details"]),
    postedBy: PostedBy.fromJson(json["posted_by"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "user_id": userId,
    "league_id": leagueId,
    "match_title": matchTitle,
    "match_type": matchType!.toJson(),
    "match_schedule": matchSchedule!.toIso8601String(),
    "description": description,
    "logo": logo,
    "logo_path": logoPath,
    "players1_ids": List<dynamic>.from(players1Ids!.map((x) => x)),
    "players2_ids": List<dynamic>.from(players2Ids!.map((x) => x)),
    "players1": players1,
    "players2": players2,
    "players_reject_invitations": playersRejectInvitations == null ? null : List<dynamic>.from(playersRejectInvitations!.map((x) => x)),
    "venues_reject_invitations": venuesRejectInvitations,
    "invitations_playersby": invitationsPlayersby,
    "status": status,
    "created_at": createdAt!.toIso8601String(),
    "updated_at": updatedAt!.toIso8601String(),
    "league_details": leagueDetails!.toJson(),
    "posted_by": postedBy!.toJson(),
  };
}

class LeagueDetails {
  LeagueDetails({
    this.id,
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
  });

  int? id;
  int? userId;
  String? leagueTitle;
  String? addressLine1;
  String? addressLine2;
  String? city;
  String? state;
  dynamic zipcode;
  DateTime? startsFrom;
  String? description;
  DateTime? endDate;
  String? season;
  int? matchType;
  dynamic logo;
  dynamic logoPath;
  int? official;
  int? status;
  DateTime? createdAt;
  DateTime? updatedAt;

  factory LeagueDetails.fromJson(Map<String, dynamic> json) => LeagueDetails(
    id: json["id"],
    userId: json["user_id"],
    leagueTitle: json["league_title"],
    addressLine1: json["address_line1"],
    addressLine2: json["address_line2"],
    city: json["city"],
    state: json["state"],
    zipcode: json["zipcode"],
    startsFrom: DateTime.parse(json["starts_from"]),
    description: json["description"],
    endDate: DateTime.parse(json["end_date"]),
    season: json["season"],
    matchType: json["match_type"],
    logo: json["logo"],
    logoPath: json["logo_path"],
    official: json["official"],
    status: json["status"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "user_id": userId,
    "league_title": leagueTitle,
    "address_line1": addressLine1,
    "address_line2": addressLine2,
    "city": city,
    "state": state,
    "zipcode": zipcode,
    "starts_from": startsFrom!.toIso8601String(),
    "description": description,
    "end_date": endDate!.toIso8601String(),
    "season": season,
    "match_type": matchType,
    "logo": logo,
    "logo_path": logoPath,
    "official": official,
    "status": status,
    "created_at": createdAt!.toIso8601String(),
    "updated_at": updatedAt!.toIso8601String(),
  };
}

class MatchType {
  MatchType({
    this.id,
    this.name,
    this.matchTypeThrow,
    this.description,
    this.createdAt,
    this.updatedAt,
  });

  int? id;
  String? name;
  int? matchTypeThrow;
  dynamic description;
  DateTime? createdAt;
  DateTime? updatedAt;

  factory MatchType.fromJson(Map<String, dynamic> json) => MatchType(
    id: json["id"],
    name: json["name"],
    matchTypeThrow: json["throw"],
    description: json["description"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "throw": matchTypeThrow,
    "description": description,
    "created_at": createdAt!.toIso8601String(),
    "updated_at": updatedAt!.toIso8601String(),
  };
}

class PostedBy {
  PostedBy({
    this.id,
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
    this.trialEndsAt,
  });

  int? id;
  String? firstName;
  String? lastName;
  String? email;
  String? phone;
  String? city;
  String? state;
  dynamic zip;
  String? address;
  String? about;
  String? picture;
  String? deviceToken;
  int? isVenue;
  int? userType;
  DateTime? createdAt;
  DateTime? updatedAt;
  dynamic stripeId;
  dynamic pmType;
  dynamic pmLastFour;
  dynamic trialEndsAt;

  factory PostedBy.fromJson(Map<String, dynamic> json) => PostedBy(
    id: json["id"],
    firstName: json["first_name"],
    lastName: json["last_name"],
    email: json["email"],
    phone: json["phone"],
    city: json["city"],
    state: json["state"],
    zip: json["zip"],
    address: json["address"],
    about: json["about"],
    picture: json["picture"],
    deviceToken: json["device_token"],
    isVenue: json["is_venue"],
    userType: json["user_type"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    stripeId: json["stripe_id"],
    pmType: json["pm_type"],
    pmLastFour: json["pm_last_four"],
    trialEndsAt: json["trial_ends_at"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "first_name": firstName,
    "last_name": lastName,
    "email": email,
    "phone": phone,
    "city": city,
    "state": state,
    "zip": zip,
    "address": address,
    "about": about ,
    "picture": picture,
    "device_token": deviceToken,
    "is_venue": isVenue,
    "user_type": userType,
    "created_at": createdAt!.toIso8601String(),
    "updated_at": updatedAt!.toIso8601String(),
    "stripe_id": stripeId,
    "pm_type": pmType,
    "pm_last_four": pmLastFour,
    "trial_ends_at": trialEndsAt,
  };
}
