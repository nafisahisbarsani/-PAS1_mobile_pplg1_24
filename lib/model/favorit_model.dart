class FavoritModel{
  int? id;
  String team;
  String description;
  String image;
  bool isCompleted;

  FavoritModel({
    this.id,
    required this.team,
    required this.description,
    required this.image,
    this.isCompleted = false
});
  Map<String, dynamic> toMap(){
    return {
      'id': id,
      'team': team,
      'description':'description',
      'isCompleted': isCompleted ? 1 : 0,
    };
  }
  factory FavoritModel.fromMap(Map<String, dynamic> map){
    return FavoritModel(
      id: map['id'],
      team: map['team'],
      description: map['description'],
      image: map['image'],
      isCompleted: map['isCompleted'] ==1,
    );
  }
}