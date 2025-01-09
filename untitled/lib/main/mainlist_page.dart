import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:convert';

class MainPage extends StatefulWidget{
  const MainPage({super.key});

  @override
  State<StatefulWidget> createState(){
    return _MainPage();
  }
}

class _MainPage extends State<MainPage> {
  @override
  Widget build(BuildContext context){
    return Scaffold(
      body : FutureBuilder(
          future: loadAsset(),
          builder: (context, snapshot){
            if (snapshot.connectionState case ConnectionState.active) {
              return const Center(
                child : CircularProgressIndicator()
              );
            } else if (snapshot.connectionState case ConnectionState.done) {
              Map<String, dynamic> list = jsonDecode(snapshot.data!);
              return ListView.builder(
                            return prototypeItem: InkWell(
              child : SizedBox(
                height: 50,
                child: Card(
                  child:
                    Text(list['question'][value]['tilte'].toString()),
                )
              )
                            )
                          );
            }
          }
      )
    );
  }

  Future<String> loadAsset() async{
    return await rootBundle.loadString('res/api/list.json');
  }
}