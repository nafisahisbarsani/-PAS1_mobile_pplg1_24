class TeamModel {
  final String idTeam;
  final String strTeam;
  final String strLocation;
  final String strBadge;
  final String strDescriptionEN;
  bool isLiked;

  TeamModel({
    required this.idTeam,
    required this.strTeam,
    required this.strLocation,
    required this.strBadge,
    required this.strDescriptionEN,
    this.isLiked = false,
  });

  Map<String, dynamic> toMap() {
    return {
      'idTeam': idTeam,
      'strTeam': strTeam,
      'strLocation': strLocation,
      'strBadge': strBadge,
      'strDescriptionEN': strDescriptionEN,
      'isLiked': isLiked ? 1 : 0,
    };
  }

  // Convert a Map object into a Task object
  // dari database ke UI dalam bentuk object
  factory TeamModel.fromMap(Map<String, dynamic> map) {
    return TeamModel(
      idTeam: map['idTeam'],
      strTeam: map['strTeam'],
      strLocation: map['strLocation'],
      strBadge: map['strBadge'],
      strDescriptionEN: map['strDescriptionEN'],
      isLiked: map['isLiked'] == 1,
    );
  }

  factory TeamModel.fromJson(Map<String, dynamic> json) {
    return TeamModel(
      idTeam: json['idTeam'],
      strTeam: json['strTeam'],
      strLocation: json['strLocation'],
      strBadge: json['strBadge'],
      strDescriptionEN: json['strDescriptionEN'],
    );
  }
}
