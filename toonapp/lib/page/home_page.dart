import 'package:flutter/material.dart';
import 'package:toonapp/api/getdata.dart';
import 'package:toonapp/data/toon_model.dart';
import 'webtoon.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final Future<List<ToonModel>> webtoons = ApiService().getTodayToons();

    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          elevation: 4,
          backgroundColor: Colors.green,
          title: Text(
            "webtoons",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
          ),
        ),
        body: FutureBuilder(
          future: webtoons,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Column(
                children: [
                  SizedBox(
                    height: 50,
                  ),
                  Expanded(
                      child: makeList(
                          snapshot)), //컬럼 높이가 무한인데 리스트뷰도 그에 따라 무한이 되니까 에러난거야 expanded로 해결
                ],
              );
            } else {
              return Center(child: CircularProgressIndicator());
            }
          },
        ));
  }

  ListView makeList(AsyncSnapshot<List<ToonModel>> snapshot) {
    return ListView.separated(
      padding: EdgeInsets.all(20),
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) {
        final webtoon = snapshot.data![index];
        return Webtoon(
          title: webtoon.title,
          thumb: webtoon.thumb,
          id: webtoon.id,
        );
      },
      separatorBuilder: (BuildContext context, int index) => const SizedBox(
        width: 40, // 이 이상 더 안 가까워지는 듯이 아니라 container height를 없애니까 해결됨
      ),
      itemCount: snapshot.data!.length,
    );
  }
}




//flutter run -d chrome --web-renderer html --hot  r누르면 재시작 
