class PlayerListPojo {
  bool? success;
  List<Data>? data;
  String? message;

  PlayerListPojo({this.success, this.data, this.message});

  PlayerListPojo.fromJson(Map<String, dynamic> json) {
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
  String? firstName;
  String? lastName;
  String? email;
  String? address;
  String? picture;
  String? phone;
  String? city;
  String? state;
  String? about;
  int? teamplayScore;
  int? hatchetsScore;
  int? bigaxeScore;
  int? invitation;

  Data(
      {this.id,
        this.firstName,
        this.lastName,
        this.email,
        this.address,
        this.picture,
        this.phone,
        this.city,
        this.state,
        this.about,
        this.teamplayScore,
        this.hatchetsScore,
        this.invitation,
        this.bigaxeScore});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    email = json['email'];
    address = json['address'];
    picture = json['picture'];
    phone = json['phone'];
    city = json['city'];
    state = json['state'];
    about = json['about'];
    teamplayScore = json['teamplay_score'];
    hatchetsScore = json['hatchets_score'];
    invitation = json['invitation'];
    bigaxeScore = json['bigaxe_score'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['email'] = this.email;
    data['address'] = this.address;
    data['picture'] = this.picture;
    data['phone'] = this.phone;
    data['city'] = this.city;
    data['state'] = this.state;
    data['about'] = this.about;
    data['teamplay_score'] = this.teamplayScore;
    data['hatchets_score'] = this.hatchetsScore;
    data['invitation'] = this.invitation;
    data['bigaxe_score'] = this.bigaxeScore;
    return data;
  }
}
