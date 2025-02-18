class ToonModel {
  late String title;
  late String thumb;
  late String id;

  ToonModel.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    thumb = json['thumb'];
    id = json['id'];
  }
}
