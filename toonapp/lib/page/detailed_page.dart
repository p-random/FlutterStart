import 'package:flutter/material.dart';
import 'package:toonapp/api/getdata.dart';
import 'package:toonapp/data/toon_detailed_model.dart';
import 'package:toonapp/data/toon_episode.dart';

class DetailedPage extends StatefulWidget {
  final String title;
  final dynamic thumb;
  final dynamic id;

  const DetailedPage({
    super.key,
    required this.title,
    required this.thumb,
    required this.id,
  });

  @override
  State<DetailedPage> createState() => _DetailedPageState();
}

class _DetailedPageState extends State<DetailedPage> {
  late Future<ToonDetailedModel> toonDetailedModel;
  late Future<List<ToonEpisode>> toonEpisodes;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    toonDetailedModel = ApiService().getDetailedById(widget.id);
    toonEpisodes = ApiService().getEpisodesById(widget.id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 4,
        backgroundColor: Colors.green,
        title: Text(
          widget.title,
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
        ),
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: 50,
            ),
            Container(
              clipBehavior: Clip.hardEdge,
              width: 200,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    blurRadius: 10,
                    color: Colors.black.withOpacity(0.5),
                    offset: Offset(10, 10),
                  ),
                ],
              ),
              child: Hero(
                tag: widget.id,
                child: Image.network(
                  widget.thumb,
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            FutureBuilder(
                future: toonDetailedModel,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Column(
                      children: [
                        Text(snapshot.data!.about),
                        Text('${snapshot.data!.genre} / ${snapshot.data!.age}'),
                      ],
                    );
                  } else {
                    return Text("...");
                  }
                }),
            FutureBuilder(
                future: toonEpisodes,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Column(
                      children: [
                        for (var episode in snapshot
                            .data!) //{} 없애니까 된다 {} 때문에 set<Text>가 생성되는데 그게 childeren[]이랑 겹쳐서 그런거임
                          Text(episode.title),
                      ],
                    );
                  } else {
                    return Text('');
                  }
                }),
          ],
        ),
      ),
    );
  }
}
