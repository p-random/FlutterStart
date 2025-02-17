import 'package:flutter/material.dart';
import 'package:toonapp/api/GetData.dart';
import 'package:toonapp/data/ToonModel.dart';

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
                  Expanded(child: makeList(snapshot)),
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
      itemBuilder: (context, index) {
        final webtoon = snapshot.data![index];
        return Column(
          children: [
            Image.network(
              webtoon.thumb,
            ),
            SizedBox(
              height: 10,
            ),
            Text(webtoon.title),
          ],
        );
      },
      separatorBuilder: (context, index) {
        return SizedBox(
          width: 20,
        );
      },
      itemCount: snapshot.data!.length,
    );
  }
}


//flutter run -d chrome --web-renderer html --hot  r누르면 재시작 
