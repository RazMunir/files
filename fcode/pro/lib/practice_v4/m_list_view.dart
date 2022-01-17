import 'package:flutter/material.dart';

class Song extends StatelessWidget {
  const Song({ this.title, this.author, this.likes });

  final String title;
  final String author;
  final int likes;

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme
        .of(context)
        .textTheme;
    return new Container(
      margin: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
      padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
      decoration: new BoxDecoration(
        color: Colors.grey.shade200.withOpacity(0.3),
        borderRadius: new BorderRadius.circular(5.0),
      ),
      child: new IntrinsicHeight(
        child: new Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            new Container(
              margin: const EdgeInsets.only(top: 4.0, bottom: 4.0, right: 10.0),
              child: new CircleAvatar(
                backgroundImage: new NetworkImage(
                    'http://thecatapi.com/api/images/get?format=src'
                        '&size=small&type=jpg#${title.hashCode}'
                ),
                radius: 20.0,
              ),
            ),
            new Expanded(
              child: new Container(
                child: new Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    new Text(title, style: textTheme.subhead),
                    new Text(author, style: textTheme.caption),
                  ],
                ),
              ),
            ),
            new Container(
              margin: new EdgeInsets.symmetric(horizontal: 5.0),
              child: new InkWell(
                child: new Icon(Icons.play_arrow, size: 40.0),
                onTap: () {
                  // TODO(implement)
                },
              ),
            ),
            new Container(
              margin: new EdgeInsets.symmetric(horizontal: 5.0),
              child: new InkWell(
                child: new Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    new Icon(Icons.favorite, size: 25.0),
                    new Text('${likes ?? ''}'),
                  ],
                ),
                onTap: () {
                  // TODO(implement)
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Feed extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new ListView(
      // scrollDirection: Axis.horizontal,
      children: [
        new Song(title: 'Trapadelic lobo', author: 'lillobobeats', likes: 4),
        new Song(title: 'Different', author: 'younglowkey', likes: 23),
        new Song(title: 'Future', author: 'younglowkey', likes: 2),
        new Song(title: 'ASAP', author: 'tha_producer808', likes: 13),
        new Song(title: '🌲🌲🌲', author: 'TraphousePeyton'),
        new Song(title: 'Something sweet...', author: '6ryan'),
        new Song(title: 'Sharpie', author: 'Fergie_6'),
        new Song(title: 'Sharpie', author: 'Fergie_6'),
        new Song(title: 'Sharpie', author: 'Fergie_6'),
        new Song(title: 'Sharpie', author: 'Fergie_6'),
        new Song(title: 'Sharpie', author: 'Fergie_6'),
        new Song(title: 'Sharpie', author: 'Fergie_6'),
        new Song(title: 'Sharpie', author: 'Fergie_6'),
        new Song(title: 'Sharpie', author: 'Fergie_6'),
      ],
    );
  }
}