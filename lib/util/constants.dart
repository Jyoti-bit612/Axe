class Constant{

  //User types
  static const userPlayer="2";
  static const userVenue="1";

  //InviteList type

  static const newInvite = 1;
  static const acceptedInvite = 2;
  static const rejectedInvite = 3;
  static const expiredInvite = 4;

  static const String baseUrl="http://112.196.38.115:4171/axethrowing/";
  static const String imageUrl="http://112.196.38.115:4171/axethrowing";
  static const google_map_key="";

  static const String Device_Token = "firebaseToken";
  static  String deviceToken = "";
  static  String email = "";

  static const String signup="api/register";
  static const String login="api/login";
  static const String forgotPassword = "api/forgetpassword";

  static const String updateScore="api/venues/updateMatchScores";

  static const String change_password_user="api/player/change-password";
  static const String change_password_venue="api/venues/change-password";

  static const String logout="api/venues/logout";
  static const String playerLogout="api/player/logout";

  static const String create_league="api/venues/create-league";

  static const String update_venue_profile="api/venues/updateProfile";
  static const String update_player_profile="api/player/updateProfile";

  static const String get_venue_profile="api/venues/getProfile";
  static const String getPlayerProfile="api/player/getProfile";

  static const String create_match="api/venues/create-match";
  static const String get_league="api/venues/getleague";
  static const String get_match="api/venues/getmatch";
  static const String get_Season="api/venues/getseason";
  static const String get_MatchType="api/venues/getmatchtype";

  static const String get_upcomingLeague="api/venues/upcomingleague";
  static const String playerUpcomingLeague="api/player/upcomingleague";

  static const String get_prevoiusLeague="api/venues/pastleague";
  static const String playerPrevoiusLeague="api/player/pastleague";

  static const String get_prevoiusLeagueDetail="api/venues/getpastleaguedetail";
  static const String playerPrevoiusLeagueDetail="api/player/getpastleaguedetail";

  static const String get_UpcomingLeagueDetail="api/venues/upcomingleaguedetail";
  static const String playerUpcomingLeagueDetail="api/player/upcomingleaguedetail";

  static const String get_topPlayer="api/venues/gettopplayers";
  static const String playerSideTopPlayer="api/player/gettopplayers";

  static const String get_Player="api/venues/getplayers";
  static const String get_score_match="api/venues/getmatchscores";

  static const String get_current_league="api/venues/getCurrentLeague";
  static const String playerCurrentLeague="api/player/getCurrentLeague";

  static const String get_current_league_detail="api/venues/getCurrentLeagueDetail";
  static const String playerCurrentLeagueDetail="api/player/getCurrentLeagueDetail";

  static const String inviteByVenue = "api/venues/sendinvitation";
  static const String cancelInviteByVenue = "api/venues/cancelinvitation";

  static const String playerNewInviteList = "api/player/getplayerinvitation";
  static const String playerRejectInviteList = "api/player/getrejectinvitation";
  static const String playerAcceptedInviteList = "api/player/getacceptedinvitationlist";
  static const String playerExpiredInviteList = "api/player/getexpiredinvitation";
  static const String playerAcceptInvite = "api/player/inviteAccept";
  static const String playerRejectInvite = "api/player/cancelinvitation";
  static const String getMatchList = "api/player/getmatchesbyleagueId";
  static const String getPlayerScore="api/player/getmatchscores";

  //key for sharedPrefrence
  static const String LoginType="login_type";
  static const String AccessToken="acccess_token"; // api authorization token
  static const String firstname="firstName";
  static const String lastname="lastName";
}

