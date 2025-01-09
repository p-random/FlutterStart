import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MyAppState(),
      child: MaterialApp(
        title: 'Namer App',
        theme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.red),
        ),
        home: MyHomePage(),
      ),
    );
  }
}

class MyAppState extends ChangeNotifier {
  var current = WordPair.random();

  void update() {
    current = WordPair.random();
    notifyListeners();
  }
}

class Bigcard extends StatelessWidget{
  const Bigcard({
    super.key,
    required this.pair,
  });

  final WordPair pair;

  @override
  Widget build(BuildContext context){
    final theme = Theme.of(context);
    final style = theme.textTheme.bodyMedium!.copyWith(
      color : theme.colorScheme.onPrimary,
    );
    return Card(
      color: theme.colorScheme.primary,
      child :
      Padding(
          padding : const EdgeInsets.all(20),
          child : Text(pair.asLowerCase, style : style,)
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();
    var mixedText = appState.current;
    return Scaffold(
        body: Center(
          child : Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('A random idea:'),
              Bigcard(
                  pair : mixedText
              ),
              SizedBox(height : 5),
              ElevatedButton(
                  onPressed: () {
                    appState.update();
                  },
                  child: Text('next')),
            ],
          ),
        )
    );
  }
}