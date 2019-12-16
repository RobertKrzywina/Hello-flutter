import 'dart:math';

import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: 'Flutter!', home: RandomWords());
  }
}

class RandomWordsState extends State<RandomWords> {
  final _suggestions = <WordPair>[];
  final _biggerFont = const TextStyle(fontSize: 18.0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Hello flutter')),
        body: _buildSuggestions());
  }

  Widget _buildSuggestions() {
    return ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemBuilder: (context, i) {
          if (i.isOdd) {
            return Divider();
          }
          final index = i ~/ 2;
          if (index >= _suggestions.length) {
            _suggestions.addAll(generateWordPairs().take(10));
          }
          return _buildRow(_suggestions[index]);
        });
  }

  Widget _buildRow(WordPair pair) {
    return ListTile(
      title: Text(
        pair.asPascalCase,
        style: _biggerFont,
      ),
      leading: Icon(_getRandomIcon()),
      subtitle: Text(DateFormat('dd-MM-yyyy').format(DateTime.now())),
    );
  }

  IconData _getRandomIcon() {
    List icons = [
      Icons.home,
      Icons.people,
      Icons.monetization_on,
      Icons.computer,
      Icons.directions_car
    ];
    return icons[Random().nextInt(5)];
  }
}

class RandomWords extends StatefulWidget {
  @override
  State createState() => RandomWordsState();
}
