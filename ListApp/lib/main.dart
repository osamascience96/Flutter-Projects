import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

void main() => runApp(List()); 

class RandomWords extends StatefulWidget {
  @override
  RandomWordsState createState() => RandomWordsState();
}

// This class persists over the lifetime of the widget
class RandomWordsState extends State {
  final  _suggestions = <WordPair>[];
  final Set<WordPair> _saved = Set<WordPair>();
  final TextStyle _biggerFont = const TextStyle(fontSize: 18.0);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(16.0),
      itemBuilder: (context, i) {
        if (i.isOdd) return Divider();

        final index = i;
        if (index >= _suggestions.length) {
          _suggestions.addAll(generateWordPairs().take(10));
        }
        return _buildRow(_suggestions[index]);
      },
    );
  }

  // the function is called, everytime when the view is reused.
  Widget _buildRow(WordPair pair) {
    // create the boolean variable that checks if the wordpair is already in the Set...
    final bool alreadySaved = _saved.contains(pair);
    return ListTile(
      title: Text(
        pair.asPascalCase,
        style: _biggerFont,
      ),
      trailing: Icon(
        alreadySaved ? Icons.favorite : Icons.favorite_border,
        color: alreadySaved ? Colors.red : null,
      ),
      onTap: () {
        setState(() {
          if (alreadySaved) {
            _saved.remove(pair);
          } else {
            _saved.add(pair);
          }
        });
      },
    );
  }
}


class List extends StatefulWidget {
  @override
  ListState createState() => ListState();
}

class ListState extends State{

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        title: Text("Flutter List Application"),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.list),),
        ],
      ),
      body: Center(
        child: RandomWords(),
      ),
    ));
  }

}