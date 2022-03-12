import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
class RandomWords extends StatefulWidget {
  const RandomWords({Key? key}) : super(key: key);

  @override
  State<RandomWords> createState() => _RandomWordsState();
}

class _RandomWordsState extends State<RandomWords> {

  @override
  final randomWordPairs = <WordPair>[];
  final savedwordpair = <WordPair>{};


  Widget _buildList() {
    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemBuilder: (context, item) {
        if (item.isOdd)
          return Divider();

        final index = item ~/ 2;
        if (index >= randomWordPairs.length) {
          randomWordPairs.addAll(generateWordPairs().take(15));
        }
        return buildRow(randomWordPairs[index]);
      },
    );
  }
  Widget buildRow(WordPair pair){

    final alreadysaved = savedwordpair.contains(pair);
    return ListTile(
        title: Text(pair.asPascalCase,
            style: TextStyle(
                fontSize: 18
            )), trailing: Icon(alreadysaved ? Icons.favorite : Icons.favorite_border, color: alreadysaved
      ? Colors.red: null), onTap: (){
          setState(() {
            if (alreadysaved)
{
  savedwordpair.remove(pair);
}
            else {
              savedwordpair.add(pair);
            }

          });

    },);
  }
void pushsaved(){
    Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context){
      final Iterable<ListTile>tiles =savedwordpair.map((WordPair pair){
        return ListTile(
          title: Text(pair.asPascalCase, style: TextStyle(fontSize: 16)),
        );
      });
      final Iterable<Widget> divided = ListTile.divideTiles(tiles: tiles, context: context).toList();

      return Scaffold(
        appBar: AppBar(
          title: Text("Favourite Pairs"),
        ),
        body: ListView(children: divided.toList()) );

    }
    )
    );

}

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text("WordPair Generator"),
        actions: [IconButton(onPressed:pushsaved, icon: Icon(Icons.list))],),
        body: _buildList());


  }
}


