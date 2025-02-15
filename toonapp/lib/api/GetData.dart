import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:toonapp/data/ToonModel.dart';

class ApiService {
  String url = "https://webtoon-crawler.nomadcoders.workers.dev";
  String today = "today";

  Future<List<ToonModel>> getTodayToons() async {
    final uri = Uri.parse('$url/$today');
    final response = await http.get(uri);
    final List<ToonModel> toonModelList = [];
    if (response.statusCode == 200) {
      final List<dynamic> toons =
          jsonDecode(response.body); //플러터는 자동으로 타입 할당해주는데 가독성을 위해서 타입 명시
      for (final toon in toons) {
        toonModelList.add(ToonModel.fromJson(toon));
      }
    } else {
      throw Error();
    }
    return toonModelList;
  }
}
