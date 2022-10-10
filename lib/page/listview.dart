// Create an infinite scrolling lazily loaded list

import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

class ListViewPage extends StatelessWidget {
  const ListViewPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Startup Name Generator',
      theme: ThemeData(
        primaryColor: Colors.white,
      ),
      home: const RandomWords(),
    );
  }
}

class RandomWords extends StatefulWidget {
  const RandomWords({Key? key}) : super(key: key);

  @override
  RandomWordsState createState() => RandomWordsState();
}

class RandomWordsState extends State<RandomWords> {
  final List<WordPair> suggestions = <WordPair>[];
  final TextStyle biggerFont = const TextStyle(fontSize: 18.0);
  final Set<WordPair> saved = <WordPair>{}; // 新增本行

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('这是一个顶部导航栏',style:TextStyle(color: Colors.black,fontSize: 16)),
        actions: <Widget>[
          IconButton(icon: const Icon(Icons.list), onPressed: pushSaved),
        ],
      ),
      body: buildSuggestions(),
    );
  }

  Widget buildSuggestions() {
    return ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemBuilder: (BuildContext context, int i) {
          if (i.isOdd) {
            return const Divider();
          }
          final int index = i ~/ 2;
          if (index >= suggestions.length) {
            suggestions.addAll(generateWordPairs().take(10));
          }
          return buildRow(suggestions[index]);
        });
  }

  Widget buildRow(WordPair pair) {
    final bool alreadySaved = saved.contains(pair);
    return ListTile(
      title: Text(
        pair.asPascalCase,
        style: biggerFont,
      ),
      trailing: Icon(
        alreadySaved ? Icons.favorite : Icons.favorite_border,
        color: alreadySaved ? Colors.red : null,
      ),
      onTap: () {
        setState(() {
          if (alreadySaved) {
            saved.remove(pair);
          } else {
            saved.add(pair);
          }
        });
      },
    );
  }

  void pushSaved() {
    Navigator.of(context).push(
      MaterialPageRoute<void>(
        builder: (BuildContext context) {
          final Iterable<ListTile> tiles = saved.map(
                (WordPair pair) {
              return ListTile(
                title: Text(
                  pair.asPascalCase,
                  style: biggerFont,
                ),
              );
            },
          );
          final List<Widget> divided = ListTile.divideTiles(
            context: context,
            tiles: tiles,
          ).toList();

          return Scaffold(
            appBar: AppBar(
              title: const Text('Saved Suggestions'),
            ),
            body: ListView(children: divided),
          );
        },
      ),
    );
  }
}
