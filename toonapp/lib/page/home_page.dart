import 'package:flutter/material.dart';
import 'package:toonapp/api/GetData.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
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
          future: ApiService().getTodayToons(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Text("$snapshot");
            } else {
              return Text("loading..");
            }
          },
        ));
  }
}
