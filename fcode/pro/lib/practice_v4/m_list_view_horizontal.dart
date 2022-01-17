import 'package:flutter/material.dart';

class SongHoz extends StatelessWidget {
  const SongHoz({this.title, this.author, this.likes});

  final String title;
  final String author;
  final int likes;

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return Container(
      width: 80,
      height: 20,
      margin: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
      padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
      decoration: new BoxDecoration(
        // color: Colors.grey.shade200.withOpacity(0.3),

        color: Colors.cyanAccent,
        borderRadius: new BorderRadius.circular(5.0),
      ),
      child: new Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          new Container(
            margin: const EdgeInsets.only(top: 4.0, bottom: 4.0, right: 10.0),
            child: new CircleAvatar(
              backgroundImage: new NetworkImage(
                  'http://thecatapi.com/api/images/get?format=src'
                  '&size=small&type=jpg#${title.hashCode}'),
              radius: 20.0,
            ),
          ),
        ],
      ),
    );
  }
}

class FeedHoz extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      child: Column(
        children: [
          Container(
            height: 50,
            color: Colors.yellowAccent,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                new SongHoz(
                    title: 'Trapadelic lobo', author: 'lillobobeats', likes: 4),
                new SongHoz(
                    title: 'Different', author: 'younglowkey', likes: 23),
                new SongHoz(title: 'Future', author: 'younglowkey', likes: 2),
                new SongHoz(
                    title: 'ASAP', author: 'tha_producer808', likes: 13),
                new SongHoz(title: '🌲🌲🌲', author: 'TraphousePeyton'),
                new SongHoz(title: 'Something sweet...', author: '6ryan'),
                new SongHoz(title: 'Sharpie', author: 'Fergie_6'),
                new SongHoz(title: 'Sharpie', author: 'Fergie_6'),
                new SongHoz(title: 'Sharpie', author: 'Fergie_6'),
                new SongHoz(title: 'Sharpie', author: 'Fergie_6'),
                new SongHoz(title: 'Sharpie', author: 'Fergie_6'),
                new SongHoz(title: 'Sharpie', author: 'Fergie_6'),
                new SongHoz(title: 'Sharpie', author: 'Fergie_6'),
                new SongHoz(title: 'Sharpie', author: 'Fergie_6'),
              ],
            ),
          )
        ],
      ),
    );
  }
}
