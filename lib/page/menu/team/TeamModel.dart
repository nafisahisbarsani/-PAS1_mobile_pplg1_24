class TeamModel {
  final String idTeam;
  final String strTeam;
  final String strLocation;
  final String strBadge;
  bool isLiked;


  TeamModel({required this.idTeam, required this.strTeam, required this.strLocation, required this.strBadge,this.isLiked = false});

  Map<String, dynamic> toMap() {
    return {
      'idTeam': idTeam,
      'strTeam': strTeam,
      'strLocation': strLocation,
      'strBadge' : strBadge,
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
      isLiked: map['isLiked'] == 1,
    );
  }


  factory TeamModel.fromJson(Map<String, dynamic> json) {
    return TeamModel(
      idTeam:json['idTeam'],
      strTeam: json['strTeam'],
      strLocation: json['strLocation'],
      strBadge: json['strBadge'],
    );
  }
}