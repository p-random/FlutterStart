import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:toonapp/api/getdata.dart';
import 'package:toonapp/data/toon_detailed_model.dart';
import 'package:toonapp/data/toon_episode.dart';
import 'episode_wiget.dart';
import 'package:shared_preferences_android/shared_preferences_android.dart';

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
  late SharedPreferences prefs;
  bool isLiked = false;

  getPreferences() async {
    prefs = await SharedPreferences.getInstance();
    final likedList = prefs.getStringList('likedList');
    if (likedList != null) {
      if (likedList.contains(widget.id)) {
        setState(() {
          isLiked = true;
        });
      }
    } else {
      await prefs.setStringList('likedList', []);
    } //이거가 계속 warning이 났던 이유는 setInstance를 통해 초기화 해줘야 됐기 때문.
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    toonDetailedModel = ApiService().getDetailedById(widget.id);
    toonEpisodes = ApiService().getEpisodesById(widget.id);
    getPreferences();
  }

  editLikedList() async {
    final likedList = prefs.getStringList('likedList');
    if (likedList != null) {
      if (isLiked) {
        likedList.remove(widget.id);
        setState(() {
          isLiked = false;
        });
      } else {
        likedList.add(widget.id);
        setState(() {
          isLiked = true;
        });
      }
    }
    await prefs.setStringList('likedList', likedList!);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 4,
        backgroundColor: Colors.green,
        actions: [
          IconButton(
              onPressed: editLikedList,
              icon: isLiked
                  ? Icon(Icons.favorite)
                  : Icon(Icons.favorite_border_outlined)),
        ],
        title: Text(
          widget.title,
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
        ),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: const EdgeInsets.all(50.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 50,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
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
                ],
              ),
              SizedBox(
                height: 20,
              ),
              FutureBuilder(
                  future: toonDetailedModel,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(snapshot.data!.about),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                              '${snapshot.data!.genre} / ${snapshot.data!.age}'),
                        ],
                      );
                    } else {
                      return Text("...");
                    }
                  }),
              SizedBox(
                height: 13,
              ),
              FutureBuilder(
                  future: toonEpisodes,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return Column(
                        children: [
                          for (var episode in snapshot
                              .data!) //{} 없애니까 된다 {} 때문에 set<Text>가 생성되는데 그게 childeren[]이랑 겹쳐서 그런거임
                            EpisodeWidget(episode: episode, titleId: widget.id),
                        ],
                      );
                    } else {
                      return Text('');
                    }
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
