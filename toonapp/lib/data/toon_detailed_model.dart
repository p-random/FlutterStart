class ToonDetailedModel {
  final String title, about, genre, age, thumb;

  ToonDetailedModel.fromJson(Map<String, dynamic> json)
      : title = json["title"],
        about = json["about"],
        genre = json["genre"],
        age = json["age"],
        thumb = json["thumb"]; // {}를 안 쓰고 :로 하니까 아무 에러도 안뜨네?
}
